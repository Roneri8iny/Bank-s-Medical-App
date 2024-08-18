using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AccountManagement : System.Web.UI.Page
{
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate dropdowns or other initialization tasks if needed
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string username = txtSearchUsername.Text.Trim();

        var doctor = db.Doctors.SingleOrDefault(d => d.Username == username);

        if (doctor != null)
        {
            // Populate form fields with doctor's data
            txtUsername.Text = doctor.Username;
            txtPassword.Text = doctor.DoctorPassword;
            txtDoctorName.Text = doctor.DoctorName;
            txtMobile.Text = doctor.Mobile.ToString();
            txtPrice.Text = doctor.Price.ToString();
            ddlPosition.SelectedValue = doctor.Position.ToString(); 
            ddlDepartments.SelectedValue = doctor.DepartmentID.ToString();

            pnlAccountForm.Visible = true;
        }
        else
        {
            // Show error message if doctor is not found
            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('Doctor not found.');", true);
            pnlAccountForm.Visible = false;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();

        var doctor = db.Doctors.SingleOrDefault(d => d.Username == username);

        if (doctor != null)
        {
            try
            {
                // Validate input
                if (string.IsNullOrEmpty(txtDoctorName.Text) ||
                    string.IsNullOrEmpty(txtPrice.Text) ||
                    string.IsNullOrEmpty(txtMobile.Text) ||
                    ddlPosition.SelectedIndex == 0 ||
                    ddlDepartments.SelectedIndex == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('Please fill in all required fields.');", true);
                    return;
                }

                // Update doctor details
                doctor.DoctorName = txtDoctorName.Text;

                decimal price;
                if (decimal.TryParse(txtPrice.Text, out price))
                {
                    doctor.Price = price;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('Please enter a valid price.');", true);
                    return;
                }

                long mobile;
                if (long.TryParse(txtMobile.Text, out mobile))
                {
                    doctor.Mobile = mobile;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('Please enter a valid mobile number.');", true);
                    return;
                }

                doctor.Position = ddlPosition.SelectedItem.Text;
                doctor.DepartmentID = Convert.ToInt32(ddlDepartments.SelectedValue);

                db.SubmitChanges();

                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showSuccessMessage('Doctor updated successfully.');", true);
            }
            catch (Exception ex)
            {
                // Log the exception details if needed
                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('An error occurred while updating the doctor.');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('Doctor not found.');", true);
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();

        var doctor = db.Doctors.SingleOrDefault(d => d.Username == username);

        if (doctor != null)
        {
            try
            {
                db.Doctors.DeleteOnSubmit(doctor);
                db.SubmitChanges();

                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showSuccessMessage('Doctor deleted successfully.');", true);

                // Clear form fields after deletion
                ClearForm();
            }
            catch (Exception ex)
            {
                // Log the exception details if needed
                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('An error occurred while deleting the doctor.');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showErrorMessage('Doctor not found.');", true);
        }
    }

    private void ClearForm()
    {
        txtUsername.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtDoctorName.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtPrice.Text = string.Empty;
        ddlPosition.SelectedIndex = 0;
        ddlDepartments.SelectedIndex = 0;
        pnlAccountForm.Visible = false;
    }
}