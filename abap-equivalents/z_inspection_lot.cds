@AbapCatalog.sqlViewName: 'ZVINSP_LOT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Quality Inspection Lot'

@ObjectModel.semanticKey: ['InspectionLotID']
@ObjectModel.representativeKey: 'InspectionLotID'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true

@OData.publish: true

define view Z_INSPECTION_LOT
  as select from qals as InspectionLot  -- QALS = SAP QM Inspection Lot table
  association [0..*] to Z_INSPECTION_RESULT as _Results
    on $projection.InspectionLotID = _Results.InspectionLotID
{
      @ObjectModel.readOnly: true
  key InspectionLot.prueflos              as InspectionLotID,

      @ObjectModel.mandatory: true
      InspectionLot.matnr                 as MaterialNumber,

      @Semantics.text: true
      InspectionLot.maktx                 as MaterialDescription,

      @ObjectModel.mandatory: true
      InspectionLot.werk                  as Plant,

      InspectionLot.art                   as InspectionType,

      @ObjectModel.readOnly: true
      case InspectionLot.stat
        when '01' then 'Created'
        when '02' then 'In Progress'
        when '03' then 'Completed'
        when '04' then 'Rejected'
        else 'Unknown'
      end                                 as Status,

      @Semantics.systemDate.createdAt: true
      InspectionLot.erdat                 as CreatedDate,

      InspectionLot.prufer                as Inspector,

      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      InspectionLot.lmenge01              as Quantity,

      @Semantics.unitOfMeasure: true
      InspectionLot.mengeneinh            as UnitOfMeasure,

      InspectionLot.charg                 as BatchNumber,

      -- Expose association for navigation
      _Results
}


-----------------------------------------------------------------------
-- Associated CDS View for Inspection Results
-----------------------------------------------------------------------
@AbapCatalog.sqlViewName: 'ZVINSP_RESULT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Quality Inspection Result'

@ObjectModel.semanticKey: ['ResultID']

define view Z_INSPECTION_RESULT
  as select from qase as InspectionResult  -- QASE = SAP QM Results table
  association [1..1] to Z_INSPECTION_LOT as _InspectionLot
    on $projection.InspectionLotID = _InspectionLot.InspectionLotID
{
  key InspectionResult.ergebnis_id        as ResultID,
      InspectionResult.prueflos           as InspectionLotID,
      InspectionResult.merkmal            as CharacteristicName,
      InspectionResult.sollwert           as TargetValue,
      InspectionResult.istwert            as ActualValue,
      InspectionResult.einheit            as Unit,
      InspectionResult.toleranz           as Tolerance,

      case InspectionResult.bewertung
        when 'A' then 'Pass'
        when 'R' then 'Fail'
        else 'Pending'
      end                                 as Valuation,

      -- Navigation back to parent
      _InspectionLot
}
