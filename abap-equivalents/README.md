# ABAP Equivalent Code Samples

This directory contains ABAP/CDS View code samples that demonstrate how the same Quality Inspection logic implemented in our SAP CAP backend would look in a production SAP S/4HANA system.

These files are **reference samples only** — they are not executed by the CAP application. They are included to show familiarity with the SAP ABAP technology stack.

## Files

### `z_inspection_lot.cds` — ABAP CDS View
Equivalent of `db/schema.cds`. Demonstrates:
- ABAP CDS View definitions with `@AbapCatalog` and `@ObjectModel` annotations
- `@OData.publish: true` to auto-expose as OData service via SAP Gateway
- Association definitions between Inspection Lots and Results
- Built-in SAP QM table references (QALS, QASE)

### `zcl_inspection_api.abap` — ABAP Class
Equivalent of `srv/inspection-service.js`. Demonstrates:
- ABAP OO class implementing CRUD operations and Usage Decision
- `SELECT`, `INSERT`, `MODIFY`, `UPDATE` patterns with proper ABAP syntax
- Number range handling for auto-generating Inspection Lot IDs
- Exception handling with `cx_` exception classes
- Usage Decision workflow with `BAPI_INSPLOT_SETUSAGEDECISION` reference
- Status validation before allowing state transitions

### `z_inspection_odata.segw` — SAP Gateway Service Documentation
Documents how the OData service would be configured in SAP Gateway (transaction SEGW). Covers:
- Entity Type and Entity Set definitions
- Navigation Property configuration
- Service registration and activation steps
- DPC/MPC class generation

## How These Map to CAP

| CAP File | ABAP Equivalent | Purpose |
|----------|----------------|---------|
| `db/schema.cds` | `z_inspection_lot.cds` | Data model definition |
| `srv/inspection-service.js` | `zcl_inspection_api.abap` | Business logic / CRUD |
| `srv/inspection-service.cds` | `z_inspection_odata.segw` | OData service exposure |
