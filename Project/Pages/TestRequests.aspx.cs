using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class ReportEmployee
{
    public int EmployeeID { get; set; }
    public string EmployeeName { get; set; }
    public string Email { get; set; }
    public int ReportID { get; set; }
}
public partial class Pages_TestRequests : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext("Data Source=LAPTOP-NBC2SOFE\\MSSQLSERVER01;Initial Catalog=Bank Medical DB;Integrated Security=True");
    Class_Appointments obj = new Class_Appointments();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewTestRequests();
        }
    }

    public void ViewTestRequests()
    {
        var DoctorAccount = Session["LabDoctorAccount"] as Doctor;
        //int docID = Convert.ToInt32(Session["Doctor_ID"]);
        var listOfSlots = obj.getAppointmentSlots(DoctorAccount.DoctorID);

        List<Appointment> listOfAppointments = new List<Appointment>();

        foreach (var slot in listOfSlots)
        {
            listOfAppointments.AddRange(obj.getAppointment(slot.SlotID));
        }

        List<ReportEmployee> listOfReportEmployees = new List<ReportEmployee>();

        foreach (var appointment in listOfAppointments)
        {
            var employee = obj.getEmployeeInfo(Convert.ToInt32(appointment.EmployeeID));
            if (employee != null)
            {
                int reportID = db.LabReports.Where(lab => lab.AppointmentID == appointment.AppointmentID).Select(lab => lab.ReportID).FirstOrDefault();
                listOfReportEmployees.Add(new ReportEmployee
                {
                    EmployeeID = employee.EmployeeID,
                    EmployeeName = employee.EmployeeName,
                    Email = employee.Email,
                    ReportID = reportID

                });
            }
        }
        TestRequestsRepeater.DataSource = listOfReportEmployees;
        TestRequestsRepeater.DataBind();
    }

    public void TestRequestsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ViewTestDetails")
        {
            // Get the EmployeeID from CommandArgument
            string[] ids = e.CommandArgument.ToString().Split(',');
            int employeeID = Convert.ToInt32(ids[0]);
            int reportID = Convert.ToInt32(ids[1]);
            // Redirect to the AppointmentDetails page with the EmployeeID as a query string parameter
            Session["Employee_ID"] = employeeID;
            Session["ReportID"] = reportID;
            //Response.Redirect("Home Page.aspx");
            string url = "Test Details.aspx";
            Response.Redirect(url);
        }
    }
}