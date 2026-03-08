/* checksum : 25bdd54f5e5b8172c2891d4c2f2a9d86 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service OP_API_INSPECTIONLOT_SRV_0001 {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Inspection Characteristics'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionCharacteristic {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Insp. Characteristic'
  @sap.quickinfo : 'Inspection Characteristic Number'
  key InspectionCharacteristic : String(4) not null;
  @sap.label : 'Characteristic Short Text'
  @sap.quickinfo : 'Short Text for Inspection Characteristic'
  InspectionSpecificationText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partial Samples'
  @sap.quickinfo : 'Partial Samples Possible'
  HasInspCharcPrtlSmpl : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Is Quantitative Characteristic'
  InspSpecIsQuantitative : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Record Measured Vals'
  @sap.quickinfo : 'Measured Values Must Be Recorded'
  InspSpecIsMeasuredValueRqd : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Charc Attribute'
  @sap.quickinfo : 'Reference to Characteristic Attribute Required'
  InspSpecIsSelectedSetRequired : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Long-Term Inspection'
  InspSpecIsLongTermInspection : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Recording Type'
  InspSpecRecordingType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document Results'
  @sap.quickinfo : 'Documentation Required for Inspection Results'
  InspResultIsDocumentationRqd : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Charac. category'
  @sap.quickinfo : 'Characteristic Category'
  InspSpecCharcCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calculated Charc'
  @sap.quickinfo : 'Calculated Characteristic'
  InspSpecResultCalculation : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Unplanned Characteristic'
  InspCharcIsNotPlanned : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Method'
  InspectionMethod : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant for Inspection Method'
  InspectionMethodPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Version'
  @sap.quickinfo : 'Version Number of Inspection Method'
  InspectionMethodVersion : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant for Master Characteristic'
  @sap.quickinfo : 'Plant for Master Inspection Characteristic'
  InspectionSpecificationPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Insp. Charac.'
  @sap.quickinfo : 'Master Inspection Characteristic'
  InspectionSpecification : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Version'
  @sap.quickinfo : 'Version Number of Master Inspection Characteristic'
  InspectionSpecificationVersion : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Specification status'
  @sap.quickinfo : 'Specification Record Status'
  InspectionCharacteristicStatus : String(1);
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Decimal Places'
  @sap.quickinfo : 'Number of Places to the Right of a Decimal Point (Accuracy)'
  InspSpecDecimalPlaces : Integer;
  @sap.label : 'Unit of Measurement'
  @sap.quickinfo : 'Unit of Measurement in Which Quantitative Data Is Stored'
  @sap.semantics : 'unit-of-measure'
  InspectionSpecificationUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation rule'
  @sap.quickinfo : 'Valuation Rule'
  InspSampleValuationRule : String(2);
  @sap.label : 'Sample Unit of Meas.'
  @sap.quickinfo : 'Sample Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  QuantityUnit : String(3);
  @sap.label : 'Inspect'
  @sap.quickinfo : 'Sample Size that Has to Be Inspected for a Characteristic'
  InspCharacteristicSampleSize : Integer;
  @sap.label : 'Sample Unit of Meas.'
  @sap.quickinfo : 'Sample Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  InspCharacteristicSampleUnit : String(3);
  @sap.label : 'Base Sample Quantity'
  @sap.quickinfo : 'Sample Quantity Factor for Sample(Mult. Sample Unit of Msr.)'
  InspSpecSampleQuantityFactor : Decimal(5, 2);
  @sap.unit : 'InspectionSpecificationUnit'
  @sap.label : 'Target Value'
  @sap.quickinfo : 'Target Value for a Quantitative Characteristic'
  InspSpecTargetValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Target Value'
  @sap.quickinfo : 'Target Value for Quantitative Characteristic (Formatted)'
  InspSpecFrmtdTargetValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  InspSpecHasTargetValue : String(1);
  @sap.unit : 'InspectionSpecificationUnit'
  @sap.label : 'Upper Specif. Limit'
  @sap.quickinfo : 'Upper Specification Limit'
  InspSpecUpperLimit : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Upper Specif. Limit'
  @sap.quickinfo : 'Upper Specification Limit (Formatted)'
  InspSpecFrmtdUpperLimit : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  InspSpecHasUpperLimit : String(1);
  @sap.unit : 'InspectionSpecificationUnit'
  @sap.label : 'Lower Specif. Limit'
  @sap.quickinfo : 'Lower Specification Limit'
  InspSpecLowerLimit : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Lower Specif. Limit'
  @sap.quickinfo : 'Lower Specification Limit (Formatted)'
  InspSpecFrmtdLowerLimit : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  InspSpecHasLowerLimit : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Weighting of Charc'
  @sap.quickinfo : 'Weighting of Characteristic'
  InspSpecImportanceCode : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Test equipment'
  @sap.quickinfo : 'Assigned Test Equipment'
  InspLotTestEquipInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code group/sel. set'
  @sap.quickinfo : 'Assigned Code Group or Selected Set'
  SelectedCodeSet : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Plant of the Assigned Selected Set'
  SelectedCodeSetPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspector Qualific.'
  @sap.quickinfo : 'Inspector Qualification'
  InspectorQualification : String(5);
  @sap.label : 'Info Field 1'
  @sap.quickinfo : 'Text Line for Additional Information'
  InspSpecInformationField1 : String(10);
  @sap.label : 'Info Field 2'
  @sap.quickinfo : 'Text Line for Additional Information'
  InspSpecInformationField2 : String(20);
  @sap.label : 'Info Field 3'
  @sap.quickinfo : 'Text Line for Additional Information'
  InspSpecInformationField3 : String(40);
  @sap.label : 'Inspection Quantity'
  @sap.quickinfo : 'Quantity to Be Inspected'
  InspectionScope : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Char. control ind.'
  @sap.quickinfo : 'Cntrl Indicator String for Insp. Char./Master Insp. Char.'
  InspSpecControlIndicators : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  CharacteristicAttributeCatalog : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'SmpNo UCh'
  @sap.quickinfo : 'Unplanned Characteristic Was Created with this Sample No.'
  UnplndCharcInspSubsetIntID : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dynamic Modification Rule'
  InspLotDynamicRule : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Confirmation Number'
  @sap.quickinfo : 'Confirmation Number for Inspection Characteristic'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspCharcConfirmationNumber : String(8);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  ChangedDateTime : DateTime;
  to_InspResultValue : Composition of many OP_API_INSPECTIONLOT_SRV_0001.A_InspectionResultValue {  };
  to_InspSmplResult : Composition of many OP_API_INSPECTIONLOT_SRV_0001.A_InspSampleResult {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Inspection Lot Data'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionLot {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  Batch : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Lot Origin'
  InspectionLotOrigin : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Opertn task list no.'
  @sap.quickinfo : 'Routing number of operations in the order'
  OrderInternalBillOfOperations : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Order'
  @sap.quickinfo : 'Order Number (Production Order)'
  ManufacturingOrder : String(12);
  @sap.label : 'Inspection Lot Text'
  InspectionLotText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Type'
  InspectionLotType : String(8);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Inspection Lot Quantity'
  InspectionLotQuantity : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Actual Lot Quantity'
  InspectionLotActualQuantity : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Defective Quantity'
  InspectionLotDefectiveQuantity : Decimal(13, 3);
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Base Unit of Measure for Inspection Lot Quantity'
  @sap.semantics : 'unit-of-measure'
  InspectionLotQuantityUnit : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Lot Created'
  @sap.quickinfo : 'Date in Time Zone Where Lot Created'
  InspLotCreatedOnLocalDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Combinat.'
  @sap.quickinfo : 'Identifier for Inspection Point Field Combination'
  InspSubsetFieldCombination : String(3);
  @sap.label : 'Open Long-Term Characteristics'
  InspLotNmbrOpenLongTermCharc : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object number'
  StatusObject : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object Type'
  StatusObjectCategory : String(3);
  @sap.label : 'Object Short Text'
  @sap.quickinfo : 'Short Text for Inspection Object'
  InspectionLotObjectText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status Profile'
  StatusProfile : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM Material Authorization'
  @sap.quickinfo : 'Material Authorization Group for Activities in QM'
  MatlQualityAuthorizationGroup : String(6);
  @sap.label : 'Posted to Inspection Stock'
  InspectionLotHasQuantity : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Insp. Lot Created'
  @sap.quickinfo : 'Inspection Lot Is Created Automatically'
  InspLotIsCreatedAutomatically : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partial Lots Exist'
  InspectionLotHasPartialLots : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Individual QM Order'
  @sap.quickinfo : 'Record Appraisal Costs in Individual QM Order'
  InspectionLotHasAppraisalCosts : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Insp. with Insp. Pts'
  @sap.quickinfo : 'Inspection with Inspection Points'
  InspLotHasSubsets : Boolean;
  @sap.label : 'Automatic Usage Decision Planned'
  InspLotIsAutomUsgeDcsnPossible : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source inspection'
  @sap.quickinfo : 'Source Inspection'
  PurchasingDocumentCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Insp. by Configuratn'
  @sap.quickinfo : 'Inspection Specifications from Configuration'
  InspLotHasConfignSpecification : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'GR Blocked Stock'
  GoodsReceiptIsMovedToBlkdStock : String(1);
  @sap.label : 'Documentation Required'
  InspLotIsDocumentationRequired : Boolean;
  @sap.label : 'Inspection Plan Required'
  InspLotIsTaskListRequired : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manual sample'
  @sap.quickinfo : 'Enter Sample Manually'
  InspLotHasManualSampleSize : Boolean;
  @sap.label : 'Inspect with Material Specification'
  InspLotHasMaterialSpec : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Lot Approval'
  InspectionLotApproval : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dig. Sig. in RR'
  @sap.quickinfo : 'Digital Signature for Insp. Lot in Results Recording'
  InspLotDigitalSgntrResultsRecg : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Digital Signature Usage Decision'
  InspLotDigitalSgntrInUsgeDcsn : String(1);
  @sap.label : 'Appr.Batch Recd Req.'
  @sap.quickinfo : 'Approved Batch Record Required'
  InspLotIsBatchRequired : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Insp. Lot Stab.'
  @sap.quickinfo : 'Inspection Lot for Stability Study'
  InspLotUsageInStabilityStudy : String(1);
  @sap.label : 'Stock Postings Completed'
  InspLotIsStockPostingCompleted : Boolean;
  @sap.label : 'Usage Decision Made'
  InspectionLotHasUsageDecision : Boolean;
  @sap.label : 'No.serial numbers'
  @sap.quickinfo : 'Number of serial numbers'
  NumberOfSerialNumbers : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial Numbers Poss.'
  @sap.quickinfo : 'Serial Numbers Possible'
  InspLotIsSerialNmbrPossible : Boolean;
  @sap.label : 'Skip Lot'
  InspectionLotIsSkipped : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : '100% Inspection'
  InspectionLotIsFullInspection : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dynamic Modification Level'
  @sap.quickinfo : 'Level at Which Dynamic Modification Parameters Are Defined'
  InspectionLotDynamicLevel : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sampling Procedure'
  SamplingProcedure : String(8);
  @sap.label : 'Created At (Local Time)'
  @sap.quickinfo : 'Time in Time Zone Where Lot Created'
  InspLotCreatedOnLocalTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of User Who Created the Data Record'
  InspectionLotCreatedBy : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'System Date on Which Data Record Was Created'
  InspectionLotCreatedOn : Date;
  @sap.label : 'Created At'
  @sap.quickinfo : 'System Time of Creation'
  InspectionLotCreatedOnTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of User Who Last Changed Data Record'
  InspectionLotChangedBy : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'System Date on Which Data Record Was Changed'
  InspectionLotChangeDate : Date;
  @sap.label : 'Changed At'
  @sap.quickinfo : 'System Time of Change'
  InspectionLotChangeTime : Time;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  ChangedDateTime : DateTime;
  @sap.display.format : 'Date'
  @sap.label : 'Start of Inspection'
  @sap.quickinfo : 'Start Date of Inspection in Local Time Zone'
  InspectionLotStartDate : Date;
  @sap.label : 'Inspection Started At'
  InspectionLotStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'End of Inspection'
  @sap.quickinfo : 'End Date of Inspection in Local Time Zone'
  InspectionLotEndDate : Date;
  @sap.label : 'Inspection Ended At'
  InspectionLotEndTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Operations Type'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Operations Group'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Operations Usage'
  BillOfOperationsUsage : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Operations Group Counter'
  BillOfOperationsVariant : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  BillOfOperationsChangeStateID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Point Type'
  InspectionSubsetType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sample-Drawing Procedure'
  SmplDrawingProcedure : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Version'
  @sap.quickinfo : 'Version No. of the Sample-Drawing Procedure'
  SmplDrawingProcedureVersion : String(6);
  @sap.label : 'Confirmation Required'
  @sap.quickinfo : 'Confirmation Required for Sample Drawing'
  SmplDrwgProcedIsConfRequired : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  InspLotSelectionMaterial : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  InspLotSelMatlRevisionLvl : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  InspLotSelectionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Supplier''s Account Number'
  InspLotSelectionSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manufacturer'
  @sap.quickinfo : 'Number of Manufacturer'
  InspLotSelectionManufacturer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Account number of customer'
  InspLotSelectionCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage'
  @sap.quickinfo : 'Task List Usage'
  InspLotSelBillOfOperationsUsge : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Key Date'
  @sap.quickinfo : 'Key Date for Selecting Records or Changing Task Lists'
  InspLotSelectionValidFromDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Version'
  ProductionVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Run Schedule Header'
  SalesOperationsPlanningOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purpose Completed'
  @sap.quickinfo : 'Business Purpose Completed Flag'
  IsBusinessPurposeCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer (Ship-To Party)'
  Customer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Supplier''s Account Number'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier Batch'
  @sap.quickinfo : 'Supplier Batch Number'
  BatchBySupplier : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manufacturer'
  @sap.quickinfo : 'Number of Manufacturer'
  Manufacturer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manufacturer Material'
  ManufacturerPartNmbr : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel : String(2);
  @sap.label : 'Batch Required'
  MaterialIsBatchManaged : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location for Batch'
  BatchStorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Special Stock'
  @sap.quickinfo : 'Special Stock Indicator'
  MaterialCompIsSpecialStock : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Organization'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  PurchasingDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Purchasing Document Item'
  PurchasingDocumentItem : String(5);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Schedule Line'
  @sap.quickinfo : 'Delivery Schedule Line Counter'
  ScheduleLine : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document Type'
  AccountingDocumentType : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Material Document Year'
  MaterialDocumentYear : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Document'
  @sap.quickinfo : 'Number of Material Document'
  MaterialDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Material Document Item'
  MaterialDocumentItem : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Posting Date'
  @sap.quickinfo : 'Posting Date in the Document'
  MatlDocLatestPostgDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Movement type'
  @sap.quickinfo : 'Movement Type (Inventory Management)'
  GoodsMovementType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant for Inspection Lot'
  InspectionLotPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Loc. for Inspection Lot Stock'
  @sap.quickinfo : 'Storage Location for Inspection Lot Stock'
  InspectionLotStorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Warehouse Number'
  @sap.quickinfo : 'Warehouse Number / Warehouse Complex'
  Warehouse : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Type'
  StorageType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Bin'
  StorageBin : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Sales Order Number'
  SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Order Item'
  SalesOrderItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Document'
  DeliveryDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Delivery Document Item'
  DeliveryDocumentItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery category'
  @sap.quickinfo : 'Delivery Category'
  DeliveryCategory : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Route'
  Route : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dest. Country/Region'
  @sap.quickinfo : 'Destination Country/Region'
  BillToPartyCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer (Sold-To Party)'
  SoldToParty : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Material'
  MaterialByCustomer : String(35);
  @sap.label : 'Language Key'
  Language : String(2);
  @sap.label : 'Charcs Recorded'
  @sap.quickinfo : 'Number of Characteristics Recorded Additionally'
  InspLotNmbrAddlRecordedCharc : Integer;
  @sap.label : 'Short-Term Charcs'
  @sap.quickinfo : 'Number of Outstanding Short-Term Chars That Require Confirm.'
  InspLotNmbrOpenShortTermCharc : Integer;
  @sap.unit : 'InspectionLotContainerUnit'
  @sap.label : 'Number of Containers'
  @sap.quickinfo : 'QM - No. of Containers'
  InspectionLotContainer : Decimal(6, 3);
  @sap.label : 'Lot Container'
  @sap.semantics : 'unit-of-measure'
  InspectionLotContainerUnit : String(3);
  @sap.unit : 'InspectionLotSampleUnit'
  @sap.label : 'Sample Size'
  @sap.quickinfo : 'Inspection Sample Size'
  InspectionLotSampleQuantity : Decimal(13, 3);
  @sap.label : 'Sample Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  InspectionLotSampleUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dynamic Modification Rule'
  InspLotDynamicRule : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Time of dyn. modif.'
  @sap.quickinfo : 'Time of Dynamic Modification in Inspection Lot'
  InspLotDynamicTrggrPoint : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Stage'
  InspectionDynamicStage : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Severity'
  InspectionSeverity : String(3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Unrestricted-Use Stock'
  InspLotQtyToFree : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Scrap Quantity'
  InspLotQtyToScrap : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Sample'
  @sap.quickinfo : 'Quantity Posted to Sample'
  InspLotQtyToSample : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Blocked Stock'
  InspLotQtyToBlocked : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Reserves'
  @sap.quickinfo : 'Quantity Posted to Reserves'
  InspLotQtyToReserves : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'New Material'
  InspLotQtyToAnotherMaterial : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Posted To'
  InspLotMaterialPostedTo : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch Transferred To'
  InspLotBatchTransferredTo : String(10);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Return to Supplier'
  InspLotQtyReturnedToSupplier : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Other Quantity'
  InspLotQtyToSpecialStock : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Other Quantity 2'
  InspLotQtyToOtherStock : Decimal(13, 3);
  @sap.unit : 'InspectionLotQuantityUnit'
  @sap.label : 'Quantity to Be Posted'
  InspLotQtyToBePosted : Decimal(13, 3);
  @sap.unit : 'InspectionLotSampleUnit'
  @sap.label : 'Long-Term Sample Quantity'
  InspLotSmplQtyForLongTermChar : Decimal(13, 3);
  @sap.unit : 'InspectionLotSampleUnit'
  @sap.label : 'Inspected Quantity'
  InspLotQtyInspected : Decimal(13, 3);
  @sap.unit : 'InspectionLotSampleUnit'
  @sap.label : 'Destroyed Quantity'
  InspLotQtyDestroyed : Decimal(13, 3);
  @sap.label : 'Share of Scrap'
  @sap.quickinfo : 'Share of Scrap in Inspection Lot'
  InspectionLotScrapRatio : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'UD Mode'
  @sap.quickinfo : 'Usage Decision Mode (UD Origin)'
  InspLotUsageDecisionTool : String(1);
  @sap.label : 'Allowed Scrap Share'
  @sap.quickinfo : 'Allowed Share of Scrap'
  InspectionLotAllowedScrapRatio : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM Order'
  @sap.quickinfo : 'Order Number for Recording Appraisal Costs'
  QualityCostCollector : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consumption'
  @sap.quickinfo : 'Consumption posting'
  ConsumptionPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assignment Cat.'
  @sap.quickinfo : 'Account Assignment Category'
  AccountAssignmentCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Item Category'
  @sap.quickinfo : 'Item category in purchasing document'
  PurchasingDocumentItemCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account Assgmt Key'
  @sap.quickinfo : 'Account Assignment Key: Inspection Lot'
  InspLotAcctAssgmtKey : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center'
  CostCenter : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item no.'
  @sap.quickinfo : 'Item Number of Reservation / Dependent Requirements'
  ReservationItem : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Asset'
  @sap.quickinfo : 'Main Asset Number'
  MasterFixedAsset : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Asset Subnumber'
  FixedAsset : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Valuated Sales Order Stock WBS Element'
  SalesOrdStockWBSElement : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Network'
  @sap.quickinfo : 'Network Number for Account Assignment'
  ProjectNetwork : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  NetworkActivityInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inventory Special Stock Sales Document'
  InventorySpclStkSalesDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales order item'
  @sap.quickinfo : 'Sales Order Item of Valuated Sales Order Stock'
  InventorySpclStkSalesDocItm : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Profitability Segment (Deprecated)'
  @sap.quickinfo : 'Deprecated: Profitability Segment'
  ProfitabilitySegment : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Area'
  BusinessArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account'
  @sap.quickinfo : 'G/L Account Number'
  GLAccount : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area'
  ControllingArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  CompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  SerialNumberProfile : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Sales Order Number'
  InspLotCostCollectorSalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Order Item'
  @sap.quickinfo : 'Item Number in Sales Order'
  InspLotCostCollectorSlsOrdItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element)'
  InspLotCostCollectorWBSElement : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Document Number'
  InspLotExternalNumber : String(30);
  @sap.label : 'Priority Points'
  InspectionLotPriorityPoints : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance Plan'
  MaintenancePlan : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance Item'
  @sap.quickinfo : 'Maintenance item'
  MaintenancePlanItemIntID : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance Strategy'
  MaintenanceStrategy : String(6);
  to_InspectionLotWithStatus : Association to OP_API_INSPECTIONLOT_SRV_0001.A_InspectionLotWithStatus {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Inspection Lot Statuses'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionLotWithStatus {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  InspectionLotStatusCreated : String(1);
  InspectionLotStatusReleased : String(1);
  InspectionLotStatusSkip : String(1);
  InspLotStatusRsltsConfirmed : String(1);
  InspLotStsDefectsRecorded : String(1);
  InspLotStsShrtTrmInspCmpltd : String(1);
  InspLotStatusInspCompleted : String(1);
  InspLotStatusCanceled : String(1);
  InspLotStatusRepair : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Inspection Operations'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionOperation {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Opertn task list no.'
  @sap.quickinfo : 'Routing number of operations in the order'
  OrderInternalBillOfOperations : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Activity'
  @sap.quickinfo : 'Operation/Activity Number'
  InspectionOperation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  InspectionOperationPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Task List Type'
  BillOfOperationsType : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Task List Node'
  @sap.quickinfo : 'Number of the Task List Node'
  BOOOperationInternalID : String(8);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Object ID'
  @sap.quickinfo : 'Object ID of the resource'
  WorkCenterInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object number'
  StatusObject : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Control key'
  OperationControlProfile : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Confirmation'
  @sap.quickinfo : 'Completion confirmation number for the operation'
  OperationConfirmation : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'QDR System'
  @sap.quickinfo : 'Subsystem Identifier for QM Subsystem Interface'
  InspectionSubSystem : String(6);
  @sap.label : 'Operation Short Text'
  OperationText : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Summarized Inspection Results'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionResult {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Insp. Characteristic'
  @sap.quickinfo : 'Inspection Characteristic Number'
  key InspectionCharacteristic : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  @sap.quickinfo : 'Results Record Status'
  InspectionResultStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute'
  @sap.quickinfo : 'Attribute of the Results Record (Valid, Invalid,...)'
  InspectionResultAttribute : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Origin'
  @sap.quickinfo : 'Origin of Results Data'
  InspectionResultOrigin : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspector'
  @sap.quickinfo : 'Name of Inspector'
  Inspector : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation'
  @sap.quickinfo : 'Inspection Result Valuation'
  InspectionValuationResult : String(1);
  @sap.label : 'Mean Value'
  @sap.quickinfo : 'Arithmetic Mean of Valid Measured Values'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultMeanValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mean Value'
  @sap.quickinfo : 'Arithmetic Mean of Valid Measured Values (Formatted)'
  InspResultFrmtdMeanValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultHasMeanValue : String(1);
  @sap.label : 'Maximum Valid Value'
  @sap.quickinfo : 'Maximum Value of Valid Measured Values'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultMaximumValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maximum Valid Value'
  @sap.quickinfo : 'Maximum Value of Valid Measured Values - formatted'
  InspResultFrmtdMaximumValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspResultHasMaximumValue : String(1);
  @sap.label : 'Minimum Valid Value'
  @sap.quickinfo : 'Minimum Value of Valid Measured Values'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultMinimumValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Minimum Valid Value'
  @sap.quickinfo : 'Minimum Value of Valid Measured Values (Formatted)'
  InspResultFrmtdMinimumValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspResultHasMinimumValue : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Original Value'
  @sap.quickinfo : 'Original Value Before Input Processing'
  InspectionResultOriginalValue : String(25);
  @sap.label : 'Inspected'
  @sap.quickinfo : 'Number of Inspected Sample Units'
  InspResultValidValuesNumber : Integer;
  @sap.label : 'Inspection Desc. for Summarized Result'
  @sap.quickinfo : 'Inspection Description for Summarized Result'
  InspectionResultText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Long text'
  @sap.quickinfo : 'Inspection Characteristic Long Text Exists'
  InspectionResultHasLongText : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  CharacteristicAttributeCatalog : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  CharacteristicAttributeCodeGrp : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  CharacteristicAttributeCode : String(4);
  @sap.label : 'Additional Info.'
  @sap.quickinfo : 'General Information'
  InspRsltFreeDefinedTestEquip : String(18);
  @sap.label : 'Number Below'
  @sap.quickinfo : 'Number of Measured Values Below Tolerance Range'
  InspRsltBelowToleranceValsNmbr : Integer;
  @sap.label : 'Number Above'
  @sap.quickinfo : 'Number of Measured Values Above Tolerance Range'
  InspRsltAboveToleranceValsNmbr : Integer;
  @sap.label : 'Nonconforming'
  @sap.quickinfo : 'Number of Nonconforming Sample Units'
  InspRsltNonconformingValsNmbr : Integer;
  @sap.label : 'Number of Defects'
  @sap.quickinfo : 'Number of Defects Found'
  InspectionNumberOfDefects : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Defect Class'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  DefectClass : String(2);
  @sap.label : 'Fraction Above'
  @sap.quickinfo : 'Estimated Fraction Above Tolerance Range'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspRsltAboveToleranceFraction : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fraction Above'
  @sap.quickinfo : 'Estimated Fraction Above Tolerance Range (Formatted)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspRsltFrmtdAbvTolFraction : String(22);
  @sap.label : 'Fraction Below'
  @sap.quickinfo : 'Estimated Fraction Below Tolerance Range'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspRsltBelowToleranceFraction : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fraction Below'
  @sap.quickinfo : 'Estimated Fraction Below Tolerance Range (Formatted)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspRsltFrmtdBelowTolFraction : String(22);
  @sap.label : 'Variance'
  @sap.quickinfo : 'Dispersion (Variance) of Valid Measured Values'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspResultVariance : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Variance'
  @sap.quickinfo : 'Dispersion (Variance) of Valid Measured Values (Formatted)'
  InspResultFrmtdVariance : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog2 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog3 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog4 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog5 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode2 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode3 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode4 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode5 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup2 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup3 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup4 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup5 : String(8);
  @sap.label : 'Partial Samples'
  @sap.quickinfo : 'Number of Partial Samples for Characteristic'
  InspectionPartialSampleSize : Integer;
  @sap.display.format : 'Date'
  @sap.label : 'Insp. Start Date'
  @sap.quickinfo : 'Start Date in Local Time Zone of Inspection'
  InspectionStartDate : Date;
  @sap.label : 'Insp. Start Time'
  @sap.quickinfo : 'Start Time in Local Time Zone of Inspection'
  InspectionStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Inspection End Date'
  InspectionEndDate : Date;
  @sap.label : 'Inspection End Time'
  @sap.quickinfo : 'End Time in Local Time Zone of Inspection'
  InspectionEndTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of User Who Created the Data Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'System Date on Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of User Who Last Changed Data Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'System Date on Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedDateTime : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Single Inspection Results'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionResultValue {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Insp. Characteristic'
  @sap.quickinfo : 'Inspection Characteristic Number'
  key InspectionCharacteristic : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Individual Result'
  @sap.quickinfo : 'Number of Individual Result'
  key InspResultValueInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute'
  @sap.quickinfo : 'Attribute of the Results Record (Valid, Invalid,...)'
  InspectionResultAttribute : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Unit No.'
  @sap.quickinfo : 'Counter for Inspection Unit Number'
  InspResultItemInternalID : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sample Number'
  @sap.quickinfo : 'Inspection Sample Number'
  InspectionSubsetInternalID : String(6);
  @sap.label : 'Measured Value'
  @sap.quickinfo : 'Measured Value for a Sample Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultMeasuredValue : Double;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Measured Value'
  @sap.quickinfo : 'Measured Value for a Sample Unit - formatted'
  InspResultFrmtdMeasuredValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MeasVal. Not Initial'
  @sap.quickinfo : 'Measured Value Is Not Initial'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspResultHasMeasuredValue : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Original Value'
  @sap.quickinfo : 'Original Value Before Input Processing'
  InspectionResultOriginalValue : String(25);
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Number of defects'
  @sap.quickinfo : 'Number of Defects Found'
  InspectionNumberOfDefects : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Defect Class'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  DefectClass : String(2);
  @sap.label : 'Inspection Description for Single Value'
  InspectionResultText : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Single Unit Number'
  @sap.quickinfo : 'Number of Single Unit in Inspection Lot'
  InspLotSingleUnitNumber : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial Number'
  @sap.quickinfo : 'Single-Unit Number for the Unit to Be Inspected'
  InspectionResultItem : String(18);
  @sap.label : 'Additional Info.'
  @sap.quickinfo : 'General Information'
  InspRsltFreeDefinedTestEquip : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation'
  @sap.quickinfo : 'Inspection Result Valuation'
  InspectionValuationResult : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  CharacteristicAttributeCodeGrp : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup2 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup3 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup4 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup5 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  CharacteristicAttributeCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode2 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode3 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode4 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode5 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CharacteristicAttributeCatalog : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultCatalog2 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultCatalog3 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultCatalog4 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultCatalog5 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspector'
  @sap.quickinfo : 'Name of Inspector'
  Inspector : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Insp. Start Date'
  @sap.quickinfo : 'Start Date in Local Time Zone of Inspection'
  InspectionStartDate : Date;
  @sap.label : 'Insp. Start Time'
  @sap.quickinfo : 'Start Time in Local Time Zone of Inspection'
  InspectionStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Inspection End Date'
  @sap.quickinfo : 'End Date in Local Time Zone of Inspection'
  InspectionEndDate : Date;
  @sap.label : 'Inspection End Time'
  @sap.quickinfo : 'End Time in Local Time Zone of Inspection'
  InspectionEndTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'System Date on Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @sap.label : 'Time'
  @sap.quickinfo : 'System Time at Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of User Who Created the Data Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'System Date on Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @sap.label : 'Time'
  @sap.quickinfo : 'System Time at Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of User Who Last Changed Data Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedDateTime : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Inspection Points'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspectionSubset {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sample'
  @sap.quickinfo : 'Sample Number (Based on an Inspection Point)'
  key InspectionSubsetInternalID : String(6) not null;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Trigger_valuation_ac : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sample'
  @sap.quickinfo : 'Material Sample Number'
  MaterialSample : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Equipment'
  @sap.quickinfo : 'Equipment Number'
  Equipment : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Location'
  FunctionalLocation : String(40);
  @sap.label : 'Serial.Mat. ID'
  @sap.quickinfo : 'ID of Serialized Material'
  ShopFloorItem : Integer64;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  SelectedCodeSetPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'UD Selected Set'
  @sap.quickinfo : 'Selected Set of the Usage Decision'
  SelectedCodeSet : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'UD Code Group'
  @sap.quickinfo : 'Code Group of the Usage Decision'
  InspSubsetUsageDcsnCodeGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Code'
  InspSubsetUsageDcsnCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Valuation'
  InspSubsetUsageDcsnValuation : String(1);
  @sap.label : 'User Field for Time'
  InspectionSubsetTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'User Field for Date'
  InspectionSubsetDate : Date;
  @sap.display.format : 'NonNegative'
  @sap.label : 'User Field for 10 Digits'
  InspSubsetLongNumericKey : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'User Field for 3 Digits'
  InspSubsetShortNumericKey : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field for 18 Characters'
  InspectionSubsetLongCharKey : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field for 10 Characters'
  InspectionSubsetShortCharKey : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Partial Lot'
  @sap.quickinfo : 'Partial Lot Number'
  InspectionPartialLot : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspector'
  @sap.quickinfo : 'Name of Inspector'
  Inspector : String(12);
  @sap.unit : 'InspectionSubsetQtyUnit'
  @sap.label : 'Insp. Point Yield'
  @sap.quickinfo : 'Inspection Point Yield'
  InspectionSubsetYieldQty : Decimal(13, 3);
  @sap.unit : 'InspectionSubsetQtyUnit'
  @sap.label : 'Insp. Point Scrap'
  @sap.quickinfo : 'Scrap for Inspection Point'
  InspectionSubsetScrapQty : Decimal(13, 3);
  @sap.unit : 'InspectionSubsetQtyUnit'
  @sap.label : 'Rework Quantity'
  @sap.quickinfo : 'Rework Quantity for Inspection Point'
  InspectionSubsetReworkQty : Decimal(13, 3);
  @sap.label : 'Insp.Pt UoM'
  @sap.quickinfo : 'Unit of Measure for the Inspection Point'
  @sap.semantics : 'unit-of-measure'
  InspectionSubsetQtyUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstFuncnlLocProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstEquipProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstMatlSmplProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspection Point'
  @sap.quickinfo : 'Key Field (Sort Field) for Inspection Point'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionSubsetSortKey : String(70);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstDateFldProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstLongNmbrFldProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstShrtNmbrFldProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstLongTxtFldProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstTimeFldProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Field Active'
  @sap.quickinfo : 'Field Active'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspSbstShrtTxtFldProperty : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'System Date on Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @sap.label : 'Created At'
  @sap.quickinfo : 'System Time at Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of Person Who Changed Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'System Date on Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @sap.label : 'Changed At'
  @sap.quickinfo : 'System Time at Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeTime : Time;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedDateTime : DateTime;
} actions {
  action A_InspectionSubsetTrigger_valuation() returns OP_API_INSPECTIONLOT_SRV_0001.A_InspectionSubset;
};

@cds.external : true
@cds.persistence.skip : true
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Stock Postings'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspLotMatlDocItem {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal Counter for DB Objects'
  key InspLotMatlDocItem : String(6) not null;
  @sap.unit : 'InspLotMatlDocItmQtyUnit'
  @sap.label : 'Qty in unit of entry'
  @sap.quickinfo : 'Quantity in unit of entry'
  InspLotQtyPosted : Decimal(13, 3);
  @sap.label : 'Unit of Entry'
  @sap.quickinfo : 'Unit of entry'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  InspLotMatlDocItmQtyUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Posting proposal UD'
  @sap.quickinfo : 'Posting Proposal in Usage Decision'
  UsageDecisionStockType : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transfer Material'
  InspLotMaterialPostedTo : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transfer Batch'
  InspLotBatchTransferredTo : String(10);
  @sap.label : 'Text'
  @sap.quickinfo : 'Item Text'
  MaterialDocumentItemText : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Type'
  @sap.quickinfo : 'Type of Reference Between Inspection Lot and Material Doc.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspLotMatlDocItemType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Document'
  @sap.quickinfo : 'Number of Material Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Material Doc. Year'
  @sap.quickinfo : 'Material Document Year'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialDocumentYear : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Material Doc.Item'
  @sap.quickinfo : 'Item in Material Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialDocumentItem : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Entry Date'
  @sap.quickinfo : 'Day On Which Accounting Document Was Entered'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  ChangedDateTime : DateTime;
  to_InspLotMatlDocItmSrlNmbr : Association to many OP_API_INSPECTIONLOT_SRV_0001.A_InspLotMatlDocItmSrlNmbr {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Serial Numbers for Stock Posting'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspLotMatlDocItmSrlNmbr {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal Counter for DB Objects'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key InspLotMatlDocItem : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Equipment'
  @sap.quickinfo : 'Equipment Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Equipment : String(18) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial Number'
  SerialNumber : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Type'
  @sap.quickinfo : 'Type of Reference Between Inspection Lot and Material Doc.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspLotMatlDocItemType : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Serial Numbers for Inspection Lot'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspLotSerialNumber {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial Number'
  key SerialNumber : String(18) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Usage Decisions'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspLotUsageDecision {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Type'
  @sap.quickinfo : 'Inspection Lot, Partial Lot, Single Unit, Interval'
  InspLotUsageDecisionLevel : String(1);
  @sap.label : 'Quality Score'
  InspectionLotQualityScore : Decimal(3, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog'
  InspLotUsageDecisionCatalog : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  SelectedCodeSetPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'UD Selected Set'
  @sap.quickinfo : 'Selected Set of the Usage Decision'
  InspLotUsgeDcsnSelectedSet : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Code Group'
  InspLotUsageDecisionCodeGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Code'
  InspectionLotUsageDecisionCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'DynMod. valuation'
  @sap.quickinfo : 'Dynamic Modif. Valuation According to Worst Case Principle'
  InspLotUsgeDcsnDynValuation : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Valuation'
  InspLotUsageDecisionValuation : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Follow-Up Action'
  InspLotUsgeDcsnFollowUpAction : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Made By'
  InspectionLotUsageDecidedBy : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Usage Decision Made On'
  @sap.quickinfo : 'Date When Usage Decision Was Made'
  InspectionLotUsageDecidedOn : Date;
  @sap.label : 'Usage Decision Made At'
  @sap.quickinfo : 'Time When Usage Decision Was Made'
  InspLotUsageDecisionTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Changed By'
  InspLotUsageDecisionChangedBy : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Usage Decision Changed On'
  @sap.quickinfo : 'Date When Usage Decision Was Changed'
  InspLotUsageDecisionChangedOn : Date;
  @sap.label : 'Usage Decision Changed At'
  @sap.quickinfo : 'Time When Usage Decision Was Changed'
  InspLotUsgeDcsnChangedTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage Decision Has Long Text'
  InspLotUsgeDcsnHasLongText : Boolean;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  ChangedDateTime : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Inspection Characteristics of Inspection Points'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspSampleCharacteristic {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Insp. Characteristic'
  @sap.quickinfo : 'Inspection Characteristic Number'
  key InspectionCharacteristic : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sample Number'
  @sap.quickinfo : 'Inspection Sample Number'
  key InspectionSubsetInternalID : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Specification status'
  @sap.quickinfo : 'Specification Record Status'
  InspectionCharacteristicStatus : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Control Chart'
  @sap.quickinfo : 'Control Chart Number'
  QualityControlChart : String(12);
  @sap.label : 'Acceptance Number'
  InspSampleAcceptanceNumber : Integer;
  @sap.label : 'Rejection no.'
  @sap.quickinfo : 'Rejection Number'
  InspSampleRejectionNumber : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation rule'
  @sap.quickinfo : 'Valuation Rule'
  InspSampleValuationRule : String(2);
  @sap.label : 'Inspect'
  @sap.quickinfo : 'Sample Size that Must Be Inspected'
  InspectionSampleSize : Integer;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Stage'
  InspLotDynRuleStage : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Severity'
  InspectionSeverity : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'System Date on Which Data Record Was Created'
  InspSubsetCharcCreationDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedDateTime : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Summarized Inspection Results for Inspection Point'
entity OP_API_INSPECTIONLOT_SRV_0001.A_InspSampleResult {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  key InspectionLot : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Current Node No.'
  @sap.quickinfo : 'Current Node Number from Order Counter'
  key InspPlanOperationInternalID : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Insp. Characteristic'
  @sap.quickinfo : 'Inspection Characteristic Number'
  key InspectionCharacteristic : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Partial Sample'
  @sap.quickinfo : 'Number of Partial Sample'
  key InspectionSubsetInternalID : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Inspector'
  @sap.quickinfo : 'Name of Inspector'
  Inspector : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  @sap.quickinfo : 'Results Record Status'
  InspectionResultStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Origin'
  @sap.quickinfo : 'Origin of Results Data'
  InspectionResultOrigin : String(2);
  @sap.display.format : 'Date'
  @sap.label : 'Insp. Start Date'
  @sap.quickinfo : 'Start Date in Local Time Zone of Inspection'
  InspectionStartDate : Date;
  @sap.label : 'Insp. Start Time'
  @sap.quickinfo : 'Start Time in Local Time Zone of Inspection'
  InspectionStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Inspection End Date'
  @sap.quickinfo : 'End Date in Local Time Zone of Inspection'
  InspectionEndDate : Date;
  @sap.label : 'Inspection End Time'
  @sap.quickinfo : 'End Time in Local Time Zone of Inspection'
  InspectionEndTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute'
  @sap.quickinfo : 'Attribute of the Results Record (Valid, Invalid,...)'
  InspectionResultAttribute : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation'
  @sap.quickinfo : 'Inspection Result Valuation'
  InspectionValuationResult : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mean Value'
  @sap.quickinfo : 'Arithmetic Mean of Valid Measured Values (Formatted)'
  InspResultFrmtdMeanValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultHasMeanValue : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maximum Valid Value'
  @sap.quickinfo : 'Maximum Value of Valid Measured Values - formatted'
  InspResultFrmtdMaximumValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspResultHasMaximumValue : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Minimum Valid Value'
  @sap.quickinfo : 'Minimum Value of Valid Measured Values (Formatted)'
  InspResultFrmtdMinimumValue : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Not Initial'
  @sap.quickinfo : 'Value Not Initial if Set'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspResultHasMinimumValue : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Original Value'
  @sap.quickinfo : 'Original Value Before Input Processing'
  InspectionResultOriginalValue : String(25);
  @sap.label : 'Inspected'
  @sap.quickinfo : 'Number of Inspected Sample Units'
  InspResultValidValuesNumber : Integer;
  @sap.label : 'Recorded'
  @sap.quickinfo : 'Number of Recorded Sample Units'
  InspResultNmbrOfRecordedRslts : Integer;
  @sap.label : 'Inspection Description for Sample Result'
  InspectionResultText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Long text'
  @sap.quickinfo : 'Inspection Characteristic Long Text Exists'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionResultHasLongText : String(1);
  @sap.label : 'Language Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Language : String(2);
  @sap.label : 'Additional Info.'
  @sap.quickinfo : 'General Information'
  InspRsltFreeDefinedTestEquip : String(18);
  @sap.label : 'Number Below'
  @sap.quickinfo : 'Number of Measured Values Below Tolerance Range'
  InspRsltBelowToleranceValsNmbr : Integer;
  @sap.label : 'Number Above'
  @sap.quickinfo : 'Number of Measured Values Above Tolerance Range'
  InspRsltAboveToleranceValsNmbr : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fraction Above'
  @sap.quickinfo : 'Estimated Fraction Above Tolerance Range (Formatted)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspRsltFrmtdAbvTolFraction : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fraction Below'
  @sap.quickinfo : 'Estimated Fraction Below Tolerance Range (Formatted)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspRsltFrmtdBelowTolFraction : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Variance'
  @sap.quickinfo : 'Dispersion (Variance) of Valid Measured Values (Formatted)'
  InspResultFrmtdVariance : String(22);
  @sap.label : 'Nonconforming'
  @sap.quickinfo : 'Number of Nonconforming Sample Units'
  InspRsltNonconformingValsNmbr : Integer;
  @sap.label : 'Number of defects'
  @sap.quickinfo : 'Number of Defects Found'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionNumberOfDefects : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  CharacteristicAttributeCodeGrp : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup2 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup3 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup4 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code Group'
  InspectionResultCodeGroup5 : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  CharacteristicAttributeCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode2 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode3 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode4 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Code'
  InspectionResultCode5 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  CharacteristicAttributeCatalog : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog2 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog3 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog4 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Catalog Type'
  @sap.quickinfo : 'Catalog Type of Assigned Code Group or Selected Set'
  InspectionResultCatalog5 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of User Who Created the Data Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'System Date on Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDate : Date;
  @sap.label : 'Time'
  @sap.quickinfo : 'System Time at Which Data Record Was Created'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of User Who Last Changed Data Record'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'System Date on Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedDateTime : DateTime;
  @sap.label : 'Time'
  @sap.quickinfo : 'System Time at Which Data Record Was Changed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChangedTime : Time;
};

