sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/json/JSONModel",
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/Label",
    "sap/m/Slider",
    "sap/m/Text",
    "sap/m/VBox",
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "qi/app/model/formatter"
], function (Controller, Filter, FilterOperator, JSONModel, Dialog, Button, Label, Slider, Text, VBox, MessageToast, MessageBox, formatter) {
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
            var oContext = oModel.bindContext(sPath, undefined, { $$groupId: "$auto.usageDecision" });

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
            var oContext = oModel.bindContext(sPath, undefined, { $$groupId: "$auto.lotStatus" });

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

        onAcceptDecision: function () {
            this._openUsageDecisionDialog("A001", "Accept", 80);
        },

        onRejectDecision: function () {
            this._openUsageDecisionDialog("A002", "Reject", 20);
        },

        _openUsageDecisionDialog: function (sDecisionCode, sDecisionType, iDefaultScore) {
            var oBundle = this.getView().getModel("i18n").getResourceBundle();
            var sLotId = this._sLotId;
            var that = this;

            var oSlider = new Slider({
                min: 0,
                max: 100,
                value: iDefaultScore,
                enableTickmarks: true,
                width: "100%"
            });

            var oScoreLabel = new Text({ text: iDefaultScore + " / 100" });
            oSlider.attachLiveChange(function (oEvent) {
                oScoreLabel.setText(oEvent.getParameter("value") + " / 100");
            });

            var oDialog = new Dialog({
                title: oBundle.getText("dialogUsageDecisionTitle"),
                type: "Message",
                contentWidth: "400px",
                content: new VBox({
                    items: [
                        new Label({ text: oBundle.getText("labelLotID") }),
                        new Text({ text: sLotId }).addStyleClass("sapUiSmallMarginBottom"),
                        new Label({ text: oBundle.getText("dialogDecisionType") }),
                        new Text({ text: sDecisionType }).addStyleClass("sapUiSmallMarginBottom"),
                        new Label({ text: oBundle.getText("dialogQualityScoreLabel") }),
                        oSlider,
                        oScoreLabel
                    ]
                }).addStyleClass("sapUiSmallMargin"),
                beginButton: new Button({
                    text: oBundle.getText("dialogConfirm"),
                    type: sDecisionCode === "A001" ? "Accept" : "Reject",
                    press: function () {
                        var iScore = oSlider.getValue();
                        oDialog.close();
                        that._executeUsageDecision(sDecisionCode, iScore);
                    }
                }),
                endButton: new Button({
                    text: oBundle.getText("dialogCancel"),
                    press: function () {
                        oDialog.close();
                    }
                }),
                afterClose: function () {
                    oDialog.destroy();
                }
            });

            oDialog.open();
        },

        _executeUsageDecision: function (sDecisionCode, iQualityScore) {
            var oModel = this.getView().getModel();
            var sLotId = this._sLotId;
            var oBundle = this.getView().getModel("i18n").getResourceBundle();
            var that = this;

            var sPath = "/Inspections('" + sLotId + "')/InspectionService.makeUsageDecision(...)";
            var oContext = oModel.bindContext(sPath);
            oContext.setParameter("decisionCode", sDecisionCode);
            oContext.setParameter("qualityScore", iQualityScore);

            oContext.execute().then(function () {
                MessageToast.show(oBundle.getText("msgUsageDecisionSuccess"));
                // Refresh the page binding and usage decision data
                that.getView().getElementBinding().refresh();
                that._loadUsageDecision(sLotId);
            }).catch(function (oError) {
                var sMsg = oError.message || oBundle.getText("msgUsageDecisionError");
                MessageBox.error(sMsg);
            });
        },

        onNavBack: function () {
            this.getOwnerComponent().getRouter().navTo("main", {}, true);
        }
    });
});
