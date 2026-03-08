const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Inspections, InspectionResults } = this.entities;

    // Auto-generate InspectionLotID and set defaults on create
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

    // Validate status transitions on direct update
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

    // Record Usage Decision — bound action on Inspections
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

        await UPDATE(Inspections)
            .set({
                Status: newStatus,
                UsageDecisionCode: decision,
                UsageDecisionDate: today
            })
            .where({ InspectionLotID });

        return SELECT.one.from(Inspections).where({ InspectionLotID });
    });
});
