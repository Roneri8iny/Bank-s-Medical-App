using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        List<Employee> listOfEmployees = new List<Employee>();

        foreach (var appointment in listOfAppointments)
        {
            var employee = obj.getEmployeeInfo(Convert.ToInt32(appointment.EmployeeID));
            if (employee != null)
            {
                listOfEmployees.Add(employee);
            }
        }
        AppointmentsRepeater.DataSource = listOfEmployees;
        AppointmentsRepeater.DataBind();
    } 

    public void AppointmentsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            // Get the EmployeeID from CommandArgument
            int employeeID = Convert.ToInt32(e.CommandArgument);

            // Redirect to the AppointmentDetails page with the EmployeeID as a query string parameter
            Session["Employee_ID"] = employeeID;
            //Response.Redirect("Home Page.aspx");
            string url = "Appointment Details.aspx";
            Response.Redirect(url);
        }
    }
}