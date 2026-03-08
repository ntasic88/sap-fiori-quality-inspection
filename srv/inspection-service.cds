using qi.db from '../db/schema';

@path: '/odata/v4/InspectionService'
@requires: 'authenticated-user'
service InspectionService {
    entity Inspections as projection on db.Inspections actions {
        @(requires: 'QualityManager')
        action recordUsageDecision(decision : String(10)) returns Inspections;
    }
    entity InspectionResults as projection on db.InspectionResults;
}
