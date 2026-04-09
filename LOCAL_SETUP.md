# Local Setup Guide

## Prerequisites

- **Node.js** >= 18 (tested with v25)
- **npm** >= 9 (comes with Node.js)

## Quick Start with Docker (No Prerequisites)

```bash
# 1. Clone the repo
git clone https://github.com/nicktasic/sap-fiori-quality-inspection.git
cd sap-fiori-quality-inspection

# 2. Start the app
docker compose up

# Stop the app
docker compose down
```

The app will be available at **http://localhost:4004/webapp/index.html**

## Quick Start (Local Development)

```bash
# 1. Clone the repo
git clone https://github.com/nicktasic/sap-fiori-quality-inspection.git
cd sap-fiori-quality-inspection

# 2. Install dependencies
npm install

# 3. Start the local dev server (live reload)
npm run watch
```

The app will be available at **http://localhost:4004/webapp/index.html**

### Mocked Users (Local Only)

| Username    | Password    | Role            |
|-------------|-------------|-----------------|
| `manager`   | `manager`   | QualityManager  |
| `inspector` | `inspector` | Inspector       |

## What `npm install` Gives You

All tools needed for local development are installed as project dependencies — no global installs required:

| Dependency       | Purpose                                    |
|------------------|--------------------------------------------|
| `@sap/cds`       | CAP runtime                                |
| `@sap/cds-dk`    | CDS CLI tools (`cds watch`, `cds build`)   |
| `@cap-js/sqlite` | In-memory SQLite for local persistence     |
| `express`        | HTTP server                                |
| `@sap-cloud-sdk/*` | SAP Cloud SDK for S4 API connectivity   |

## npm Scripts

```bash
npm run watch    # Start local dev server with live reload
npm run build    # Build CDS models for production
npm test         # Run tests
```

## SAP S4 API (Sandbox)

The app connects to the SAP S4/HANA sandbox API out of the box. The API key is configured in `package.json` under `cds.requires.OP_API_INSPECTIONLOT_SRV_0001`.

**Note:** The sandbox API is read-only. Write operations (e.g., Accept/Reject usage decisions) will return a `405 Method Not Allowed` error. This is expected — the code is production-ready and would succeed against a real S4/HANA system.

## Deploy to Cloud Foundry (Optional)

Deployment requires additional global tools:

```bash
# Install MTA Build Tool
npm install -g mbt

# Install Cloud Foundry CLI
# macOS:
brew install cloudfoundry/tap/cf-cli@8

# Install the MTA plugin for CF CLI
cf install-plugin multiapps

# Login to CF
cf login -a https://api.cf.us10-001.hana.ondemand.com
```

Then deploy:

```bash
npm run build
mbt build
cf deploy mta_archives/sap-fiori-quality-inspection_1.0.0.mtar
```

## Troubleshooting

**`cds: command not found`**
Use `npm run watch` or `npm run build` instead of calling `cds` directly. These npm scripts use the local `cds` from `node_modules/.bin/`.

**`npm install` fails on `@sap/xssec`**
This package requires Python and build tools on some systems. For local development only, you can skip it — it's only used for XSUAA auth in production.

**Port 4004 already in use**
Kill the existing process: `lsof -ti:4004 | xargs kill`
