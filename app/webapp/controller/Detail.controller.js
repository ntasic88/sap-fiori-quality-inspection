sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/json/JSONModel",
    "qi/app/model/formatter"
], function (Controller, Filter, FilterOperator, JSONModel, formatter) {
    "use strict";

    return Controller.extend("qi.app.controller.Detail", {
        formatter: formatter,

        onInit: function () {
            var oDetailModel = new JSONModel({
                characteristicsCount: "",
                resultsCount: "",
                hasUsageDecision: false,
                usageDecision: {},
                lotStatus: {}
            });
            this.getView().setModel(oDetailModel, "detailView");

            this.getOwnerComponent().getRouter()
                .getRoute("detail")
                .attachPatternMatched(this._onRouteMatched, this);
        },

        _onRouteMatched: function (oEvent) {
            var sLotId = oEvent.getParameter("arguments").inspectionId;
            this._sLotId = sLotId;

            // Bind the page to the inspection lot
            this.getView().bindElement({
                path: "/Inspections('" + sLotId + "')"
            });

            // Filter results table
            var oResultsBinding = this.byId("resultsTable").getBinding("items");
            if (oResultsBinding) {
                oResultsBinding.filter(new Filter("InspectionLot", FilterOperator.EQ, sLotId));
            }

            // Filter characteristics table
            var oCharcBinding = this.byId("characteristicsTable").getBinding("items");
            if (oCharcBinding) {
                oCharcBinding.filter(new Filter("InspectionLot", FilterOperator.EQ, sLotId));
            }

            // Load usage decision data
            this._loadUsageDecision(sLotId);

            // Load lot status flags
            this._loadLotStatus(sLotId);

            // Reset tab to overview
            this.byId("detailTabBar").setSelectedKey("overview");
        },

        _loadUsageDecision: function (sLotId) {
            var oModel = this.getView().getModel();
            var oDetailModel = this.getView().getModel("detailView");
            var that = this;

            var sPath = "/UsageDecisions('" + sLotId + "')";
            var oContext = oModel.bindContext(sPath);

            oContext.requestObject().then(function (oData) {
                if (oData && oData.UsageDecisionCode) {
                    oDetailModel.setProperty("/hasUsageDecision", true);
                    oDetailModel.setProperty("/usageDecision", oData);
                } else {
                    oDetailModel.setProperty("/hasUsageDecision", false);
                    oDetailModel.setProperty("/usageDecision", {});
                }
            }).catch(function () {
                oDetailModel.setProperty("/hasUsageDecision", false);
                oDetailModel.setProperty("/usageDecision", {});
            });
        },

        _loadLotStatus: function (sLotId) {
            var oModel = this.getView().getModel();
            var that = this;

            var sPath = "/InspectionLotStatuses('" + sLotId + "')";
            var oContext = oModel.bindContext(sPath);

            oContext.requestObject().then(function (oData) {
                if (oData) {
                    that._updateStatusIcons(oData);
                    that._updateHeaderStatus(oData);
                }
            }).catch(function () {
                // Status not available
            });
        },

        _updateStatusIcons: function (oStatus) {
            var fnSetIcon = function (sId, bActive) {
                var oIcon = this.byId(sId);
                if (oIcon) {
                    if (bActive) {
                        oIcon.setSrc("sap-icon://accept");
                        oIcon.setColor("Positive");
                    } else {
                        oIcon.setSrc("sap-icon://status-inactive");
                        oIcon.setColor("Default");
                    }
                }
            }.bind(this);

            fnSetIcon("statusCreatedIcon", oStatus.IsCreated === "X");
            fnSetIcon("statusReleasedIcon", oStatus.IsReleased === "X");
            fnSetIcon("statusResultsIcon", oStatus.IsResultsConfirmed === "X");
            fnSetIcon("statusCompletedIcon", oStatus.IsInspectionCompleted === "X");
            fnSetIcon("statusCanceledIcon", oStatus.IsCanceled === "X");
        },

        _updateHeaderStatus: function (oStatus) {
            var oStatusDisplay = this.byId("lotStatusDisplay");
            if (!oStatusDisplay) return;

            var sText, sState;
            if (oStatus.IsCanceled === "X") {
                sText = "Canceled";
                sState = "Error";
            } else if (oStatus.IsInspectionCompleted === "X") {
                sText = "Inspection Completed";
                sState = "Success";
            } else if (oStatus.IsResultsConfirmed === "X") {
                sText = "Results Confirmed";
                sState = "Information";
            } else if (oStatus.IsReleased === "X") {
                sText = "Released";
                sState = "Warning";
            } else if (oStatus.IsCreated === "X") {
                sText = "Created";
                sState = "None";
            } else {
                sText = "";
                sState = "None";
            }

            oStatusDisplay.setText(sText);
            oStatusDisplay.setState(sState);
        },

        onNavBack: function () {
            this.getOwnerComponent().getRouter().navTo("main", {}, true);
        }
    });
});
