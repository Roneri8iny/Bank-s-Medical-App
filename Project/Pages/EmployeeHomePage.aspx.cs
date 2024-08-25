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
            var EmpAccount = Session["EmpAccount"] as Employee;
            if (EmpAccount != null)
            {
                EmpImage.ImageUrl = EmpAccount.Photo;
                EmpName.Text = EmpAccount.EmployeeName;
                EmpID.Text = EmpAccount.EmployeeID.ToString();
                EmpEmail.Text = EmpAccount.Email;
            }
            else
            {
                
                Response.Redirect("Login.aspx");
            }
        }


    }
}