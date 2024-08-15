using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Fill the home Page
        if (!IsPostBack)
        {
            var account = Session["EmpAccount"] as Employee;
            if (account != null)
            {
                EmpImage.ImageUrl = account.Photo; 
                EmpName.Text = account.EmployeeName;
                EmpID.Text = account.EmployeeID.ToString();
                EmpEmail.Text = account.Email;
            }
            else
            {
                
                Response.Redirect("Login.aspx");
            }
        }


    }
}