const cds = require('@sap/cds/lib');

describe('InspectionService', () => {
    const { GET, POST, expect } = cds.test(__dirname + '/..');

    const auth = { auth: { username: 'manager', password: 'manager' } };

    describe('Authentication', () => {
        it('should reject unauthenticated requests', async () => {
            try {
                await GET('/odata/v4/InspectionService/Inspections');
                expect.fail('Should have rejected');
            } catch (e) {
                expect(e.response.status).to.equal(401);
            }
        });
    });

    describe('READ operations', () => {
        it('should return all inspections', async () => {
            const { data } = await GET('/odata/v4/InspectionService/Inspections', auth);
            expect(data.value).to.be.an('array');
            expect(data.value.length).to.equal(8);
        });

        it('should return a single inspection with expanded results', async () => {
            const { data } = await GET(
                "/odata/v4/InspectionService/Inspections('100000001')?$expand=Results",
                auth
            );
            expect(data.InspectionLotID).to.equal('100000001');
            expect(data.Results).to.be.an('array');
            expect(data.Results.length).to.equal(3);
        });

        it('should filter inspections by status', async () => {
            const { data } = await GET(
                "/odata/v4/InspectionService/Inspections?$filter=Status eq 'Completed'",
                auth
            );
            expect(data.value).to.be.an('array');
            data.value.forEach(i => expect(i.Status).to.equal('Completed'));
        });
    });

    describe('CREATE operations', () => {
        it('should create a new inspection with auto-generated ID', async () => {
            const { data } = await POST('/odata/v4/InspectionService/Inspections', {
                MaterialNumber: 'MAT-TEST',
                MaterialDescription: 'Test Material',
                Plant: 'DE01',
                InspectionType: '01 - Goods Receipt',
                Inspector: 'Test Inspector',
                Quantity: 1000,
                UnitOfMeasure: 'TAB',
                BatchNumber: 'BATCH-TEST-001'
            }, auth);

            expect(data.InspectionLotID).to.be.a('string');
            expect(data.Status).to.equal('Created');
            expect(data.CreatedDate).to.be.a('string');
        });
    });

    describe('Usage Decision', () => {
        it('should accept an inspection lot with results', async () => {
            // Lot 100000002 is "In Progress" and has results (R004-R006)
            const { data } = await POST(
                "/odata/v4/InspectionService/Inspections('100000002')/InspectionService.recordUsageDecision",
                { decision: 'Accept' },
                auth
            );
            expect(data.Status).to.equal('Completed');
            expect(data.UsageDecisionCode).to.equal('Accept');
            expect(data.UsageDecisionDate).to.be.a('string');
        });

        it('should reject an inspection lot with results', async () => {
            // Lot 100000005 is "In Progress" and has results (R012-R013)
            const { data } = await POST(
                "/odata/v4/InspectionService/Inspections('100000005')/InspectionService.recordUsageDecision",
                { decision: 'Reject' },
                auth
            );
            expect(data.Status).to.equal('Rejected');
            expect(data.UsageDecisionCode).to.equal('Reject');
        });

        it('should reject usage decision on already decided lots', async () => {
            // Lot 100000001 is already "Completed" with decision "Accept"
            try {
                await POST(
                    "/odata/v4/InspectionService/Inspections('100000001')/InspectionService.recordUsageDecision",
                    { decision: 'Accept' },
                    auth
                );
                expect.fail('Should have failed');
            } catch (e) {
                expect(e.response.status).to.equal(409);
            }
        });

        it('should reject usage decision on lots without results', async () => {
            // Create a new lot (no results)
            const { data: newLot } = await POST('/odata/v4/InspectionService/Inspections', {
                MaterialNumber: 'MAT-NORES',
                MaterialDescription: 'No Results Material',
                Plant: 'DE01',
                InspectionType: '01 - Goods Receipt',
                Inspector: 'Test Inspector',
                Quantity: 100,
                UnitOfMeasure: 'TAB',
                BatchNumber: 'BATCH-NORES'
            }, auth);

            try {
                await POST(
                    `/odata/v4/InspectionService/Inspections('${newLot.InspectionLotID}')/InspectionService.recordUsageDecision`,
                    { decision: 'Accept' },
                    auth
                );
                expect.fail('Should have failed');
            } catch (e) {
                expect(e.response.status).to.equal(422);
            }
        });

        it('should reject invalid decision values', async () => {
            // Lot 100000004 is "Created" and has results
            try {
                await POST(
                    "/odata/v4/InspectionService/Inspections('100000004')/InspectionService.recordUsageDecision",
                    { decision: 'Maybe' },
                    auth
                );
                expect.fail('Should have failed');
            } catch (e) {
                expect(e.response.status).to.be.oneOf([400, 500]);
            }
        });
    });
});
