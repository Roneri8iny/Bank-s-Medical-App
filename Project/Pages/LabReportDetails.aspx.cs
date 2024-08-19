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
}