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

    public bool AddAppointementRequest(int SlotID, int EmployeeID)
    {
        try
        {
            Appointment obj = new Appointment();

            obj.SlotID = SlotID;
            obj.EmployeeID = EmployeeID;
            obj.Diagnosis = "";
            //obj.ApStatus = false;


            db.Appointments.InsertOnSubmit(obj);
            db.SubmitChanges();


            return true;

        }
        catch (Exception ex)
        {
            
            throw ex;
        }

    }

}