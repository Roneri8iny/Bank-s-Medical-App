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
        }
        else
        {
            DepartmentsPanel.Visible = false; // Hide departments panel if default option is selected
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
}