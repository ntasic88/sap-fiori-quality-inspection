sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "qi/app/model/formatter"
], function (Controller, Filter, FilterOperator, formatter) {
    "use strict";

    return Controller.extend("qi.app.controller.Main", {
        formatter: formatter,

        onInit: function () {
        },

        onItemPress: function (oEvent) {
            var oItem = oEvent.getParameter("listItem");
            var oContext = oItem.getBindingContext();
            var sLotId = oContext.getProperty("InspectionLotID");

            this.getOwnerComponent().getRouter().navTo("detail", {
                inspectionId: sLotId
            });
        },

        onCreatePress: function () {
            this.getOwnerComponent().getRouter().navTo("create");
        },

        onSearch: function (oEvent) {
            var sQuery = oEvent.getParameter("query") || oEvent.getParameter("newValue") || "";
            this._applyFilters(sQuery);
        },

        onStatusFilterChange: function () {
            var sQuery = this.byId("searchField").getValue();
            this._applyFilters(sQuery);
        },

        _applyFilters: function (sSearchQuery) {
            var aFilters = [];
            var sStatusKey = this.byId("statusFilter").getSelectedKey();

            if (sSearchQuery) {
                var aSearchFilters = [
                    new Filter("InspectionLotID", FilterOperator.Contains, sSearchQuery),
                    new Filter("MaterialDescription", FilterOperator.Contains, sSearchQuery),
                    new Filter("MaterialNumber", FilterOperator.Contains, sSearchQuery),
                    new Filter("Inspector", FilterOperator.Contains, sSearchQuery),
                    new Filter("BatchNumber", FilterOperator.Contains, sSearchQuery)
                ];
                aFilters.push(new Filter({
                    filters: aSearchFilters,
                    and: false
                }));
            }

            if (sStatusKey && sStatusKey !== "All") {
                aFilters.push(new Filter("Status", FilterOperator.EQ, sStatusKey));
            }

            var oBinding = this.byId("inspectionTable").getBinding("items");
            if (aFilters.length > 0) {
                oBinding.filter(new Filter({
                    filters: aFilters,
                    and: true
                }));
            } else {
                oBinding.filter([]);
            }
        }
    });
});
