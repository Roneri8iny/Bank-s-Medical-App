using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_PrescriptionDetails : System.Web.UI.Page
{
    Class_Prescriptions prescriptionInfo = new Class_Prescriptions();

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewPrescriptionDetails();
    }

    public void ViewPrescriptionDetails()
    {
        int prescriptionID = Convert.ToInt32(Session["PrescriptionID"]);
        prescriptionInfo.getPrescriptionData(PrescriptionDetailsRepeater, prescriptionID);

    }

    


    //    public void TestRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    if (e.CommandName == "ViewDetails")
    //    {
    //        // Get the ReportID from the CommandArgument
    //        int reportId = Convert.ToInt32(e.CommandArgument);
    //        Session["ReportID"] = reportId;
    //        // Redirect to the details page, passing the ReportID as a query string parameter
    //        string url = "LabReportDetails.aspx";
    //        Response.Redirect(url);

    //    }
    //}
}