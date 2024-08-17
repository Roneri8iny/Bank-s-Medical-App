using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    public List<string> GetMedicalFields()
    {
        try
        {
            // Query to get all Medical Fields (MFNames)
            var medicalFields = db.MedicalFields.Select(mf => mf.MFName).ToList();
            return medicalFields;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //public bool AddAppointementRequest(int SlotID, int EmployeeID)
    //{
    //    try
    //    {
    //        Appointment obj = new Appointment();

    //        obj.SlotID = SlotID;
    //        obj.EmployeeID = EmployeeID;
    //        obj.Diagnosis = "";
    //        //obj.ApStatus = false;


    //        db.Appointments.InsertOnSubmit(obj);
    //        db.SubmitChanges();


    //        return true;

    //    }
    //    catch (Exception ex)
    //    {
            
    //        throw ex;
    //    }

    //}
    public List<string> GetDepartmentsByMedicalField(int medicalFieldID)
    {
        try
        {
            var departments = (from doc in db.Doctors
                               join dept in db.Departments on doc.DepartmentID equals dept.DepartmentID
                               where doc.MFID == medicalFieldID
                               select dept.DepartmentName).Distinct().ToList();

            return departments;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public int GetMedicalFieldID (string selectedMedicalField)
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
    public bool CheckMFType (int MFID)
    {
        try
        {
            string mfType = (from mf in db.MedicalFields
                             where mf.MFID == MFID
                             select mf.MFType).FirstOrDefault();
            if(mfType != "Lab")
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
}