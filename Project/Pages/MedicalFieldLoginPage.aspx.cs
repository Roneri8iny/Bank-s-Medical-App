using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_MedicalFieldLoginPage : System.Web.UI.Page

{
    LoginData obj_login = new LoginData();

    protected void Page_Load(object sender, EventArgs e)
    {

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
                error_div.Visible = true;
                lbl_error.Text = "Please fill in all fields before logging in.";

                Username.Text = "";
                Password.Text = "";
                AccountType.SelectedIndex = 0;
                return;
            }

            DataRow account = (DataRow)obj_login.CheckUserValidity(username, password, selectedAccountType);
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
                        Response.Redirect("MedicalField.aspx");
                        break;
                    case "Medical Field":
                        // Assuming MedicalFieldHomePage.aspx is where you want to go for medical field users
                        Session["MedicalFieldAccount"] = account;
                        Response.Redirect("MedicalHome.aspx");
                        break;
                    case "Finance":
                        Session["FinanceAccount"] = account;
                        Response.Redirect("FinanceHomePage.aspx");
                        break;
                    default:
                        lbl_error.Text = "Unknown account type";
                        error_div.Visible = true;
                        break;
                }
            }
            else
            {
                error_div.Visible = true;
                lbl_error.Text = "Invalid credentials! Please try again.";
                Username.Text = "";
                Password.Text = "";
                AccountType.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            // Log the exception (you can implement logging)
            lbl_error.Text = "An error occurred. Please try again later.";
            error_div.Visible = true;
        }
    }

}