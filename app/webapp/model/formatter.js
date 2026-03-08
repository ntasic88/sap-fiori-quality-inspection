sap.ui.define([], function () {
    "use strict";

    return {
        statusState: function (sStatus) {
            switch (sStatus) {
                case "Completed":
                    return "Success";
                case "In Progress":
                    return "Warning";
                case "Created":
                    return "Information";
                case "Rejected":
                    return "Error";
                default:
                    return "None";
            }
        },

        statusIcon: function (sStatus) {
            switch (sStatus) {
                case "Completed":
                    return "sap-icon://accept";
                case "In Progress":
                    return "sap-icon://process";
                case "Created":
                    return "sap-icon://document";
                case "Rejected":
                    return "sap-icon://decline";
                default:
                    return "sap-icon://question-mark";
            }
        },

        valuationState: function (sValuation) {
            switch (sValuation) {
                case "Pass":
                    return "Success";
                case "Fail":
                    return "Error";
                default:
                    return "None";
            }
        },

        usageDecisionState: function (sCode) {
            switch (sCode) {
                case "Accept":
                    return "Success";
                case "Reject":
                    return "Error";
                default:
                    return "None";
            }
        },

        usageDecisionText: function (sCode) {
            switch (sCode) {
                case "Accept":
                    return "Accepted";
                case "Reject":
                    return "Rejected";
                default:
                    return "";
            }
        },

        changeActionState: function (sAction) {
            switch (sAction) {
                case "CREATE":
                    return "Success";
                case "UPDATE":
                    return "Warning";
                case "USAGE_DECISION":
                    return "Information";
                default:
                    return "None";
            }
        },

        formatTimestamp: function (sTimestamp) {
            if (!sTimestamp) {
                return "";
            }
            var oDate = new Date(sTimestamp);
            return oDate.toLocaleDateString("en-US", {
                year: "numeric",
                month: "short",
                day: "2-digit"
            }) + " " + oDate.toLocaleTimeString("en-US", {
                hour: "2-digit",
                minute: "2-digit",
                second: "2-digit"
            });
        },

        formatDate: function (sDate) {
            if (!sDate) {
                return "";
            }
            var oDate = new Date(sDate);
            return oDate.toLocaleDateString("en-US", {
                year: "numeric",
                month: "short",
                day: "2-digit"
            });
        }
    };
});
