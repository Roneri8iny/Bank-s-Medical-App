﻿using System;
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

    public List<string> GetDepartmentsByMedicalField(int medicalFieldID)
    {
        try
        {
            var departments = (from doc in db.Doctors
                               where doc.MFID == medicalFieldID
                               select doc.Department.DepartmentName).Distinct().ToList();

            return departments;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetLabs(int medicalFieldID , Label hotline , Label address , Label email)
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

    public void GetDoctorsByDepartment(Repeater rpt,int departmentID)
    {

        try
        {
            var doctors = (from doc in db.Doctors
                           where doc.DepartmentID == departmentID
                           select new 
                           {
                               DoctorName = doc.DoctorName,
                               DoctorPrice = doc.Price,
                               AppointmentDay = doc.Timetables.Select(t => t.TTDay).FirstOrDefault(),
                               StartTime = doc.Timetables.Select(t => t.StartTime).FirstOrDefault(),
                               Endtime = doc.Timetables.Select(t => t.EndTime).FirstOrDefault()
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
                                  select new{
                                      DoctorName = app.Timetable.Doctor.DoctorName,
                                      //Date has time in it
                                      AppointmentDay = app.AppointmentDtae,
                                      Diagnosis = app.Diagnosis
                                      //Add tests
                                  }).ToList();
            rpt.DataSource = LabReports;
            rpt.DataBind();


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}