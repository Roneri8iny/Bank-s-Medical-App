using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_EmployeeHome : System.Web.UI.Page
{
    Class_Employee employee = new Class_Employee();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateMedicalFields();
            DepartmentsPanel.Visible = false;
            AvailableSlotsPanel.Visible = false;
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
            AvailableLabsPanel.Visible = false;

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
        }
        else
        {
            AvailableSlotsPanel.Visible = false;
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
    protected void AppRequestButton_Click(object sender, EventArgs e)
    {
        try
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Manar();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Success;", true);

            //RequestButton.Enabled = false;
            //requestSuccess_div.Visible = true;  // Shows the success message
            //requestSuccess.Text = "Request Done";
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