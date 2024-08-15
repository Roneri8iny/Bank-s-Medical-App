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
            var doc = obj_login.CheckUserValidity(Username.Text.Trim(), Password.Text.Trim());
            if(doc != null)
            {
                error_div.Visible = false;
                success_div.Visible = true;
                lbl_success.Text = "Successfully logged in";
                Session["Doctor_ID"] = doc.DoctorID;
                //Response.Redirect("Home Page.aspx");
                string url = "Home Page.aspx";
                Response.Redirect(url);
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