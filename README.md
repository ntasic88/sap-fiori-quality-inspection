# SAP Fiori Quality Inspection Management

Full-stack SAP application for managing pharmaceutical quality inspection lots, built with **SAP Cloud Application Programming Model (CAP)** and a **SAPUI5 Fiori** frontend.

## Overview

This application demonstrates a realistic Quality Management (QM) workflow:

- **Inspection Lot Management** — Create, view, and track quality inspection lots for pharmaceutical materials
- **Inspection Results** — View test characteristics (active ingredient content, hardness, dissolution rate, pH, etc.) with pass/fail valuations
- **Usage Decision** — Accept or reject inspection lots based on results, with enforced status transitions and validation
- **Role-Based Access** — Mock authentication with Inspector (read-only) and Quality Manager (full access) roles
- **Bilingual UI** — Full English and German (i18n) translations

## Architecture

```
┌─────────────────────────────────────────────────┐
│               SAP Fiori UI (SAPUI5)             │
│        XML Views · JS Controllers · OData V4    │
├─────────────────────────────────────────────────┤
│            SAP CAP Service Layer                │
│    CDS Service Definition · Node.js Logic       │
│    Bound Actions · Authorization · Validation   │
├─────────────────────────────────────────────────┤
│            SAP CAP Data Model                   │
│       CDS Schema · SQLite / SAP HANA            │
└─────────────────────────────────────────────────┘
```

| Layer | Files | Purpose |
|-------|-------|---------|
| Data Model | `db/schema.cds` | Entity definitions with compositions and associations |
| Service | `srv/inspection-service.cds` | OData V4 service with bound actions and `@requires` authorization |
| Business Logic | `srv/inspection-service.js` | Status transitions, validation, auto-ID generation, usage decision |
| UI | `app/webapp/` | Fiori-compliant freestyle SAPUI5 application |
| Tests | `test/` | Integration tests using `cds.test` |
| ABAP Reference | `abap-equivalents/` | Equivalent SAP S/4HANA ABAP implementation |

## QM Domain Concepts

This application models the **SAP QM (Quality Management)** inspection process used in pharmaceutical manufacturing:

1. **Inspection Lot** — A request to inspect a batch of material against quality specifications (SAP table `QALS`)
2. **Inspection Results** — Individual test measurements recorded against inspection characteristics (SAP table `QASE`)
3. **Usage Decision** — The final accept/reject decision that determines whether material moves from quality inspection stock to unrestricted-use stock
4. **Status Flow**: `Created` → `In Progress` → `Completed` (accepted) / `Rejected`

The usage decision is the critical QM workflow step — it cannot be recorded without inspection results, and once recorded, it cannot be changed.

## Running Locally

```bash
npm install
npx cds watch
```

The app starts at [http://localhost:4004](http://localhost:4004). You will be prompted for credentials.

### Mock Users

| User | Password | Role | Permissions |
|------|----------|------|-------------|
| `manager` | `manager` | QualityManager | Full CRUD + Usage Decision |
| `inspector` | `inspector` | Inspector | Read-only access |

### Running Tests

```bash
npm test
```

## Technology Stack

- **SAP CAP** (Cloud Application Programming Model) v8
- **SAPUI5 / OpenUI5** with SAP Fiori design guidelines (`sap_horizon` theme)
- **OData V4** protocol with bound actions
- **CDS** (Core Data Services) for data modeling and service definition
- **SQLite** for local development (SAP HANA for production)
- **Jest** for integration testing via `cds.test`

## ABAP Equivalents

The `abap-equivalents/` directory contains reference ABAP code showing how this application would be implemented in **SAP S/4HANA**:

| CAP File | ABAP Equivalent | Purpose |
|----------|-----------------|---------|
| `db/schema.cds` | `z_inspection_lot.cds` | Data model — ABAP CDS Views on QALS/QASE tables |
| `srv/inspection-service.js` | `zcl_inspection_api.abap` | Business logic — ABAP OO class with BAPIs and number ranges |
| `srv/inspection-service.cds` | `z_inspection_odata.segw` | OData service — Gateway SEGW configuration + RAP behavior definition |

These files demonstrate ABAP CDS annotations (`@ObjectModel`, `@OData.publish`, `@Semantics`), ABAP SQL with inline declarations, SAP number range handling (`SNRO`), BAPI calls for usage decisions, and the RESTful Application Programming Model (RAP) with behavior definitions.
