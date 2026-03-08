const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const S4 = await cds.connect.to('OP_API_INSPECTIONLOT_SRV_0001');
    const { Inspections, InspectionResults, InspectionCharacteristics, InspectionLotStatuses, UsageDecisions } = this.entities;

    this.on('READ', Inspections, req => S4.run(req.query));
    this.on('READ', InspectionResults, req => S4.run(req.query));
    this.on('READ', InspectionCharacteristics, req => S4.run(req.query));
    this.on('READ', InspectionLotStatuses, req => S4.run(req.query));
    this.on('READ', UsageDecisions, req => S4.run(req.query));
});
