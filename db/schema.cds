namespace qi.db;

entity Inspections {
    key InspectionLotID     : String(12);
        MaterialNumber      : String(20);
        MaterialDescription : String(100);
        Plant               : String(4);
        InspectionType      : String(40);
        Status              : String(20) default 'Created';
        CreatedDate         : Date;
        Inspector           : String(80);
        Quantity            : Integer;
        UnitOfMeasure       : String(4);
        BatchNumber         : String(20);
        UsageDecisionCode   : String(10);
        UsageDecisionDate   : Date;
        Results             : Composition of many InspectionResults on Results.inspection = $self;
        Changes             : Composition of many ChangeLog on Changes.inspection = $self;
}

entity InspectionResults {
    key ResultID            : String(10);
        inspection          : Association to Inspections;
        CharacteristicName  : String(80);
        TargetValue         : String(20);
        ActualValue         : String(20);
        Unit                : String(20);
        Tolerance           : String(20);
        Valuation           : String(10);
}

// GxP Audit Trail — immutable log of all changes (21 CFR Part 11 / EU Annex 11)
entity ChangeLog {
    key ID                  : UUID;
        inspection          : Association to Inspections;
        timestamp           : Timestamp;
        user                : String(80);
        action              : String(20);  // CREATE, UPDATE, USAGE_DECISION
        field               : String(50);
        oldValue            : String(200);
        newValue            : String(200);
}
