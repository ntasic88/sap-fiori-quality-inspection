const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    this.before('CREATE', 'Inspections', async (req) => {
        const { Inspections } = this.entities;

        // Auto-generate InspectionLotID if not provided
        if (!req.data.InspectionLotID) {
            const result = await SELECT.one
                .from(Inspections)
                .columns('max(InspectionLotID) as maxId');

            const maxId = result?.maxId ? parseInt(result.maxId, 10) : 100000000;
            req.data.InspectionLotID = String(maxId + 1);
        }

        // Set defaults
        if (!req.data.Status) {
            req.data.Status = 'Created';
        }
        if (!req.data.CreatedDate) {
            req.data.CreatedDate = new Date().toISOString().split('T')[0];
        }
    });

});
