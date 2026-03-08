const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Inspections, InspectionResults, ChangeLog } = this.entities;

    // --- Audit Trail Helper ---
    async function logChange(InspectionLotID, user, action, field, oldValue, newValue) {
        await INSERT.into(ChangeLog).entries({
            ID: cds.utils.uuid(),
            inspection_InspectionLotID: InspectionLotID,
            timestamp: new Date().toISOString(),
            user: user,
            action: action,
            field: field,
            oldValue: oldValue != null ? String(oldValue) : null,
            newValue: newValue != null ? String(newValue) : null
        });
    }

    // --- CREATE ---
    this.before('CREATE', 'Inspections', async (req) => {
        if (!req.data.InspectionLotID) {
            const result = await SELECT.one
                .from(Inspections)
                .columns('max(InspectionLotID) as maxId');

            const maxId = result?.maxId ? parseInt(result.maxId, 10) : 100000000;
            req.data.InspectionLotID = String(maxId + 1);
        }

        if (!req.data.Status) {
            req.data.Status = 'Created';
        }
        if (!req.data.CreatedDate) {
            req.data.CreatedDate = new Date().toISOString().split('T')[0];
        }
    });

    this.after('CREATE', 'Inspections', async (data, req) => {
        const user = req.user?.id || 'anonymous';
        await logChange(data.InspectionLotID, user, 'CREATE', null, null,
            `Inspection lot created for ${data.MaterialDescription} (${data.MaterialNumber})`);
    });

    // --- UPDATE ---
    this.before('UPDATE', 'Inspections', async (req) => {
        if (req.data.Status) {
            const current = await SELECT.one.from(Inspections, req.data.InspectionLotID);
            if (current) {
                const allowedTransitions = {
                    'Created': ['In Progress'],
                    'In Progress': ['Completed', 'Rejected'],
                    'Completed': [],
                    'Rejected': []
                };
                const allowed = allowedTransitions[current.Status] || [];
                if (!allowed.includes(req.data.Status)) {
                    req.error(409, `Cannot change status from "${current.Status}" to "${req.data.Status}"`);
                }
            }
        }
    });

    this.after('UPDATE', 'Inspections', async (data, req) => {
        const user = req.user?.id || 'anonymous';
        const lotId = data.InspectionLotID || req.data.InspectionLotID;

        // Log each changed field
        const tracked = [
            'MaterialNumber', 'MaterialDescription', 'Plant', 'InspectionType',
            'Status', 'Inspector', 'Quantity', 'UnitOfMeasure', 'BatchNumber'
        ];

        // Get the current state to compare
        const current = await SELECT.one.from(Inspections).where({ InspectionLotID: lotId });

        for (const field of tracked) {
            if (req.data[field] !== undefined) {
                await logChange(lotId, user, 'UPDATE', field,
                    req.data['_' + field] || '', String(req.data[field]));
            }
        }
    });

    // --- Usage Decision ---
    this.on('recordUsageDecision', 'Inspections', async (req) => {
        const { InspectionLotID } = req.params[0];
        const { decision } = req.data;

        if (!['Accept', 'Reject'].includes(decision)) {
            return req.error(400, 'Decision must be "Accept" or "Reject"');
        }

        const inspection = await SELECT.one.from(Inspections).where({ InspectionLotID });
        if (!inspection) {
            return req.error(404, `Inspection lot ${InspectionLotID} not found`);
        }

        if (inspection.Status === 'Completed' || inspection.Status === 'Rejected') {
            return req.error(409, 'Usage decision has already been recorded for this inspection lot');
        }

        const results = await SELECT.from(InspectionResults)
            .where({ inspection_InspectionLotID: InspectionLotID });
        if (results.length === 0) {
            return req.error(422, 'Cannot record usage decision without inspection results');
        }

        const newStatus = decision === 'Accept' ? 'Completed' : 'Rejected';
        const today = new Date().toISOString().split('T')[0];
        const user = req.user?.id || 'anonymous';

        await UPDATE(Inspections)
            .set({
                Status: newStatus,
                UsageDecisionCode: decision,
                UsageDecisionDate: today
            })
            .where({ InspectionLotID });

        // Audit trail for usage decision
        await logChange(InspectionLotID, user, 'USAGE_DECISION', 'Status',
            inspection.Status, newStatus);
        await logChange(InspectionLotID, user, 'USAGE_DECISION', 'UsageDecisionCode',
            null, decision);

        return SELECT.one.from(Inspections).where({ InspectionLotID });
    });
});
