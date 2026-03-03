sap.ui.define([
    "sap/ui/core/UIComponent",
    "qi/app/model/models"
], function (UIComponent, models) {
    "use strict";

    return UIComponent.extend("qi.app.Component", {
        metadata: {
            manifest: "json"
        },

        init: function () {
            UIComponent.prototype.init.apply(this, arguments);
            this.setModel(models.createDeviceModel(), "device");
            this.getRouter().initialize();
        }
    });
});
