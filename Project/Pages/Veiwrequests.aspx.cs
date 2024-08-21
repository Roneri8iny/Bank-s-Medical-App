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
            LoadRequests();
            LoadPrescriptions();
        }
    }

    private void LoadRequests()
    {
        var query = db.Appointments.AsQueryable();

        RequestsGridView.DataSource = query.Select(ap => new
        {
            ap.EmployeeID,
            ApStatus = ap.ApStatus == 1 ? "Accepted" :
                       ap.ApStatus == 0 ? "Declined" :
                       ap.ApStatus == 2 ? "Pending" : "Unknown",
            ap.Diagnosis,
            ap.FinanceID,
        }).Where(x => x.ApStatus == "Pending").ToList();
        RequestsGridView.DataBind();
    }

    private void LoadPrescriptions()
    {
        var query = db.Prescriptions.AsQueryable();

        PrescriptionsGridView.DataSource = query.Select(pr => new
        {
            pr.AppointmentID,
            PayStatus = pr.PayStatus == 1 ? "Paid" :
                        pr.PayStatus == 0 ? "Unpaid" :
                        pr.PayStatus == 2 ? "Pending" : "Unknown",
            pr.Monthly,
            pr.SupplyDate
        }).Where(x => x.PayStatus == "Pending").ToList();
        PrescriptionsGridView.DataBind();
    }

    protected void RequestsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Accept" || e.CommandName == "Decline")
        {
            int employeeId = Convert.ToInt32(e.CommandArgument);
            UpdateRequestStatus(employeeId, e.CommandName);

            // Send JavaScript to hide the row
            LinkButton button = e.CommandSource as LinkButton;
            if (button != null)
            {
                string script = "handleAction(this, '" + e.CommandName + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideRow", script, true);
            }
        }
    }

    private void UpdateRequestStatus(int employeeId, string action)
    {
        try
        {
            var appointment = db.Appointments.SingleOrDefault(ap => ap.EmployeeID == employeeId);

            if (appointment != null)
            {
                appointment.ApStatus = action == "Accept" ? 1 :
                                       action == "Decline" ? 0 : 2; // 1 for accepted, 0 for declined, 2 for pending

                db.SubmitChanges();

                // Reload the grid after updating
                LoadRequests();

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

            // Send JavaScript to hide the row
            LinkButton button = e.CommandSource as LinkButton;
            if (button != null)
            {
                string script = "handleAction(this, '" + e.CommandName + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideRow", script, true);
            }
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

                // Reload the grid after updating
                LoadPrescriptions();

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
