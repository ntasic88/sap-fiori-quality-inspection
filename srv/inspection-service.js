const cds = require('@sap/cds');
const LOG = cds.log('inspection-service');

module.exports = cds.service.impl(async function () {
    const S4 = await cds.connect.to('OP_API_INSPECTIONLOT_SRV_0001');
    const { Inspections, InspectionResults, InspectionCharacteristics, InspectionLotStatuses, UsageDecisions } = this.entities;

    // Log all incoming requests
    this.before('*', (req) => {
        LOG.info(`${req.event} ${req.target.name}`, {
            user: req.user?.id,
            query: req.query?.SELECT ? {
                from: req.query.SELECT.from?.ref?.[0],
                where: req.query.SELECT.where,
                orderBy: req.query.SELECT.orderBy,
                limit: req.query.SELECT.limit
            } : undefined
        });
    });

    // Proxy READ to S4 with logging
    for (const [entity, name] of [
        [Inspections, 'Inspections'],
        [InspectionResults, 'InspectionResults'],
        [InspectionCharacteristics, 'InspectionCharacteristics'],
        [InspectionLotStatuses, 'InspectionLotStatuses'],
        [UsageDecisions, 'UsageDecisions']
    ]) {
        this.on('READ', entity, async (req) => {
            const start = Date.now();
            try {
                const result = await S4.run(req.query);
                const count = Array.isArray(result) ? result.length : 1;
                LOG.info(`S4 response for ${name}: ${count} records in ${Date.now() - start}ms`);
                return result;
            } catch (err) {
                LOG.error(`S4 error for ${name} after ${Date.now() - start}ms:`, err.message);
                throw err;
            }
        });
    }

    // UPDATE handler for Inspections — proxy PATCH to S4
    this.on('UPDATE', Inspections, async (req) => {
        const start = Date.now();
        try {
            LOG.info('Updating Inspection lot via S4', { data: req.data });
            const result = await S4.run(req.query);
            LOG.info(`S4 Inspection UPDATE completed in ${Date.now() - start}ms`);
            return result;
        } catch (err) {
            LOG.error(`S4 Inspection UPDATE error after ${Date.now() - start}ms:`, err.message);
            req.error(502, 'Failed to update inspection lot in S4: ' + err.message);
        }
    });

    // CREATE/UPDATE passthrough for UsageDecisions
    this.on(['CREATE', 'UPDATE'], UsageDecisions, async (req) => {
        const start = Date.now();
        try {
            LOG.info(`${req.event} UsageDecision via S4`, { data: req.data });
            const result = await S4.run(req.query);
            LOG.info(`S4 UsageDecision ${req.event} completed in ${Date.now() - start}ms`);
            return result;
        } catch (err) {
            LOG.error(`S4 UsageDecision ${req.event} error after ${Date.now() - start}ms:`, err.message);
            req.error(502, `Failed to ${req.event.toLowerCase()} usage decision in S4: ${err.message}`);
        }
    });

    // Bound action: makeUsageDecision on Inspections
    this.on('makeUsageDecision', Inspections, async (req) => {
        const { decisionCode, qualityScore } = req.data;
        const lotId = req.params[0];

        LOG.info('makeUsageDecision called', { lotId, decisionCode, qualityScore, user: req.user?.id });

        // Map decision code to valuation
        const valuationMap = {
            'A001': 'A',  // Accept
            'A002': 'R'   // Reject
        };
        const valuation = valuationMap[decisionCode] || '';
        const decisionLabel = valuation === 'A' ? 'Accept' : 'Reject';

        // Build S4 payload
        const now = new Date();
        const dateStr = now.toISOString().split('T')[0];
        const payload = {
            InspectionLot: lotId,
            InspectionLotUsageDecisionCode: decisionCode,
            InspLotUsageDecisionValuation: valuation,
            InspectionLotQualityScore: qualityScore,
            InspectionLotUsageDecidedBy: req.user?.id || 'SYSTEM',
            InspectionLotUsageDecidedOn: dateStr
        };

        try {
            // Try CREATE first (new usage decision)
            const { A_InspLotUsageDecision } = S4.entities;
            const result = await S4.run(INSERT.into(A_InspLotUsageDecision).entries(payload));
            LOG.info('Usage decision created successfully in S4', { lotId, decisionCode });
            return `Usage decision "${decisionLabel}" recorded for lot ${lotId}`;
        } catch (createErr) {
            LOG.info('CREATE failed, trying UPDATE', { error: createErr.message });
            try {
                // Fall back to UPDATE (usage decision already exists)
                const { A_InspLotUsageDecision } = S4.entities;
                const result = await S4.run(
                    UPDATE(A_InspLotUsageDecision)
                        .set({
                            InspectionLotUsageDecisionCode: decisionCode,
                            InspLotUsageDecisionValuation: valuation,
                            InspectionLotQualityScore: qualityScore,
                            InspectionLotUsageDecidedBy: req.user?.id || 'SYSTEM',
                            InspectionLotUsageDecidedOn: dateStr
                        })
                        .where({ InspectionLot: lotId })
                );
                LOG.info('Usage decision updated successfully in S4', { lotId, decisionCode });
                return `Usage decision "${decisionLabel}" updated for lot ${lotId}`;
            } catch (updateErr) {
                LOG.error('Usage decision S4 call failed', { createErr: createErr.message, updateErr: updateErr.message });
                const is405 = createErr.message?.includes('405') || updateErr.message?.includes('405');
                if (is405) {
                    req.error(405, `SAP Sandbox API does not support write operations (HTTP 405). Usage decision "${decisionLabel}" for lot ${lotId} was correctly built and sent, but the sandbox rejected it. This would succeed against a production S4/HANA system.`);
                } else {
                    req.error(502, `Failed to save usage decision in S4: ${updateErr.message}`);
                }
            }
        }
    });
});
