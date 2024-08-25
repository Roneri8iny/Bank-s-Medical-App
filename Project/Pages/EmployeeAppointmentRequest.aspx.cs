using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


public partial class Pages_EmployeeHome : System.Web.UI.Page
{
    Class_Employee employee = new Class_Employee();
    Class_Appointments appointment = new Class_Appointments();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateMedicalFields();
            DepartmentsPanel.Visible = false;
            AvailableSlotsPanel.Visible = false;
            AvailableLabsPanel.Visible = false;

        }

        var EmpAccount = Session["EmpAccount"] as Employee;
        if (EmpAccount == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    public void PopulateMedicalFields()
    {
        try
        {
            // Get the list of medical fields from the Class_Employee method
            List<string> medicalFields = employee.GetMedicalFields();

            MedicalFields.DataSource = medicalFields;
            MedicalFields.DataBind();

            // Default Item
            MedicalFields.Items.Insert(0, new ListItem(" Select a Medical Field ", "0"));
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void MedicalFields_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the selected Medical Field ID (Hospital)
        string selectedField = MedicalFields.SelectedValue;
        int MFID = employee.GetMedicalFieldID(selectedField);

        bool check = employee.CheckMFType(MFID);
        // Ensure it's not the default "Select" option
        if (selectedField != "0" && check)
        {
            PopulateDepartmentsByMedicalField(MFID);
            DepartmentsPanel.Visible = true; // Show the departments panel
            AvailableSlotsPanel.Visible = false;
            AvailableLabsPanel.Visible = false;
            RequestedLabReportsPanel.Visible = false;

        }
        else if (selectedField != "0" && !check)
        {
            employee.GetLabs(MFID , LabHotline , LabAddress , LabEmail);
            AvailableLabsPanel.Visible = true;
            DepartmentsPanel.Visible = false;
            AvailableSlotsPanel.Visible = false;


        }
        else
        {
            DepartmentsPanel.Visible = false; 
            AvailableSlotsPanel.Visible = false;
            AvailableLabsPanel.Visible = false;
            RequestedLabReportsPanel.Visible = false;

        }
    }
    public void PopulateDepartmentsByMedicalField(int medicalFieldID)
    {
        try
        {
            // Get the list of departments from the Class_Employee method
            List<string> departments = employee.GetDepartmentsByMedicalField(medicalFieldID);

            Departments.DataSource = departments;
            Departments.DataBind();

            // Default Item
            Departments.Items.Insert(0, new ListItem(" Select a Department ", "0"));
        }
        catch (Exception ex)
        {
            // Handle exceptions
            throw ex;
        }
    }
    public void Departments_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDepartment = Departments.SelectedValue;

        if (selectedDepartment != "0")
        {
            int departmentID = employee.GetDepartmentID(selectedDepartment);

            // Populate available slots and doctor information
            PopulateDoctorDetails(departmentID);

            AvailableSlotsPanel.Visible = true;
            AvailableLabsPanel.Visible = false;
        }
        else
        {
            AvailableSlotsPanel.Visible = false;
            AvailableLabsPanel.Visible = false;

        }
    }

    public void PopulateDoctorDetails(int departmentID)
    {
        try
        {
            employee.GetDoctorsByDepartment(SlotsRpt, departmentID);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    
    public void AppRequestButton_Click(object sender, EventArgs e)
    {
        try
        {
            var EmpAccount = Session["EmpAccount"] as Employee;
            if (EmpAccount != null)
            {
                Button button = (Button)sender;
                RepeaterItem item = (RepeaterItem)button.NamingContainer;

                Label lbl_error = (Label)item.FindControl("lbl_error");
                HtmlGenericControl error_div = (HtmlGenericControl)item.FindControl("error_div");
                Label lbl_success = (Label)item.FindControl("lbl_success");
                HtmlGenericControl success_div = (HtmlGenericControl)item.FindControl("success_div");


                string doctorName = ((Label)item.FindControl("DoctorName")).Text;
                string appDay = appointment.GetAppointmentDay(doctorName);
                int slotId = appointment.GetAppointmentSlotID(doctorName);

                TextBox calendarTextBox = (TextBox)item.FindControl("Calender");
                if (calendarTextBox == null || string.IsNullOrEmpty(calendarTextBox.Text))
                {
                    lbl_error.Text = "Please select a date";
                    success_div.Visible = false;
                    error_div.Visible = true;
                    return;
                }

                string calendarText = calendarTextBox.Text;
                DateTime selectedDate;
                if (!DateTime.TryParse(calendarText, out selectedDate))
                {
                    //ShowErrorMessage(item, "Invalid date format");
                    return;
                }

                DayOfWeek selectedDay = selectedDate.DayOfWeek;

                string selectedField = MedicalFields.SelectedValue;
                int MFID = employee.GetMedicalFieldID(selectedField);
                bool check = employee.CheckMFType(MFID);

                if (selectedDay.ToString() == appDay && check)
                {
                    appointment.fun_AddAppointement(selectedDate, EmpAccount.EmployeeID, slotId, false);
                    lbl_success.Text = "Appointment Requested Successfully";
                    error_div.Visible = false;
                    success_div.Visible = true;
                    button.Visible = false;
                }
                else if (!check)
                {
                    appointment.fun_AddAppointement(selectedDate, EmpAccount.EmployeeID, slotId, true, selectedField);
                    lbl_success.Text = "Appointment Requested Successfully";
                    error_div.Visible = false;
                    success_div.Visible = true;
                    button.Visible = false;
                }
                else
                {
                    lbl_error.Text = "Please select a date on the same day as the available day";
                    success_div.Visible = false;
                    error_div.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void ViewButton_Click(object sender, EventArgs e)
    {
        PopulateLabReports();
        RequestedLabReportsPanel.Visible = true;
    }

    public void PopulateLabReports()
    {
        try
        {
            var EmpAccount = Session["EmpAccount"] as Employee;
            int empID = EmpAccount.EmployeeID;
            employee.GetLabReportsbyAppointment(LabReportsRpt, empID);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}