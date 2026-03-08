# SAP Fiori Quality Inspection Management

Full-stack SAP application for managing pharmaceutical quality inspection lots, built with **SAP Cloud Application Programming Model (CAP)** and a **SAPUI5 Fiori** frontend. Designed to demonstrate a realistic **LIMS (Laboratory Information Management System)** workflow in a GxP-regulated pharmaceutical environment.

## Overview

This application demonstrates a realistic Quality Management (QM) workflow as used in pharmaceutical LIMS:

- **Inspection Lot Management** — Create, view, and track quality inspection lots for pharmaceutical materials (samples entering the lab)
- **Inspection Results** — View test characteristics (active ingredient content, hardness, dissolution rate, pH, sterility) with pass/fail valuations against specifications
- **Usage Decision** — Accept or reject inspection lots based on results, determining whether material moves from quality inspection stock to unrestricted-use stock
- **GxP Audit Trail** — Immutable change log recording who changed what and when, supporting 21 CFR Part 11 and EU Annex 11 compliance
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
│    GxP Audit Trail · Status Transitions         │
├─────────────────────────────────────────────────┤
│            SAP CAP Data Model                   │
│       CDS Schema · SQLite / SAP HANA            │
└─────────────────────────────────────────────────┘
```

| Layer | Files | Purpose |
|-------|-------|---------|
| Data Model | `db/schema.cds` | Entity definitions with compositions, associations, and audit trail |
| Service | `srv/inspection-service.cds` | OData V4 service with bound actions, `@requires` authorization, read-only audit log |
| Business Logic | `srv/inspection-service.js` | Status transitions, validation, auto-ID generation, usage decision, audit logging |
| UI | `app/webapp/` | Fiori-compliant freestyle SAPUI5 application |
| Tests | `test/` | Integration tests using `cds.test` |
| ABAP Reference | `abap-equivalents/` | Equivalent SAP S/4HANA ABAP implementation |

## LIMS / QM Domain Concepts

This application models the **SAP QM (Quality Management)** inspection process as used in a pharmaceutical **Laboratory Information Management System (LIMS)**:

1. **Inspection Lot** — A request to inspect a batch of material against quality specifications. In a LIMS context, this represents a sample arriving at the lab for testing (SAP table `QALS`)
2. **Inspection Results** — Individual test measurements recorded by lab technicians against defined characteristics — e.g., active ingredient content must be 400mg ±5% (SAP table `QASE`)
3. **Usage Decision** — The final accept/reject decision that determines whether material moves from quality inspection stock to unrestricted-use stock. This is the critical QM workflow step
4. **Status Flow**: `Created` → `In Progress` → `Completed` (accepted) / `Rejected`
5. **Audit Trail** — Immutable log of every change, required by GxP regulations for pharmaceutical quality systems

### GxP Compliance Concepts

In pharmaceutical IT, all quality-relevant systems must comply with **GxP** (Good Manufacturing/Laboratory Practice) regulations:

- **21 CFR Part 11** (FDA) — Electronic records must be attributable, legible, contemporaneous, original, and accurate (ALCOA+)
- **EU Annex 11** — Computerized systems in GMP environments require audit trails and validated workflows
- **Data Integrity** — Every change to quality data must be logged with who, what, when, and why
- **Computer System Validation (CSV)** — Software changes follow controlled IQ/OQ/PQ qualification phases

This application demonstrates audit trail implementation — every creation, update, and usage decision is logged with timestamp, user, action, and before/after values.

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
| `srv/inspection-service.js` | `zcl_inspection_api.abap` | Business logic — ABAP OO class with BAPIs, number ranges, change documents |
| `srv/inspection-service.cds` | `z_inspection_odata.segw` | OData service — Gateway SEGW configuration + RAP behavior definition |

These files demonstrate ABAP CDS annotations (`@ObjectModel`, `@OData.publish`, `@Semantics`), ABAP SQL with inline declarations, SAP number range handling (`SNRO`), BAPI calls for usage decisions, change document recording (CDHDR/CDPOS), and the RESTful Application Programming Model (RAP) with behavior definitions.
