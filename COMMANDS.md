# Useful Commands

## Local Development

```bash
# Start local server with live reload
cds watch

# Start without live reload
cds serve all --with-mocks --in-memory

# Run tests
npm test
```

## Build & Deploy

```bash
# Build CDS for production
cds build --production

# Build MTA archive
mbt build

# Deploy to Cloud Foundry
cf deploy mta_archives/sap-fiori-quality-inspection_1.0.0.mtar

# Deploy and clean up unused services
cf deploy mta_archives/sap-fiori-quality-inspection_1.0.0.mtar --delete-services
```

## Cloud Foundry

```bash
# Login
cf login -a https://api.cf.us10-001.hana.ondemand.com

# Check current target (org/space)
cf target

# List running apps
cf apps

# App status & details
cf app quality-inspection-srv
cf app quality-inspection-app
```

## Logs

```bash
# Live tail (real-time) - backend service
cf logs quality-inspection-srv

# Live tail - frontend approuter
cf logs quality-inspection-app

# Recent logs (last few minutes)
cf logs quality-inspection-srv --recent
cf logs quality-inspection-app --recent
```

## Debugging & Troubleshooting

```bash
# Check app environment variables
cf env quality-inspection-srv

# SSH into running app
cf ssh quality-inspection-srv

# Restart app
cf restart quality-inspection-srv

# Restage app (after env changes)
cf restage quality-inspection-srv

# Check service bindings
cf services

# Check service key details
cf service-key quality-inspection-auth quality-inspection-auth-key
```

## Scaling

```bash
# Scale memory
cf scale quality-inspection-srv -m 512M

# Scale instances
cf scale quality-inspection-srv -i 2

# Scale disk
cf scale quality-inspection-srv -k 1G
```

## Undeploy

```bash
# Remove everything (apps + services)
cf undeploy sap-fiori-quality-inspection --delete-services --delete-service-keys

# Remove apps only, keep services
cf undeploy sap-fiori-quality-inspection
```

## OData Testing (Local)

```bash
# Fetch inspections
curl -s 'http://localhost:4004/odata/v4/InspectionService/Inspections?$top=3' -u alice:

# Fetch with filter
curl -s 'http://localhost:4004/odata/v4/InspectionService/Inspections?$filter=HasUsageDecision%20eq%20true&$top=3' -u alice:

# Check metadata
curl -s 'http://localhost:4004/odata/v4/InspectionService/$metadata' -u alice:
```

## URLs

- **Local**: http://localhost:4004/webapp/index.html
- **Deployed**: https://28b5a8aetrial-dev-quality-inspection-app.cfapps.us10-001.hana.ondemand.com
