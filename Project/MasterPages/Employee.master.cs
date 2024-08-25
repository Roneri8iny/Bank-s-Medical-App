using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_Employee : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Disable caching to prevent back navigation after sign-out
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
    }
    //Updated the sign out button
    protected void SignOutButton_Click(object sender, EventArgs e)
    {
        Session["EmpAccount"] = null;
        Session.Clear();
        Session.Abandon();

        Response.Redirect("../Pages/LoginPage.aspx");
    }
}
