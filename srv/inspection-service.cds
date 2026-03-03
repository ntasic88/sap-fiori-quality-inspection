using qi.db from '../db/schema';

@path: '/odata/v4/InspectionService'
service InspectionService {
    entity Inspections as projection on db.Inspections;
    entity InspectionResults as projection on db.InspectionResults;
}
