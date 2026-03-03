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
