using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_Middleman : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        // Clear the session
        Session.Clear();
        Session.Abandon();

        // Optionally, clear authentication cookie
        System.Web.Security.FormsAuthentication.SignOut();

        // Redirect to the login page
        Response.Redirect("Login.aspx");
    }
}
