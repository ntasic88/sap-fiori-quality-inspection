sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Sorter",
    "qi/app/model/formatter"
], function (Controller, Filter, FilterOperator, JSONModel, Sorter, formatter) {
    "use strict";

    return Controller.extend("qi.app.controller.Main", {
        formatter: formatter,

        onInit: function () {
            var oViewModel = new JSONModel({
                sortDescending: true
            });
            this.getView().setModel(oViewModel, "mainView");
        },

        onItemPress: function (oEvent) {
            var oItem = oEvent.getParameter("listItem");
            var oContext = oItem.getBindingContext();
            var sLotId = oContext.getProperty("InspectionLotID");

            this.getOwnerComponent().getRouter().navTo("detail", {
                inspectionId: sLotId
            });
        },

        onSearch: function (oEvent) {
            var sQuery = oEvent.getParameter("query") || oEvent.getParameter("newValue") || "";
            this._applyAllFilters(sQuery);
        },

        onFilterChange: function () {
            var sQuery = this.byId("searchField").getValue();
            this._applyAllFilters(sQuery);
        },

        onSort: function () {
            var oViewModel = this.getView().getModel("mainView");
            var bDescending = !oViewModel.getProperty("/sortDescending");
            oViewModel.setProperty("/sortDescending", bDescending);

            var oBinding = this.byId("inspectionTable").getBinding("items");
            if (oBinding) {
                oBinding.sort(new Sorter("InspectionLotID", bDescending));
            }
        },

        _applyAllFilters: function (sSearchQuery) {
            var aFilters = [];

            // Search filter
            if (sSearchQuery) {
                aFilters.push(new Filter({
                    filters: [
                        new Filter("InspectionLotID", FilterOperator.Contains, sSearchQuery),
                        new Filter("MaterialNumber", FilterOperator.Contains, sSearchQuery),
                        new Filter("MaterialDescription", FilterOperator.Contains, sSearchQuery)
                    ],
                    and: false
                }));
            }

            // Inspection type filter
            var sTypeKey = this.byId("inspTypeFilter").getSelectedKey();
            if (sTypeKey && sTypeKey !== "All") {
                aFilters.push(new Filter("InspectionType", FilterOperator.EQ, sTypeKey));
            }

            // Plant filter
            var sPlantKey = this.byId("plantFilter").getSelectedKey();
            if (sPlantKey && sPlantKey !== "All") {
                aFilters.push(new Filter("Plant", FilterOperator.EQ, sPlantKey));
            }

            // Status filter
            var sStatusKey = this.byId("statusFilter").getSelectedKey();
            if (sStatusKey === "Open") {
                aFilters.push(new Filter("HasUsageDecision", FilterOperator.EQ, false));
            } else if (sStatusKey === "DecisionMade") {
                aFilters.push(new Filter("HasUsageDecision", FilterOperator.EQ, true));
            }

            var oBinding = this.byId("inspectionTable").getBinding("items");
            if (oBinding) {
                if (aFilters.length > 0) {
                    oBinding.filter(new Filter({
                        filters: aFilters,
                        and: true
                    }));
                } else {
                    oBinding.filter([]);
                }
            }
        }
    });
});
