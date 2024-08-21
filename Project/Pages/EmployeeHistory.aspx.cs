using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


public partial class Pages_EmployeeHistory : System.Web.UI.Page
{
    Class_Appointments appointmentsInfo = new Class_Appointments();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewEmployeeHistory();
        }
    }

    public void ViewEmployeeHistory()
    {
        var EmpAccount = Session["EmpAccount"] as Employee;

        int empID = EmpAccount.EmployeeID;

        List<int> PastAppointmentsIDs = new List<int>();
        appointmentsInfo.getPastAppointmentsforEmp(rpt_pastAppointments, empID, ref PastAppointmentsIDs);

        appointmentsInfo.getPastLabReportsforEmp(TestRepeater, empID);
        appointmentsInfo.getPastPrescriptionsByEmp(PrescriptionRepeater, empID);

    }

    public void TestRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            // Get the ReportID from the CommandArgument
            int reportId = Convert.ToInt32(e.CommandArgument);
            Session["ReportID"] = reportId;
            // Redirect to the details page, passing the ReportID as a query string parameter
            string url = "LabReportDetails.aspx";
            Response.Redirect(url);

        }
    }

    public void PrescriptionRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            // Get the ReportID from the CommandArgument
            int prescriptioID = Convert.ToInt32(e.CommandArgument);
            Session["PrescriptionID"] = prescriptioID;
            // Redirect to the details page, passing the ReportID as a query string parameter
            string url = "PrescriptionDetails.aspx";
            Response.Redirect(url);

        }
    }
    public void Cancel_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        Label lbl_success = (Label)item.FindControl("lbl_success");
        HtmlGenericControl success_div = (HtmlGenericControl)item.FindControl("success_div");
        Label lbl_status = (Label)item.FindControl("lbl_status");
        lbl_success.Text = "Appointment Cancelled";
        success_div.Visible = true;

        int appointmentID;
        if (int.TryParse(btn.CommandArgument, out appointmentID))
        {
            appointmentsInfo.CancelAppointment(appointmentID);
            lbl_status.Text = "Appointment Status: Cancelled";

        }
        btn.Visible = false; 
    }


}