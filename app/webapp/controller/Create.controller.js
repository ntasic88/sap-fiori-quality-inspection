sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox",
    "sap/m/MessageToast"
], function (Controller, MessageBox, MessageToast) {
    "use strict";

    return Controller.extend("qi.app.controller.Create", {
        onInit: function () {
        },

        onSave: function () {
            var sMaterialNumber = this.byId("materialNumber").getValue();
            var sMaterialDesc = this.byId("materialDesc").getValue();
            var sPlant = this.byId("plant").getSelectedKey();
            var sInspType = this.byId("inspType").getSelectedKey();
            var sInspector = this.byId("inspector").getValue();
            var sQuantity = this.byId("quantity").getValue();
            var sUoM = this.byId("uom").getSelectedKey();
            var sBatch = this.byId("batchNumber").getValue();

            // Validate required fields
            if (!sMaterialNumber || !sMaterialDesc || !sInspector || !sQuantity || !sBatch) {
                var sMsg = this.getView().getModel("i18n").getResourceBundle().getText("createMandatory");
                MessageBox.warning(sMsg);
                return;
            }

            var oModel = this.getView().getModel();
            var oListBinding = oModel.bindList("/Inspections");

            var oContext = oListBinding.create({
                MaterialNumber: sMaterialNumber,
                MaterialDescription: sMaterialDesc,
                Plant: sPlant,
                InspectionType: sInspType,
                Inspector: sInspector,
                Quantity: parseInt(sQuantity, 10),
                UnitOfMeasure: sUoM,
                BatchNumber: sBatch
            });

            var that = this;
            oContext.created().then(function () {
                var sSuccessMsg = that.getView().getModel("i18n").getResourceBundle().getText("createSuccess");
                MessageToast.show(sSuccessMsg);
                that._clearForm();
                that.getOwnerComponent().getRouter().navTo("main", {}, true);
            }).catch(function (oError) {
                MessageBox.error("Creation failed: " + oError.message);
            });
        },

        onCancel: function () {
            this._clearForm();
            this.getOwnerComponent().getRouter().navTo("main", {}, true);
        },

        _clearForm: function () {
            this.byId("materialNumber").setValue("");
            this.byId("materialDesc").setValue("");
            this.byId("inspector").setValue("");
            this.byId("quantity").setValue("");
            this.byId("batchNumber").setValue("");
        }
    });
});
