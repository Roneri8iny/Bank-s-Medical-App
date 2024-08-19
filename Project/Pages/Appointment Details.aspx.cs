using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

[Serializable]
public class MedicineInfo
{
    public string MedicineName { get; set; }
    public int MedicineID { get; set; }
    public int Quantity { get; set; }
    public int Frequency { get; set; }
    public string Notes { get; set; }
}

[Serializable]
public class TestInfo
{
    public string TestName { get; set; }
}

public partial class Pages_Appointment_Details : System.Web.UI.Page
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();
    //private List<> prescriptionRows = new List<TableRow>();
    private List<MedicineInfo> medicines;
    private List<TestInfo> tests;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {

            BindMedicines();
            BindTests();

            // Initialize the list of medicines
            medicines = new List<MedicineInfo>();
            ViewState["medicines"] = medicines;
            tests = new List<TestInfo>();
            ViewState["tests"] = tests;
        }
        else
        {
            // On postback, restore the previous list of medicines
            medicines = (List<MedicineInfo>)ViewState["medicines"];
            tests = (List<TestInfo>)ViewState["tests"];
        }
    }

    protected void btnRedirect_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeHistory.aspx");
    }

    private void BindMedicines()
    {
        
        var medicines = db.Medicines.ToList();

        ddlMedicines.DataSource = medicines;
        ddlMedicines.DataTextField = "MedicineName";
        ddlMedicines.DataValueField = "MedicineID";
        ddlMedicines.DataBind();
        
    }

    private void BindTests()
    {
        var tests = db.Tests.ToList();
        
        ddlTests.DataSource = tests;
        ddlTests.DataTextField = "TestName";
        ddlTests.DataValueField = "TestName";
        ddlTests.DataBind();
    }
    //protected void SubmitForm_Click(object sender, EventArgs e)
    //{
    //    string diagnosisText = Request.Form["Diagnosis"];



    //}

    //protected void MedicineEnter_Click(object sender, EventArgs e)
    //{

    //}

    //protected void TestEnter_Click(object sender, EventArgs e)
    //{

    //}

    //protected void SubmitButton_Click(object sender, EventArgs e)
    //{

    //}

    // Medicine Enter Button
    //protected void SubmitButton_Click1(object sender, EventArgs e)
    //{
    //    string medicineName = ddlMedicines.SelectedItem.Text;
    //    int quantity = int.Parse(TextBoxQuantity.Text);
    //    string frequency = TextBoxFrequency.Text;
    //    string notes = PrescriptionNotes.Text;

    //    TableRow newRow = new TableRow();

    //    // Create TableCell objects for each column
    //    TableCell medicineCell = new TableCell { Text = medicineName };
    //    TableCell quantityCell = new TableCell { Text = quantity.ToString() };
    //    TableCell frequencyCell = new TableCell { Text = frequency };
    //    TableCell notesCell = new TableCell { Text = notes };

    //    // Add the TableCell objects to the TableRow
    //    newRow.Cells.Add(medicineCell);
    //    newRow.Cells.Add(quantityCell);
    //    newRow.Cells.Add(frequencyCell);
    //    newRow.Cells.Add(notesCell);

    //    // Add the new TableRow to the PrescriptionTable
    //    PrescriptionTable.Rows.Add(newRow);
    //}

    // Medicine Enter Button
    //protected void SubmitButton_Click(object sender, EventArgs e)
    //{
    //    string medicineName = ddlMedicines.SelectedItem.Text;
    //    int quantity = int.Parse(TextBoxQuantity.Text);
    //    string frequency = TextBoxFrequency.Text;
    //    string notes = PrescriptionNotes.Text;

    //    // Create a new TableRow
    //    TableRow newRow = new TableRow();

    //    // Create TableCell objects for each column
    //    TableCell medicineCell = new TableCell { Text = medicineName };
    //    TableCell quantityCell = new TableCell { Text = quantity.ToString() };
    //    TableCell frequencyCell = new TableCell { Text = frequency };
    //    TableCell notesCell = new TableCell { Text = notes };

    //    // Add the TableCell objects to the TableRow
    //    newRow.Cells.Add(medicineCell);
    //    newRow.Cells.Add(quantityCell);
    //    newRow.Cells.Add(frequencyCell);
    //    newRow.Cells.Add(notesCell);

    //    // Add the new TableRow to the list of rows
    //    prescriptionRows.Add(newRow);

    //    // Add the new TableRow to the PrescriptionTable
    //    PrescriptionTable.Rows.Add(newRow);
    //}
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Get the values from the form fields
        
        string medicineName = ddlMedicines.SelectedItem.Text;
        int medicineId = int.Parse(ddlMedicines.SelectedValue);
        int quantity = int.Parse(TextBoxQuantity.Text);
        int frequency = int.Parse(TextBoxFrequency.Text);
        string notes = PrescriptionNotes.Text;

        // Create a new Medicine object
        MedicineInfo medicine = new MedicineInfo
        {
            MedicineName = medicineName,
            MedicineID = medicineId,
            Quantity = quantity,
            Frequency = frequency,
            Notes = notes
        };

        // Add the new Medicine object to the list
        if (medicines == null)
        {
            medicines = new List<MedicineInfo>();
        }
        medicines.Add(medicine);

        // Bind the list to the Repeater
        MedicinesRepeater.DataSource = medicines;
        MedicinesRepeater.DataBind();

        // Store the list in ViewState
        ViewState["medicines"] = medicines;
    }

    // Test Enter Button
    protected void Button4_Click(object sender, EventArgs e)
    {
        string testName = ddlTests.SelectedItem.Text;


        TestInfo test = new TestInfo
        {
            TestName = testName
        };

        // Add the new Medicine object to the list
        if (tests == null)
        {
            tests = new List<TestInfo>();
        }
        tests.Add(test);

        // Bind the list to the Repeater
        TestsRepeater.DataSource = tests;
        TestsRepeater.DataBind();

        // Store the list in ViewState
        ViewState["tests"] = tests;
    }

    protected void FinishButton_Click(object sender, EventArgs e)
    {
        string diagnosisText = Request.Form["Diagnosis"];

        DateTime startDate = DateTime.Parse(TextBoxStart.Text);
        DateTime endDate = DateTime.Parse(TextBoxEnd.Text);


    }

    public void insertPrescription()
    {
        int lastPrescriptionID = db.Prescriptions.Max(t => t.PrescriptionID);
        int appointmentID = Convert.ToInt32(Session["Appointment_ID"]);

        //Prescription newPrescription = new 
        Prescription newPrescription = new Prescription
        {
            PrescriptionID = lastPrescriptionID++,
            AppointmentID = appointmentID,
            //PayStatus = 
        };

        // Add the new instance to the database
        //db.TestTables.InsertOnSubmit(test);

        // Save the changes to the database
        //db.SubmitChanges();
    }

//    List<MyObject> myList = (List<MyObject>)ViewState["MyList"];

//using (MyDataContext db = new MyDataContext())
//{
//    foreach (MyObject item in myList)
//    {
//        // Create a new instance of the entity class
//        MyTable myTable = new MyTable
//        {
//            Column1 = item.Property1,
//            Column2 = item.Property2,
//            // ...
//        };

//        // Add the new instance to the database
//        db.MyTables.InsertOnSubmit(myTable);
//    }

//    // Save the changes to the database
//    db.SubmitChanges();
}