using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public class AppointmentEmployee
{
    public int EmployeeID { get; set; }
    public string EmployeeName { get; set; }
    public string Email { get; set; }
    public int AppointmentID { get; set; }
}

public partial class Pages_Appointments : System.Web.UI.Page
{
    Class_Appointments obj = new Class_Appointments();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewAppointments();
        }
    }

    public void ViewAppointments()
    {
        var DoctorAccount = Session["DoctorAccount"] as Doctor;
        //int docID = Convert.ToInt32(Session["Doctor_ID"]);
        var listOfSlots = obj.getAppointmentSlots(DoctorAccount.DoctorID);

        List<Appointment> listOfAppointments = new List<Appointment>();

        foreach (var slot in listOfSlots)
        {
            listOfAppointments.AddRange(obj.getAppointment(slot.SlotID));
        }

        List<AppointmentEmployee> listOfAppointmentEmployees = new List<AppointmentEmployee>();

        foreach (var appointment in listOfAppointments)
        {
            var employee = obj.getEmployeeInfo(Convert.ToInt32(appointment.EmployeeID));
            if (employee != null)
            {
                listOfAppointmentEmployees.Add(new AppointmentEmployee
                {
                    EmployeeID = employee.EmployeeID,
                    EmployeeName = employee.EmployeeName,
                    Email = employee.Email,
                    AppointmentID = appointment.AppointmentID
                });
            }
        }

        AppointmentsRepeater.DataSource = listOfAppointmentEmployees;
        AppointmentsRepeater.DataBind();
    }

    public void AppointmentsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            // Get the EmployeeID from CommandArgument
            //int employeeID = Convert.ToInt32(e.CommandArgument);
            string[] ids = e.CommandArgument.ToString().Split(',');
            int employeeID = Convert.ToInt32(ids[0]);
            int appointmentID = Convert.ToInt32(ids[1]);

            // Redirect to the AppointmentDetails page with the EmployeeID as a query string parameter
            Session["Employee_ID"] = employeeID;
            Session["Appointment_ID"] = appointmentID;
            //Response.Redirect("Home Page.aspx");
            string url = "Appointment Details.aspx";
            Response.Redirect(url);
        }
    }
}