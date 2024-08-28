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
        int MFID = Convert.ToInt32(selectedField);

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
            employee.GetLabs(MFID, LabHotline, LabAddress, LabEmail);
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

    public void AppSaveButton_Click(object sender, EventArgs e)
    {
        try
        {
            var EmpAccount = Session["EmpAccount"] as Employee;
            if (EmpAccount != null)
            {
                Button button = (Button)sender;

                cal_1.Visible = false;
                if (string.IsNullOrEmpty(cal_1.Text))

                {
                    lbl_error.Text = "Please pick a date";
                    error_div.Visible = true;
                    success_div.Visible = false;

                }
                else
                {

                    string selectedField = MedicalFields.SelectedValue;
                    int MFID = Convert.ToInt32(selectedField);
                    bool check = employee.CheckMFType(MFID);
                    DateTime pickedDate = DateTime.Parse(cal_1.Text);
                    string appDay = ViewState["AppointmentDay"].ToString();
                    int slotId = Convert.ToInt32(ViewState["SlotID"]);

                    if (pickedDate < DateTime.Today)
                    {
                        lbl_error.Text = "Please select a date that is today or later";
                        error_div.Visible = true;
                        success_div.Visible = false;
                    }
                    else if (pickedDate.DayOfWeek.ToString() != appDay && check)
                    {
                        lbl_error.Text = "Please select a date on the same day as the doctor day ";
                        error_div.Visible = true;
                        success_div.Visible = false;
                    }
                    else if (pickedDate.DayOfWeek.ToString() == appDay && check)
                    {
                        appointment.fun_AddAppointement(pickedDate, EmpAccount.EmployeeID, slotId, false);
                        lbl_success.Text = "Appointment Requested Successfully";
                        error_div.Visible = false;
                        success_div.Visible = true;
                        cal_1.Text = "";
                    }
                    else if (!check)
                    {
                        appointment.fun_AddAppointement(pickedDate, EmpAccount.EmployeeID, slotId, true, selectedField);
                        lbl_success.Text = "Appointment Requested Successfully";
                        error_div.Visible = false;
                        success_div.Visible = true;
                        button.Visible = false;
                    }
                }
                btnSave.Visible = false;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "preventModalClose", "$('#exampleModal').modal('show');", true);


            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

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
        string selectedField = MedicalFields.SelectedValue;
        int MFID = Convert.ToInt32(selectedField);
        bool check = employee.CheckMFType(MFID);


        int SlotID = Convert.ToInt32(e.CommandArgument);
        ViewState["SlotID"] = SlotID;


        LinkButton requestButton = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)requestButton.NamingContainer;

        Label DoctorNameLabel = (Label)item.FindControl("DoctorName");
        Label AppointmentDayLabel = (Label)item.FindControl("Day");

        ViewState["DoctorName"] = DoctorNameLabel.Text;
        if (check)
        {
            ViewState["AppointmentDay"] = AppointmentDayLabel.Text;
        }



        cal_1.Visible = true;
        cal_1.Text = "";
        lbl_error.Text = "";
        error_div.Visible = false;
        success_div.Visible = false;
        btnSave.Visible = true;

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Script", "OpenModal();", true);
    }
}