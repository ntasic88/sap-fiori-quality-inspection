using { OP_API_INSPECTIONLOT_SRV_0001 as S4 } from './external/OP_API_INSPECTIONLOT_SRV_0001';

@path: '/odata/v4/InspectionService'
@requires: 'authenticated-user'
service InspectionService {

    entity Inspections as projection on S4.A_InspectionLot {
        key InspectionLot as InspectionLotID,
        Material as MaterialNumber,
        InspectionLotObjectText as MaterialDescription,
        Plant,
        InspectionLotType as InspectionType,
        InspectionLotQuantity as Quantity,
        InspectionLotActualQuantity as ActualQuantity,
        InspectionLotDefectiveQuantity as DefectiveQuantity,
        InspectionLotQuantityUnit as UnitOfMeasure,
        Batch as BatchNumber,
        InspLotCreatedOnLocalDate as CreatedDate,
        InspectionLotCreatedBy as CreatedBy,
        InspectionLotHasUsageDecision as HasUsageDecision,
        ManufacturingOrder,
        InspectionLotStartDate as StartDate,
        InspectionLotEndDate as EndDate,
        Supplier,
        PurchasingOrganization,
        PurchasingDocument,
        InspectionLotText as LotDescription,
        InspLotIsStockPostingCompleted as IsStockPostingCompleted,
        SalesOrder,
        SalesOrderItem,
        InspectionLotChangedBy as ChangedBy,
        InspectionLotChangeDate as ChangeDate
    } actions {
        action makeUsageDecision(decisionCode: String(4), qualityScore: Integer) returns String;
    };

    @readonly
    entity InspectionResults as projection on S4.A_InspectionResult {
        key InspectionLot,
        key InspPlanOperationInternalID,
        key InspectionCharacteristic,
        InspectionResultText as CharacteristicName,
        InspResultFrmtdMeanValue as MeanValue,
        InspectionValuationResult as Valuation,
        Inspector,
        InspResultValidValuesNumber as SampleSize,
        InspResultFrmtdMaximumValue as MaxValue,
        InspResultFrmtdMinimumValue as MinValue,
        InspectionResultStatus as ResultStatus,
        InspectionStartDate,
        InspectionEndDate
    };

    @readonly
    entity InspectionCharacteristics as projection on S4.A_InspectionCharacteristic {
        key InspectionLot,
        key InspPlanOperationInternalID,
        key InspectionCharacteristic,
        InspectionSpecificationText as CharacteristicName,
        InspSpecIsQuantitative as IsQuantitative,
        InspectionSpecificationUnit as Unit,
        InspSpecFrmtdTargetValue as TargetValue,
        InspSpecFrmtdUpperLimit as UpperLimit,
        InspSpecFrmtdLowerLimit as LowerLimit,
        InspSpecHasTargetValue as HasTargetValue,
        InspSpecHasUpperLimit as HasUpperLimit,
        InspSpecHasLowerLimit as HasLowerLimit,
        InspCharacteristicSampleSize as SampleSize,
        InspectionCharacteristicStatus as Status
    };

    @readonly
    entity InspectionLotStatuses as projection on S4.A_InspectionLotWithStatus {
        key InspectionLot,
        InspectionLotStatusCreated as IsCreated,
        InspectionLotStatusReleased as IsReleased,
        InspLotStatusRsltsConfirmed as IsResultsConfirmed,
        InspLotStsShrtTrmInspCmpltd as IsShortTermCompleted,
        InspLotStatusInspCompleted as IsInspectionCompleted,
        InspLotStatusCanceled as IsCanceled,
        InspLotStatusRepair as IsRepair,
        InspLotStsDefectsRecorded as HasDefectsRecorded
    };

    entity UsageDecisions as projection on S4.A_InspLotUsageDecision {
        key InspectionLot,
        InspectionLotUsageDecisionCode as UsageDecisionCode,
        InspectionLotUsageDecidedOn as UsageDecisionDate,
        InspectionLotUsageDecidedBy as DecidedBy,
        InspectionLotQualityScore as QualityScore,
        InspLotUsageDecisionValuation as Valuation,
        InspLotUsgeDcsnFollowUpAction as FollowUpAction,
        InspLotUsageDecisionChangedBy as ChangedBy,
        InspLotUsageDecisionChangedOn as ChangedDate
    };
}
