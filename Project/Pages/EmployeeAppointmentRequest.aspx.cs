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
           employee.FillMedicalFields(MedicalFields);
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
            employee.FillDepartmentsByMedicalField(Departments, Convert.ToInt32(selectedField));
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
    public void Departments_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDepartment = Departments.SelectedValue;

        if (selectedDepartment != "0")
        {
            //int departmentID = employee.GetDepartmentID(selectedDepartment);

            // Populate available slots and doctor information
            PopulateDoctorDetails(Convert.ToInt32(selectedDepartment));

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
            employee.GetDoctorsByDepartment(SlotsRpt, departmentID, Convert.ToInt32(MedicalFields.SelectedValue));
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
            if(EmpAccount != null)
            {

            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
        //try
        //{
        //    var EmpAccount = Session["EmpAccount"] as Employee;
        //    if (EmpAccount != null)
        //    {
        //        Button button = (Button)sender;
        //        RepeaterItem item = SlotsRpt.Items.Cast<RepeaterItem>().FirstOrDefault(i => i.FindControl("btnSave") == button);
        //        if (item == null)
        //        {
        //            // Handle the case where item is null
        //            return;
        //        }
        //        Label lbl_error = (Label)Page.FindControl("lbl_error");
        //        HtmlGenericControl error_div = (HtmlGenericControl)Page.FindControl("error_div");
        //        Label lbl_success = (Label)Page.FindControl("lbl_success");
        //        HtmlGenericControl success_div = (HtmlGenericControl)Page.FindControl("success_div");


        //        string doctorName = ((Label)item.FindControl("DoctorName")).Text;
        //        string appDay = appointment.GetAppointmentDay(doctorName);
        //        int slotId = (int)ViewState["SlotID"];

        //        Calendar calendarControl = (Calendar)item.FindControl("Calendar1");
        //        if (calendarControl == null || calendarControl.SelectedDate == DateTime.MinValue)
        //        {
        //            lbl_error.Text = "Please select a date";
        //            success_div.Visible = false;
        //            error_div.Visible = true;
        //            return;
        //        }

        //        DateTime selectedDate = calendarControl.SelectedDate;
        //        DayOfWeek selectedDay = selectedDate.DayOfWeek;

        //        string selectedField = MedicalFields.SelectedValue;
        //        int MFID = employee.GetMedicalFieldID(selectedField);
        //        bool check = employee.CheckMFType(MFID);

        //        if (selectedDay.ToString() == appDay && check)
        //        {
        //            appointment.fun_AddAppointement(selectedDate, EmpAccount.EmployeeID, slotId, false);
        //            lbl_success.Text = "Appointment Requested Successfully";
        //            error_div.Visible = false;
        //            success_div.Visible = true;
        //            button.Visible = false;
        //        }
        //        else if (!check)
        //        {
        //            appointment.fun_AddAppointement(selectedDate, EmpAccount.EmployeeID, slotId, true, selectedField);
        //            lbl_success.Text = "Appointment Requested Successfully";
        //            error_div.Visible = false;
        //            success_div.Visible = true;
        //            button.Visible = false;
        //        }
        //        else
        //        {
        //            lbl_error.Text = "Please select a date on the same day as the available day";
        //            success_div.Visible = false;
        //            error_div.Visible = true;
        //        }
        //    }
        //}
        //catch (Exception ex)
        //{
        //    throw ex;
        //}
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
    protected void btn_RequestSlot_Command(object sender, CommandEventArgs e)
    {
        int SlotID = Convert.ToInt32(e.CommandArgument);
        ViewState["SlotID"] = SlotID;
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Script", "OpenModal();", true);
    }
}