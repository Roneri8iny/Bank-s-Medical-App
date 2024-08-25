using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_DoctorEmployeeHistory : System.Web.UI.Page
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
        int empID = Convert.ToInt32(Session["Employee_ID"]);

        //List<Class_PastAppointments> employeePastAppointments = appointmentsInfo.getPastAppointments(empID);
        List<int> PastAppointmentsIDs = new List<int>();
        appointmentsInfo.getPastAppointments(rpt_pastAppointments, empID, ref PastAppointmentsIDs);
        foreach (var appointmentID in PastAppointmentsIDs)
        {
            appointmentsInfo.getPastLabReports(TestRepeater, appointmentID);
            appointmentsInfo.getPastPrescriptions(PrescriptionRepeater, appointmentID);
        }


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
}