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

    }
    //Updated the sign out button
    protected void SignOutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();

        Response.Redirect("../Pages/Login.aspx");
    }
}
