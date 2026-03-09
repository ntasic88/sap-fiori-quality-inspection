const cds = require('@sap/cds');

cds.on('bootstrap', (app) => {
    // Block access to node_modules via the dev server
    app.use('/node_modules', (req, res) => {
        res.status(403).send('Forbidden');
    });
});

module.exports = cds.server;
