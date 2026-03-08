sap.ui.define([], function () {
    "use strict";

    return {
        statusText: function (bHasDecision) {
            if (bHasDecision === true || bHasDecision === "X" || bHasDecision === "true" || bHasDecision === "Yes") {
                return "Decision Made";
            }
            return "Open";
        },

        statusState: function (bHasDecision) {
            if (bHasDecision === true || bHasDecision === "X" || bHasDecision === "true" || bHasDecision === "Yes") {
                return "Success";
            }
            return "Warning";
        },

        statusIcon: function (bHasDecision) {
            if (bHasDecision === true || bHasDecision === "X" || bHasDecision === "true" || bHasDecision === "Yes") {
                return "sap-icon://accept";
            }
            return "sap-icon://pending";
        },

        valuationState: function (sValuation) {
            switch (sValuation) {
                case "A":
                    return "Success";
                case "R":
                case "F":
                    return "Error";
                default:
                    return "None";
            }
        },

        valuationText: function (sValuation) {
            switch (sValuation) {
                case "A":
                    return "Accepted";
                case "R":
                    return "Rejected";
                case "F":
                    return "Failed";
                default:
                    return sValuation || "";
            }
        },

        inspectionTypeText: function (sType) {
            switch (sType) {
                case "01":
                    return "Goods Receipt";
                case "02":
                    return "GR Blocked Stock";
                case "03":
                    return "In-Process";
                case "04":
                    return "Final Inspection";
                case "05":
                    return "Goods Issue";
                case "06":
                    return "Audit Inspection";
                case "07":
                    return "Delivery";
                case "08":
                    return "Recurring";
                case "09":
                    return "Other";
                case "89":
                    return "Stability Study";
                default:
                    return sType || "";
            }
        },

        inspectionTypeIcon: function (sType) {
            switch (sType) {
                case "01":
                case "02":
                    return "sap-icon://shipping-status";
                case "03":
                    return "sap-icon://process";
                case "04":
                    return "sap-icon://complete";
                case "05":
                    return "sap-icon://outbox";
                case "06":
                    return "sap-icon://inspect";
                case "08":
                    return "sap-icon://history";
                case "89":
                    return "sap-icon://lab";
                default:
                    return "sap-icon://inspection";
            }
        },

        lotStatusText: function (sCreated, sReleased, sResultsConfirmed, sCompleted, sCanceled) {
            if (sCanceled === "X") return "Canceled";
            if (sCompleted === "X") return "Completed";
            if (sResultsConfirmed === "X") return "Results Confirmed";
            if (sReleased === "X") return "Released";
            if (sCreated === "X") return "Created";
            return "Unknown";
        },

        lotStatusState: function (sCreated, sReleased, sResultsConfirmed, sCompleted, sCanceled) {
            if (sCanceled === "X") return "Error";
            if (sCompleted === "X") return "Success";
            if (sResultsConfirmed === "X") return "Information";
            if (sReleased === "X") return "Warning";
            if (sCreated === "X") return "None";
            return "None";
        },

        lotStatusIcon: function (sCreated, sReleased, sResultsConfirmed, sCompleted, sCanceled) {
            if (sCanceled === "X") return "sap-icon://sys-cancel-2";
            if (sCompleted === "X") return "sap-icon://accept";
            if (sResultsConfirmed === "X") return "sap-icon://complete";
            if (sReleased === "X") return "sap-icon://unlocked";
            if (sCreated === "X") return "sap-icon://create";
            return "sap-icon://status-inactive";
        },

        qualityScoreState: function (iScore) {
            var nScore = parseInt(iScore, 10);
            if (isNaN(nScore)) return "None";
            if (nScore >= 80) return "Success";
            if (nScore >= 50) return "Warning";
            return "Error";
        },

        qualityScoreIcon: function (iScore) {
            var nScore = parseInt(iScore, 10);
            if (isNaN(nScore)) return "sap-icon://question-mark";
            if (nScore >= 80) return "sap-icon://quality-issue";
            if (nScore >= 50) return "sap-icon://warning2";
            return "sap-icon://error";
        },

        formatQuantityWithUnit: function (sQty, sUnit) {
            if (!sQty && sQty !== 0) return "";
            var qty = parseFloat(sQty);
            if (isNaN(qty)) return "";
            var formatted = qty % 1 === 0 ? qty.toLocaleString() : qty.toLocaleString(undefined, { minimumFractionDigits: 1, maximumFractionDigits: 3 });
            return sUnit ? formatted + " " + sUnit : formatted;
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
        },

        resultStatusText: function (sStatus) {
            switch (sStatus) {
                case "1":
                    return "Open";
                case "2":
                    return "In Process";
                case "3":
                    return "Recorded";
                case "4":
                    return "Closed";
                case "5":
                    return "Valuated";
                default:
                    return sStatus || "";
            }
        },

        characteristicTypeText: function (bIsQuantitative) {
            if (bIsQuantitative === true || bIsQuantitative === "X" || bIsQuantitative === "true") {
                return "Quantitative";
            }
            return "Qualitative";
        },

        characteristicTypeIcon: function (bIsQuantitative) {
            if (bIsQuantitative === true || bIsQuantitative === "X" || bIsQuantitative === "true") {
                return "sap-icon://measure";
            }
            return "sap-icon://checklist-item";
        },

        formatSpecLimits: function (sLower, sUpper, sHasLower, sHasUpper) {
            var parts = [];
            if (sHasLower === "X" && sLower) {
                parts.push(sLower);
            } else {
                parts.push("-\u221E");
            }
            parts.push(" \u2013 ");
            if (sHasUpper === "X" && sUpper) {
                parts.push(sUpper);
            } else {
                parts.push("+\u221E");
            }
            if (sHasLower !== "X" && sHasUpper !== "X") {
                return "";
            }
            return parts.join("");
        },

        udValuationText: function (sVal) {
            switch (sVal) {
                case "A":
                    return "Accepted";
                case "R":
                    return "Rejected";
                default:
                    return sVal || "Not Set";
            }
        },

        udValuationState: function (sVal) {
            switch (sVal) {
                case "A":
                    return "Success";
                case "R":
                    return "Error";
                default:
                    return "None";
            }
        }
    };
});
