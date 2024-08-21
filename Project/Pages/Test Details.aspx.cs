using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


[Serializable]
public class TestDetail
{
    public int TestID { get; set; }
    public string TestResultPDF { get; set; }
}

public partial class Pages_Test_Details : System.Web.UI.Page
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();
    private List<TestDetail> testDetails;
    Class_LabTests obj = new Class_LabTests();
    Class_Appointments app = new Class_Appointments();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int employeeId = Convert.ToInt32(Session["Employee_ID"]);
            Employee emp = app.getEmployeeInfo(employeeId);
            string imageUrl = string.Format("~/assets/images/samples/{0}", emp.Photo);
            employeeImage.Src = imageUrl;
            employeeNameLabel.InnerText = emp.EmployeeName;
            int reportID = Convert.ToInt32(Session["ReportID"]);
            obj.getReportDetails(ResultsUploadRepeater, reportID);
            // Initialize the list of medicines
            testDetails = new List<TestDetail>();
            ViewState["testDetails"] = testDetails;
            
        }
        else
        {
            // On postback, restore the previous list of medicines
            testDetails = (List<TestDetail>)ViewState["testDetails"];
        }
    }

    public void viewTestDetails()
    {

    }

    public void updateTestDetails(string filename)
    {
        int reportID = Convert.ToInt32(Session["ReportID"]);

        var rowToUpdate = db.LabReportsDetails.FirstOrDefault(r => r.ReportID == reportID);

        if (rowToUpdate != null)
        {
            rowToUpdate.ResultPDF = filename;
            //db.Appointments.Attach(rowToUpdate);
            db.SubmitChanges();
        }
    }
    protected void ResultsUploadRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "UploadFile")
        {
            FileUpload fileUpload = (FileUpload)e.Item.FindControl("FileUpload");
            if (fileUpload.HasFile)
            {
                // Save the file to the pdfs folder
                string fileName = fileUpload.FileName;
                //string fileExtension = Path.GetExtension(fileName);
                string filePath = Server.MapPath("../assets/pdfs/") + fileName;
                fileUpload.SaveAs(filePath);

                updateTestDetails(fileName);
                //Session["ReportID"] = reportID;
                // Update the database with the file name and extension using LINQ
                //var rowToUpdate = db.LabReportsDetails.FirstOrDefault(r => r.AppointmentID == appointmentID);

                //TestResult testResult = new TestResult
                //{
                //    TestName = (e.Item.FindControl("TestNameLabel") as Label).Text,
                //    FileName = fileName,
                //    FileExtension = fileExtension
                //};

                //int appointmentID = Convert.ToInt32(Session["Appointment_ID"]);

                //var rowToUpdate = db.Appointments.FirstOrDefault(r => r.AppointmentID == appointmentID);

                //if (rowToUpdate != null)
                //{
                //    rowToUpdate.Diagnosis = diagnosis;
                //    rowToUpdate.SLDStart = startDate;
                //    rowToUpdate.SLDEndd = endDate;
                //    rowToUpdate.ApStatus = (int)Class_Appointments.ApplicationStatuses.DONE;
                //    //db.Appointments.Attach(rowToUpdate);
                //    db.SubmitChanges();
                //}

                //dbContext.TestResults.Add(testResult);
                //dbContext.SaveChanges();
                
            }
        }
    }
}