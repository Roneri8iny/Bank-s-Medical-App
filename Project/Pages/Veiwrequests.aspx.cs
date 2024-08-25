using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Veiwrequests : System.Web.UI.Page
{
    private DataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
        db = new DataClassesDataContext("Data Source=LAPTOP-NBC2SOFE\\MSSQLSERVER01;Initial Catalog=Bank Medical DB;Integrated Security=True");

        if (!IsPostBack)
        {
            LoadRequests();
            LoadPrescriptions();
        }
    }

    private void LoadRequests()
    {
        var query = db.LabReportsDetails.AsQueryable();

        AppointmentsGridView.DataSource = query.Where(pr => pr.FinancialApprovalStatus == 1).Select(lab => new
        {
            // ReportId , Lab Name, Test Name , Diagnosis, Price 
            lab.ReportID,
            //ApStatus = ap.ApStatus == 2 ? "Accepted" :
            //           ap.ApStatus == 3 ? "Declined" :
            //           ap.ApStatus == 1 ? "Pending" : "Unknown",
            lab.LabReport.LabName,
            lab.Test.TestName,
            Diagnosis = (from app in db.Appointments
                        where app.AppointmentID == lab.LabReport.AppointmentID
                        select app.Diagnosis).FirstOrDefault(),
            lab.Test.Price
        }).ToList();
        AppointmentsGridView.DataBind();
    }

    private void LoadPrescriptions()
    {
        var query = db.PrescriptionsDetails.AsQueryable();
        //var medicineName = (from preD in db.PrescriptionsDetails
        //                           where  )
        //PrescriptionsGridView.DataSource = query.Select(pr => new
        //{
        //    pr.AppointmentID,
        //    RenewalStatus = pr.RenewalStatus == 2 ? "Renewed" :
        //                    pr.RenewalStatus == 3 ? "Not Renewed" :
        //                    pr.RenewalStatus == 1 ? "Pending" : "Unknown",
        //    pr.Monthly
        //}).Where(x => x.RenewalStatus == "Pending").ToList();
        //var quantity = (from preD in db.PrescriptionsDetails
        //                    where  )

        PrescriptionsGridView.DataSource = query.Where(pr => pr.FinanceApprovalStatus == 1).Select(pr => new
        {
            pr.PrescriptionID,
            
            //preID  preDetailMedName  quantity  totalPrice  diagnosis

            //int DID = (from department in db.Departments
            //            where department.DepartmentName == selectedDepartment
            //            select department.DepartmentID).FirstOrDefault();
            pr.Medicine.MedicineName,
            pr.Quantity,
            TotalPrice = (pr.Quantity * pr.Medicine.Price),
            Diagnosis = (from app in db.Appointments
                        where app.AppointmentID == pr.Prescription.AppointmentID
                        select app.Diagnosis).FirstOrDefault()
            //pr.Medicine.MedicineName
            //RenewalStatus = pr.RenewalStatus == 2 ? "Renewed" :
            //                pr.RenewalStatus == 3 ? "Not Renewed" :"Unknown",
            //pr.Monthly
        }).ToList();
        PrescriptionsGridView.DataBind();
    }

    protected void AppointmentsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Accept" || e.CommandName == "Decline")
        {
            int reportID = Convert.ToInt32(e.CommandArgument);
            UpdateRequestStatus(reportID, e.CommandName);

            // Send JavaScript to hide the row
            LinkButton button = e.CommandSource as LinkButton;
            if (button != null)
            {
                string script = string.Format("handleAction(this, '{0}');", e.CommandName);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideRow", script, true);
            }
        }
    }

    private void UpdateRequestStatus(int reportID, string action)
    {
        try
        {
            var report = db.LabReportsDetails.FirstOrDefault(lab => lab.ReportID == reportID);

            if (report != null)
            {
                //string newStatus = action == "Accept" ? "2" :
                //                action == "Decline" ? "3" : "1"; // 1 for pending


                //var query = db.PrescriptionsDetails.Where(pre => pre.Prescription.Appointment == appointment).FirstOrDefault();
                //query.FinanceApprovalStatus = action == "Accept" ? 2:
                //                              action == "Decline" ? 3 : 1; // 1 for pending


                ////appointment.ApStatus = action == "Accept" ? 2 :
                ////                       action == "Decline" ? 3 : 1; // 1 for pending

                //db.SubmitChanges();

                //// Reload the grid after updating
                //LoadRequests();

                //// Display a simple JavaScript alert
                //string message = string.Format("Request {0}d successfully!", action);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message.Replace("'", "\\'") + "');", true);

                if (action == "Accept")
                {
                    report.FinancialApprovalStatus = 2; // 2 for renewed

                }
                else if (action == "Decline")
                {
                    report.FinancialApprovalStatus = 3; // 3 for not renewed
                }

                db.SubmitChanges();

                // Reload the grid after updating
                LoadPrescriptions();

                // Display a simple JavaScript alert
                string message = string.Format("Lab Report {0}d successfully!", action);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message.Replace("'", "\\'") + "');", true);

                //        var prescription = db.PrescriptionsDetails.SingleOrDefault(pr => pr.PrescriptionID == prescriptionId);

                //    if (prescription != null)
                //    {
                //        if (action == "AcceptPrescription")
                //        {
                //            prescription.FinanceApprovalStatus = 2; // 2 for renewed

                //        }
                //        else if (action == "DeclinePrescription")
                //        {
                //            prescription.FinanceApprovalStatus = 3; // 3 for not renewed
                //        }

                //        db.SubmitChanges();

                //        // Reload the grid after updating
                //        LoadPrescriptions();

                //        // Display a simple JavaScript alert
                //        string message = string.Format("Prescription {0}d successfully!", action);
                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message.Replace("'", "\\'") + "');", true);
                //    }
                //}
                //catch (Exception ex)
                //{
                //    // Display a simple JavaScript alert
                //    string errorMessage = string.Format("Error updating request: {0}", ex.Message);
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage.Replace("'", "\\'") + "');", true);
                //}
            }
        }
        catch (Exception ex)
        {
            // Display a simple JavaScript alert
            string errorMessage = string.Format("Error updating lab reports: {0}", ex.Message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage.Replace("'", "\\'") + "');", true);
        }
    }

    protected void PrescriptionsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AcceptPrescription" || e.CommandName == "DeclinePrescription")
    {
        int prescriptionId = Convert.ToInt32(e.CommandArgument);
        UpdatePrescriptionStatus(prescriptionId, e.CommandName);

        // Send JavaScript to hide the row
        LinkButton button = e.CommandSource as LinkButton;
        if (button != null)
        {
            string script = string.Format("handleAction(this, '{0}');", e.CommandName);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideRow", script, true);
        }
        }
    }

    private void UpdatePrescriptionStatus(int prescriptionId, string action)
    {
        try
        {
            var prescription = db.PrescriptionsDetails.SingleOrDefault(pr => pr.PrescriptionID == prescriptionId);

            if (prescription != null)
            {
                if (action == "AcceptPrescription")
                {
                    prescription.FinanceApprovalStatus = 2; // 2 for renewed
                    
                }
                else if (action == "DeclinePrescription")
                {
                    prescription.FinanceApprovalStatus = 3; // 3 for not renewed
                }

                db.SubmitChanges();

                // Reload the grid after updating
                LoadPrescriptions();

                // Display a simple JavaScript alert
                string message = string.Format("Prescription {0}d successfully!", action);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message.Replace("'", "\\'") + "');", true);
            }
        }
        catch (Exception ex)
        {
            // Display a simple JavaScript alert
            string errorMessage = string.Format("Error updating prescription: {0}", ex.Message);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage.Replace("'", "\\'") + "');", true);
        }
    }

    public int? employeeId { get; set; }
}
