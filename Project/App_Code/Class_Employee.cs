using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Class_Employee
/// </summary>
public class Class_Employee
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();
    public Class_Employee()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void FillMedicalFields(DropDownList ddl)
    {
        try
        {
            // Query to get all Medical Fields (MFNames)
            var MedicalFieldQuery = (from tbl in db.MedicalFields
                                     where tbl.MFType != "Pharmacy"
                                     select tbl).Distinct().ToList();


            ddl.Items.Add(new ListItem("Select Medical Field", "0"));

            foreach (var item in MedicalFieldQuery)
            {
                ddl.Items.Add(new ListItem(item.MFName, item.MFID.ToString()));

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void FillDepartmentsByMedicalField(DropDownList ddl, int medicalFieldID)
    {
        try
        {
            var departments = (from doc in db.Doctors
                               where doc.MFID == medicalFieldID
                               select doc).Distinct().ToList();


            ddl.Items.Add(new ListItem("Select Departement", "0"));

            foreach (var item in departments)
            {
                ddl.Items.Add(new ListItem(item.Department.DepartmentName, item.DepartmentID.ToString()));

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetLabs(int medicalFieldID, Label hotline, Label address, Label email)
    {
        try
        {

            // Query to retrieve lab details based on the medical field ID
            var lab = (from mf in db.MedicalFields
                       where mf.MFID == medicalFieldID && mf.MFType == "Lab"
                       select mf).FirstOrDefault();
            // Populate the controls with the lab data
            hotline.Text = "Hotline: " + lab.Hotline;
            address.Text = "Address: " + lab.MFAddress;
            email.Text = "Email: " + lab.Email;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public int GetMedicalFieldID(string selectedMedicalField)
    {
        try
        {
            int mfID = (from mf in db.MedicalFields
                        where mf.MFName == selectedMedicalField
                        select mf.MFID).FirstOrDefault();
            return mfID;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public bool CheckMFType(int MFID)
    {
        try
        {
            string mfType = (from mf in db.MedicalFields
                             where mf.MFID == MFID
                             select mf.MFType).FirstOrDefault();
            if (mfType != "Lab")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public int GetDepartmentID(string selectedDepartment)
    {
        try
        {
            int DID = (from department in db.Departments
                       where department.DepartmentName == selectedDepartment
                       select department.DepartmentID).FirstOrDefault();
            return DID;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void GetDoctorsByDepartment(Repeater rpt, int departmentID, int MedicalField)
    {

        try
        {
            var doctors = (from slot in db.Timetables
                           where slot.Doctor.DepartmentID == departmentID
                           && slot.Doctor.MFID == MedicalField
                           select new
                           {
                               slot.SlotID,
                               AppointmentDay = slot.TTDay,
                               StartTime = slot.StartTime,
                               Endtime = slot.EndTime,
                               DoctorName = slot.Doctor.DoctorName,
                               DoctorPrice = slot.Doctor.Price
                          
                           }).ToList();
            rpt.DataSource = doctors;
            rpt.DataBind();


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetLabReportsbyAppointment(Repeater rpt, int EmployeeID)
    {

        try
        {
            var LabReports = (from app in db.Appointments
                              where app.EmployeeID == EmployeeID
                              select new
                              {
                                  DoctorName = app.Timetable.Doctor.DoctorName,
                                  //Date has time in it
                                  AppointmentDay = app.AppointmentDate,
                                  Diagnosis = app.Diagnosis,
                                  LabReportDetails = string.Join(", ", db.LabReports
                                    .Where(lab => lab.AppointmentID == app.AppointmentID)
                                    .SelectMany(lab => lab.LabReportsDetails)
                                    .Select(detail => detail.Test.TestName))
                              }).ToList();
            rpt.DataSource = LabReports;
            rpt.DataBind();


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetMonthlyPrescriptions(Repeater rpt, int EmployeeID)
    {
        try
        {
            var monPres = (from app in db.Appointments
                           where app.EmployeeID == EmployeeID
                           && app.ApStatus == (int)Class_Appointments.ApplicationStatuses.DONE
                           select new
                           {
                               ApDepartment = app.Timetable.Doctor.Department.DepartmentName,
                               ApDate = app.AppointmentDate,
                               DoctorName = app.Timetable.Doctor.DoctorName,
                               LastRenewalDate = db.Prescriptions
                                   .Where(pre => pre.AppointmentID == app.AppointmentID)
                                   .Select(pre => pre.SupplyDate)
                                   .FirstOrDefault(),
                               PreID = db.Prescriptions
                                      .Where(pre => pre.AppointmentID == app.AppointmentID && pre.Monthly == true)
                                      .Select(pre => (int?)pre.PrescriptionID)
                                      .FirstOrDefault(),
                               Medicines = db.PrescriptionsDetails
                                   .Where(pd => pd.Prescription.AppointmentID == app.AppointmentID && pd.Prescription.Monthly == true)
                                   .Select(pd => new
                                   {
                                       Medicine = pd.Medicine.MedicineName,
                                       Frequency = pd.Frequency,
                                       Quantity = pd.Quantity,
                                       Notes = pd.Notes
                                   }).ToList()
                           }).ToList();

            rpt.DataSource = monPres;
            rpt.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DateTime GetLastRenewalPrescriptionDate(int PrescriptionID)
    {
        try
        {
            DateTime? preDate = db.Prescriptions.Where(pre => pre.PrescriptionID == PrescriptionID).FirstOrDefault().SupplyDate;

            return (DateTime)preDate;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void UpdateRenewalStatus(int PrescriptionID)
    {
        try
        {
            var prescription = db.Prescriptions.Where(pre => pre.PrescriptionID == PrescriptionID).FirstOrDefault();
            prescription.RenewalStatus = 1;
            db.SubmitChanges();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}