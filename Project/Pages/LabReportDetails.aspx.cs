using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LabReportDetails : System.Web.UI.Page
{
    Class_LabTests labTestInfo = new Class_LabTests();

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewLabReportDetails();
    }

    public void ViewLabReportDetails()
    {
        int reportID = Convert.ToInt32(Session["ReportID"]);
        labTestInfo.getReportData(TestDetailsRepeater, reportID);

    }
    public void Page_PreInit(object sender, EventArgs e)
    {
        string accountType = (string)Session["SelectedAccountType"];// get the account type from session or database

        if (accountType == "Doctor")
        {
            MasterPageFile = "~/MasterPages/DoctorMaster.master";
        }
        else if (accountType == "Employee")
        {
            MasterPageFile = "~/MasterPages/Employee.master";
        }
    }
}