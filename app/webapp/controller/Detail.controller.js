sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "qi/app/model/formatter"
], function (Controller, formatter) {
    "use strict";

    return Controller.extend("qi.app.controller.Detail", {
        formatter: formatter,

        onInit: function () {
            this.getOwnerComponent().getRouter()
                .getRoute("detail")
                .attachPatternMatched(this._onRouteMatched, this);
        },

        _onRouteMatched: function (oEvent) {
            var sLotId = oEvent.getParameter("arguments").inspectionId;

            this.getView().bindElement({
                path: "/Inspections('" + sLotId + "')",
                parameters: {
                    $expand: "Results"
                }
            });
        },

        onNavBack: function () {
            this.getOwnerComponent().getRouter().navTo("main", {}, true);
        }
    });
});
