using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_MedicalFieldLoginPage : System.Web.UI.Page
{
    Class_Login obj_login = new Class_Login(); // Ensure LoginData is properly referenced
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
        // Any initialization code, if needed
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try
        {
            string username = Username.Text.Trim();
            string password = Password.Text.Trim();
            string selectedAccountType = AccountType.SelectedValue;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || selectedAccountType == "---")
            {
                DisplayError("Please fill in all fields before logging in.");
                return;
            }

            // Check user validity
            var account = obj_login.CheckUserValidity(username, password, selectedAccountType);
            if (account != null)
            {
                error_div.Visible = false;

                // Redirect based on account type
                switch (selectedAccountType)
                {
                    case "Employee":
                        Session["EmpAccount"] = account;
                        Response.Redirect("EmployeeHomePage.aspx");
                        break;
                    case "Doctor":
                        Session["DoctorAccount"] = account;
                        Response.Redirect("DoctorHomePage.aspx");
                        break;
                    case "Lab Doctor":
                        Session["LabDoctorAccount"] = account;
                        Response.Redirect("LabDoctorHomePage.aspx");
                        break;
                    case "Middle Man":
                        Session["MiddleManAccount"] = account;
                        Response.Redirect("Home.aspx");
                        break;
                    case "Medical Field":
                        Session["MedicalFieldAccount"] = account;
                        Response.Redirect("MedicalHome.aspx");
                        break;
                    case "Finance":
                        Session["FinanceAccount"] = account;
                        Response.Redirect("FinanceHomePage.aspx");
                        break;
                    default:
                        DisplayError("Unknown account type");
                        break;
                }
            }
            else
            {
                DisplayError("Invalid credentials! Please try again.");
            }
        }
        catch (Exception ex)
        {
            DisplayError("An error occurred. Please try again later.");
            // You can log the exception here if necessary
        }
    }

    protected void DisplayError(string message)
    {
        error_div.Visible = true;
        lbl_error.Text = message;
        Username.Text = "";
        Password.Text = "";
        AccountType.SelectedIndex = 0;
    }
}
