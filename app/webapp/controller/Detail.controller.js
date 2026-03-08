sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox",
    "sap/m/MessageToast",
    "qi/app/model/formatter"
], function (Controller, MessageBox, MessageToast, formatter) {
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

        onAccept: function () {
            this._recordUsageDecision("Accept");
        },

        onReject: function () {
            var that = this;
            var sMsg = this.getView().getModel("i18n").getResourceBundle().getText("udRejectConfirm");
            MessageBox.confirm(sMsg, {
                onClose: function (oAction) {
                    if (oAction === MessageBox.Action.OK) {
                        that._recordUsageDecision("Reject");
                    }
                }
            });
        },

        _recordUsageDecision: function (sDecision) {
            var oContext = this.getView().getBindingContext();
            var oModel = this.getView().getModel();
            var that = this;

            var oAction = oModel.bindContext(
                "InspectionService.recordUsageDecision(...)",
                oContext
            );
            oAction.setParameter("decision", sDecision);

            oAction.execute().then(function () {
                var sKey = sDecision === "Accept" ? "udAcceptSuccess" : "udRejectSuccess";
                var sMsg = that.getView().getModel("i18n").getResourceBundle().getText(sKey);
                MessageToast.show(sMsg);
                oContext.refresh();
            }).catch(function (oError) {
                MessageBox.error(oError.message);
            });
        },

        onNavBack: function () {
            this.getOwnerComponent().getRouter().navTo("main", {}, true);
        }
    });
});
