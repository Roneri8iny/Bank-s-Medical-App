using System;
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
            var emp = obj_login.CheckUserValidity(Username.Text.Trim(), Password.Text.Trim());
            if(emp != null)
            {
                error_div.Visible = false;
                success_div.Visible = true;
                lbl_success.Text = "Successfully logged in";

                //Response.Redirect("HomePage.aspx");
            }
            else
            {
                error_div.Visible = true;
                lbl_error.Text = "Wrong Username Or Password ! Please try Again";
            }

        }
        catch (Exception)
        {
            
            throw;
        }
    }
}