using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_EmployeeLoginPage : System.Web.UI.Page
{
    Class_Login obj_login = new Class_Login();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try
        {
            //Check for empty fields
            string username = Username.Text.Trim();
            string password = Password.Text.Trim();
            string selectedAccountType = AccountType.SelectedValue;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || selectedAccountType == "---")
            {
                error_div.Visible = true;
                lbl_error.Text = "Please fill in all fields before logging in.";
                ClearFields();
                return; 
            }
            //Check if account exists
            var account = obj_login.CheckUserValidity(username, password, selectedAccountType);
            if(account != null)
            {
                error_div.Visible = false;
                Session["SelectedAccountType"] = selectedAccountType;
                //success_div.Visible = true;
                //lbl_success.Text = "Successfully logged in";

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
                        Response.Redirect("AnalysisDocHomePage.aspx");
                        break;
                    case "Middle Man":
                        Session["MiddleManAccount"] = account;
                        Response.Redirect("middlemanHome.aspx");
                        break;
                    case "Medical Field":
                        Session["MedicalFieldAccount"] = account;
                        Response.Redirect("MedicalHome.aspx");
                        break;
                    case "Finance":
                        Session["FinanceAccount"] = account;
                        Response.Redirect("Finance_Home.aspx");
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
                ClearFields();
                
            }
            ///Forgot Password and Password Hashing and strong password policy????????????????

        }
        catch (Exception)
        {
            
            throw;
        }
    }
    private void ClearFields()
    {
        Username.Text = string.Empty;
        Password.Text = string.Empty;
        AccountType.SelectedIndex = 0;
    }
}