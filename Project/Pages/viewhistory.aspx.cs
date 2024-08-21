using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_FinanceHome : System.Web.UI.Page
{
    private DataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
        db = new DataClassesDataContext("Data Source=LAPTOP-NBC2SOFE\\MSSQLSERVER01;Initial Catalog=Bank Medical DB;Integrated Security=True");

        if (!IsPostBack)
        {
            LoadRequestsHistory();
            LoadPrescriptionsHistory();
        }
    }

    private void LoadRequestsHistory()
    {
        var query = db.Appointments
        .Select(ap => new
        {
            ap.EmployeeID,
            ApStatus = ap.ApStatus == 1 ? "Accepted" :
                       ap.ApStatus == 0 ? "Declined" :
                       ap.ApStatus == 2 ? "Pending" : "Unknown",
            ap.Diagnosis,
            ap.FinanceID,
            ActionTaken = ap.ApStatus == 1 ? "Accepted" :
                          ap.ApStatus == 0 ? "Declined" : "Pending" // Show the action taken
        }).ToList();

        RequestsHistoryGridView.DataSource = query;
        RequestsHistoryGridView.DataBind();
    }

    private void LoadPrescriptionsHistory()
    {
        var query = db.Prescriptions
        .Select(pr => new
        {
            pr.AppointmentID,
            PayStatus = pr.PayStatus == 1 ? "Paid" :
                        pr.PayStatus == 0 ? "Unpaid" : "Pending",
            pr.Monthly,
            pr.SupplyDate,
            ActionTaken = pr.PayStatus == 1 ? "Paid" :
                          pr.PayStatus == 0 ? "Unpaid" : "Pending" // Show the action taken
        }).ToList();

        PrescriptionsHistoryGridView.DataSource = query;
        PrescriptionsHistoryGridView.DataBind();
    }

    // Methods for handling row commands for accepting/declining requests and prescriptions
    protected void RequestsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Accept" || e.CommandName == "Decline")
        {
            int employeeId = Convert.ToInt32(e.CommandArgument);
            UpdateRequestStatus(employeeId, e.CommandName);
        }
    }

    private void UpdateRequestStatus(int employeeId, string action)
    {
        try
        {
            var appointment = db.Appointments.SingleOrDefault(ap => ap.EmployeeID == employeeId);

            if (appointment != null)
            {
                appointment.ApStatus = action == "Accept" ? 1 : 0; // 1 for accepted, 0 for declined

                db.SubmitChanges();

                LoadRequestsHistory(); // Reload the history after update

                // Display a simple JavaScript alert
                string message = "Request " + action + "d successfully!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message + "');", true);
            }
        }
        catch (Exception ex)
        {
            // Display a simple JavaScript alert
            string errorMessage = "Error updating request: " + ex.Message;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage + "');", true);
        }
    }

    protected void PrescriptionsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AcceptPrescription" || e.CommandName == "DeclinePrescription")
        {
            int appointmentId = Convert.ToInt32(e.CommandArgument);
            UpdatePrescriptionStatus(appointmentId, e.CommandName);
        }
    }

    private void UpdatePrescriptionStatus(int appointmentId, string action)
    {
        try
        {
            var prescription = db.Prescriptions.SingleOrDefault(pr => pr.AppointmentID == appointmentId);

            if (prescription != null)
            {
                if (action == "AcceptPrescription")
                {
                    prescription.PayStatus = 1; // 1 for paid
                    prescription.SupplyDate = DateTime.Now; // Set SupplyDate to the current date
                }
                else if (action == "DeclinePrescription")
                {
                    prescription.PayStatus = 0; // 0 for unpaid
                }

                db.SubmitChanges();

                LoadPrescriptionsHistory(); // Reload the history after update

                // Display a simple JavaScript alert
                string message = "Prescription " + action + "d successfully!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "alert('" + message + "');", true);
            }
        }
        catch (Exception ex)
        {
            // Display a simple JavaScript alert
            string errorMessage = "Error updating prescription: " + ex.Message;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "alert('" + errorMessage + "');", true);
        }
    }
}
