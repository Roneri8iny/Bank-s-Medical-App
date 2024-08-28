﻿using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_viewhistory : System.Web.UI.Page
{
    private NewAccountDataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
        db = new NewAccountDataClassesDataContext("");

        if (!IsPostBack)
        {
            LoadRequestsHistory();
            LoadPrescriptionsHistory();
        }
    }

    private void LoadRequestsHistory()
    {
        var query = db.LabReportsDetails.Where(pr => pr.FinancialApprovalStatus != 1)
        .Select(lab => new
        {
            lab.ReportID,
            //ApStatus = ap.ApStatus == 2 ? "Accepted" :
            //           ap.ApStatus == 3 ? "Declined" :
            //           ap.ApStatus == 1 ? "Pending" : "Unknown",
            lab.Test.TestName,
            Diagnosis = (from app in db.Appointments
                         where app.AppointmentID == lab.LabReport.AppointmentID
                         select app.Diagnosis).FirstOrDefault(),
            lab.Test.Price,
            PayStatus = lab.FinancialApprovalStatus == 2 ? "Accepted" :
                            lab.FinancialApprovalStatus == 3 ? "Declined" : "Pending",

            AppointmentDate = (from app in db.Appointments
                        where app.AppointmentID == lab.LabReport.AppointmentID
                        select app.AppointmentDate).FirstOrDefault()
            //ActionTaken = ap.ApStatus == 2 ? "Accepted" :
            //              ap.ApStatus == 3? "Declined" : "Pending" // Show the action taken

            //              lab.LabReport.LabName,
            //lab.Test.TestName,
            //Diagnosis = (from app in db.Appointments
            //            where app.AppointmentID == lab.LabReport.AppointmentID
            //            select app.Diagnosis).FirstOrDefault(),
            //lab.Test.Price
        }).ToList();

        RequestsHistoryGridView.DataSource = query;
        RequestsHistoryGridView.DataBind();
    }

    private void LoadPrescriptionsHistory()
    {
        var query = db.PrescriptionsDetails.Where(pr => pr.FinanceApprovalStatus != 1)
        .Select(pr => new
        {
            pr.PrescriptionID,


            pr.Medicine.MedicineName,
            pr.Quantity,
            TotalPrice = (pr.Quantity * pr.Medicine.Price),
            Diagnosis = (from app in db.Appointments
                         where app.AppointmentID == pr.Prescription.AppointmentID
                         select app.Diagnosis).FirstOrDefault(),
            PayStatus = pr.FinanceApprovalStatus == 2 ? "Accepted" :
                            pr.FinanceApprovalStatus == 3 ? "Declined" : "Pending"
        }).ToList();

        PrescriptionsHistoryGridView.DataSource = query;
        PrescriptionsHistoryGridView.DataBind();
    }

    // Methods for handling row commands for accepting/declining requests and prescriptions
    //protected void RequestsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "Accept" || e.CommandName == "Decline")
    //    {
    //        int reportID = Convert.ToInt32(e.CommandArgument);
    //        UpdateRequestStatus(reportID, e.CommandName);
    //    }
    //}

    //private void UpdateRequestStatus(int reportID, string action)
    //{
    //    try
    //    {
    //        var appointment = db.Appointments.SingleOrDefault(ap => ap.EmployeeID == employeeId);

    //        if (appointment != null)
    //        {
    //            appointment.ApStatus = action == "Accept" ? 2 : 3; // 1 for accepted, 0 for declined
    //            appointment.AppointmentDate = DateTime.Now; // Set SupplyDate to the current date

    //            db.SubmitChanges();

    //            LoadRequestsHistory(); // Reload the history after update

    //            // Display a simple JavaScript alert
    //            string message = "Request " + action + "d successfully!";
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message + "');", true);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        // Display a simple JavaScript alert
    //        string errorMessage = "Error updating request: " + ex.Message;
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage + "');", true);
    //    }
    //}

    //protected void PrescriptionsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "AcceptPrescription" || e.CommandName == "DeclinePrescription")
    //    {
    //        int appointmentId = Convert.ToInt32(e.CommandArgument);
    //        UpdatePrescriptionStatus(appointmentId, e.CommandName);
    //    }
    //}

    //private void UpdatePrescriptionStatus(int appointmentId, string action)
    //{
    //    try
    //    {
    //        var prescription = db.Prescriptions.SingleOrDefault(pr => pr.AppointmentID == appointmentId);

    //        if (prescription != null)
    //        {
    //            if (action == "AcceptPrescription")
    //            {
    //                prescription.RenewalStatus = 2; // 1 for paid
    //                prescription.SupplyDate = DateTime.Now; // Set SupplyDate to the current date
    //            }
    //            else if (action == "DeclinePrescription")
    //            {
    //                prescription.RenewalStatus = 3; // 0 for unpaid
    //            }

    //            db.SubmitChanges();

    //            LoadPrescriptionsHistory(); // Reload the history after update

    //            // Display a simple JavaScript alert
    //            string message = "Prescription " + action + "d successfully!";
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message + "');", true);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        // Display a simple JavaScript alert
    //        string errorMessage = "Error updating prescription: " + ex.Message;
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage + "');", true);
    //    }
    //}
}