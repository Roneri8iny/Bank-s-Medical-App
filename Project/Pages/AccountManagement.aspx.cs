using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AccountManagement : System.Web.UI.Page
{
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDepartments();
        }
    }

    private void BindDepartments()
    {
        try
        {
            var departments = db.Departments.ToList();
            ddlDepartments.DataSource = departments;
            ddlDepartments.DataTextField = "DepartmentName";
            ddlDepartments.DataValueField = "DepartmentID";
            ddlDepartments.DataBind();
            ddlDepartments.Items.Insert(0, new ListItem("Select Department", "-1"));
        }
        catch (Exception ex)
        {
            // Log the error if needed
            Console.WriteLine("Error binding departments: " + ex.Message);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string username = txtSearchUsername.Text.Trim();
        var doctor = db.Doctors.SingleOrDefault(d => d.Username == username);

        if (doctor != null)
        {
            txtUsername.Text = doctor.Username;
            txtPassword.Text = doctor.DoctorPassword;
            txtDoctorName.Text = doctor.DoctorName;
            txtMobile.Text = doctor.Mobile.ToString();
            txtPrice.Text = doctor.Price.ToString();
            ddlPosition.SelectedValue = doctor.Position.ToString();
            ddlDepartments.SelectedValue = doctor.DepartmentID.ToString();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor not found.');", true);
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
                // Name
                if (string.IsNullOrEmpty(txtDoctorName.Text) ||
                    string.IsNullOrEmpty(txtPrice.Text) ||
                    string.IsNullOrEmpty(txtMobile.Text) ||
                    ddlDepartments.SelectedIndex == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all required fields.');", true);
                    return;
                }

                if (doctor.DoctorName != txtDoctorName.Text)
                    doctor.DoctorName = txtDoctorName.Text;
                // Price
                decimal price;
                if (decimal.TryParse(txtPrice.Text, out price) && doctor.Price != price)
                {
                    doctor.Price = price;
                }
                else if (!decimal.TryParse(txtPrice.Text, out price))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid price.');", true);
                    return;
                }
                // Mobile
                long mobile;
                if (long.TryParse(txtMobile.Text, out mobile) && doctor.Mobile != mobile)
                {
                    doctor.Mobile = mobile;
                }
                else if (!long.TryParse(txtMobile.Text, out mobile))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid mobile number.');", true);
                    return;
                }
                // Position
                if (doctor.Position != ddlPosition.SelectedItem.Text)
                    doctor.Position = ddlPosition.SelectedItem.Text;
                // Department
                if (doctor.DepartmentID != Convert.ToInt32(ddlDepartments.SelectedValue))
                    doctor.DepartmentID = Convert.ToInt32(ddlDepartments.SelectedValue);
                // Password
                if (!string.IsNullOrEmpty(txtPassword.Text))
                {
                    // Update the password (hashing may be necessary here)
                    doctor.DoctorPassword = txtPassword.Text;
                }

                db.SubmitChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor updated successfully.');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while updating the doctor.');", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor not found.');", true);
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

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor deleted successfully.');", true);
                ClearForm();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while deleting the doctor.');", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor not found.');", true);
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
    }
}
