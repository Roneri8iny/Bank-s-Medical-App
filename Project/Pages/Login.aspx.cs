﻿using System;
using System.Collections.Generic;
using System.Linq;
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

            var account = obj_login.CheckUserValidity(Username.Text.Trim(), Password.Text.Trim() , selectedAccountType);
            if(account != null)
            {
                error_div.Visible = false;
                //success_div.Visible = true;
                //lbl_success.Text = "Successfully logged in";

                switch (selectedAccountType)
                {
                    case "Employee":
                        Session["EmpAccount"] = account;
                        Response.Redirect("EmployeeHomePage.aspx");
                        break;
                    case "Doctor":
                        Response.Redirect("DoctorHomePage.aspx");
                        break;
                    case "Lab Doctor":
                        Response.Redirect("LabDoctorHomePage.aspx");
                        break;
                    case "Middle Man":
                        Response.Redirect("MiddleManHomePage.aspx");
                        break;
                    case "Medical Field":
                        Response.Redirect("MedicalFieldHomePage.aspx");
                        break;
                    case "Finance":
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

            ///Forgot Password ????????????????

        }
        catch (Exception)
        {
            
            throw;
        }
    }
}