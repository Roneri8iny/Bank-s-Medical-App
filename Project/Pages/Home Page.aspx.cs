using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Home_Page : System.Web.UI.Page
{
    DoctorInfo docInfo = new DoctorInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillUserProfile();
        }

    }


    public void FillUserProfile()
    {
        var DoctorAccount = Session["DoctorAccount"] as Doctor;
        int docID = DoctorAccount.DoctorID;
        Doctor doc = docInfo.RetrieveDoctorInfo(docID);
        DoctorName.InnerText = doc.DoctorName;
        DoctorUsername.InnerText = "Username: " + doc.Username;
        DoctorPos.InnerText = "Position: " + doc.Position;
        DoctorMobile.InnerText = "Mobbile Number: " + doc.Mobile;
        int deptID = Convert.ToInt32(doc.DepartmentID);
        string deptName = docInfo.RetrieveDoctorDepartment(deptID);
        DoctorDept.InnerText = "Department: " + deptName;
    }
}