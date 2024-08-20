using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Class_Appointments
/// </summary>
public class Class_Appointments
{

    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();
    DoctorInfo docInfo = new DoctorInfo();
    public enum ApplicationStatuses
    {

        PENDING = 1,
        DONE = 2,
        CANCELED = 3

    };

    public Class_Appointments()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Timetable> getAppointmentSlots(int docID)
    {

        try
        {
            var query = (from slots in db.Timetables
                         where
                         slots.DoctorID == docID
                         select slots).ToList();



            if (query != null)
            {
                return query;

            }
            else
            {
                return null;

            }


        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public List<Appointment> getAppointment(int slotID)
    {

        try
        {
            var query = (from appointments in db.Appointments
                         where
                         appointments.SlotID == slotID
                         select appointments).ToList();



            if (query != null)
            {
                return query;

            }
            else
            {
                return null;

            }


        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public Employee getEmployeeInfo(int empID)
    {
        try
        {
            var query = (from emp in db.Employees
                         where
                         emp.EmployeeID == empID
                         select emp).FirstOrDefault();



            if (query != null)
            {
                return query;

            }
            else
            {
                return null;

            }


        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    

    //public List<Class_PastAppointments> getPastAppointments(int empID)
    public void getPastAppointments(Repeater rpt, int empID, ref List<int> PastAppointmentsIDs)
    {

        try
        {
            //var query = (from pastAppointments in db.Appointments
            //             join slot in db.Timetables on pastAppointments.SlotID equals slot.SlotID
            //             join doc in db.Doctors on slot.DoctorID equals doc.DoctorID
            //             join dept in db.Departments on doc.DepartmentID equals dept.DepartmentID
            //             where pastAppointments.EmployeeID == empID
            //             select new Class_PastAppointments
            //             {
            //                 AppointmentID = pastAppointments.AppointmentID,
            //                 SlotID = Convert.ToInt32(pastAppointments.SlotID),
            //                 DoctorName = doc.DoctorName,
            //                 DepartmentName = dept.DepartmentName,
            //                 ApStatus = pastAppointments.ApStatus,
            //                 Diagnosis = pastAppointments.Diagnosis,
            //                 SLDStart = Convert.ToDateTime(pastAppointments.SLDStart),
            //                 SLDEndd = Convert.ToDateTime(pastAppointments.SLDEndd)
            //             }).ToList();

            var query = (from x in db.Appointments
                         where x.EmployeeID == empID
                         select new
                         {
                             AppointmentID = x.AppointmentID,
                             //SlotID = x.SlotID.Value,
                             DoctorName = x.Timetable.Doctor.DoctorName,
                             DepartmentName = x.Timetable.Doctor.Department.DepartmentName,
                             ApStatus = x.ApStatus == (int)Class_Appointments.ApplicationStatuses.DONE ? "Attended" :
                             x.ApStatus == (int)Class_Appointments.ApplicationStatuses.PENDING ? "Soon..." :
                             x.ApStatus == (int)Class_Appointments.ApplicationStatuses.CANCELED ? "Cancelled" : "Unknown",
                             Diagnosis = x.Diagnosis,
                             //SLDStart = x.SLDStart,
                             //SLDEndd = x.SLDEndd,
                             sickLeaveCount = (Convert.ToDateTime(x.SLDEnd.HasValue ? x.SLDEnd.Value : DateTime.Today) - Convert.ToDateTime(x.SLDStart.HasValue ? x.SLDStart.Value : DateTime.Today)).Days
                         }).ToList();


            foreach (var row in query)
            {
                PastAppointmentsIDs.Add(row.AppointmentID);
            }
            //if (query != null)
            //{
            //    //return query;

            //}
            //else
            //{
            //    return null;

            //}
            rpt.DataSource = query;
            rpt.DataBind();

        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void getPastLabReports(Repeater rpt, int appointmentID)
    {

        try
        {


            var query = (from x in db.LabReports
                         where appointmentID == x.AppointmentID
                         &&
                         x.Appointment.ApStatus == (int)ApplicationStatuses.DONE
                         select new
                         {
                             ReportDate = Convert.ToDateTime(x.ReportDate),
                             LabName = x.LabName,
                             ReportID = x.ReportID

                         }).ToList();

            rpt.DataSource = query;
            rpt.DataBind();

        }

        catch (Exception ex)
        {

            throw ex;
        }
    }
    public Appointment getAppointmentByID(int appointmentID)
    {
        try
        {
            var query = (from x in db.Appointments
                         where appointmentID == x.AppointmentID
                         select x).FirstOrDefault();

            if (query != null)
            {
                return query;

            }
            else
            {
                return null;

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public Timetable getDoctorBySlotID(int slotID)
    {
        try
        {
            var query = (from x in db.Timetables
                         where slotID == x.SlotID
                         select x).FirstOrDefault();

            if (query != null)
            {
                return query;

            }
            else
            {
                return null;

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public Doctor getDepartmentIDByDoctorID(int docID)
    {
        try
        {
            var query = (from x in db.Doctors
                         where docID == x.DoctorID
                         select x).FirstOrDefault();

            if (query != null)
            {
                return query;

            }
            else
            {
                return null;

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void getPastPrescriptions(Repeater rpt, int appointmentID)
    {
        try
        {
            var query = (from x in db.Prescriptions
                         where appointmentID == x.AppointmentID
                         select new
                         {
                             PrescriptionID = x.PrescriptionID,
                             //Date = Convert.ToDateTime(x.SupplyDate.HasValue ? x.SupplyDate.Value : DateTime.Today),
                             DoctorName = docInfo.RetrieveDoctorInfo(getDoctorBySlotID(getAppointmentByID(appointmentID).SlotID.Value).DoctorID.Value),
                             Department = docInfo.RetrieveDoctorDepartment(getDepartmentIDByDoctorID(getDoctorBySlotID(getAppointmentByID(appointmentID).SlotID.Value).DoctorID.Value).DepartmentID.Value)

                         }).ToList();

            rpt.DataSource = query;
            rpt.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    //public List<Appointment> getTestRequests(int docID)
    //{
    //    try
    //    {
    //        var query = (from appointment in db.Appointments
    //                     where
    //                     appointment.Do == empID
    //                     select emp).FirstOrDefault();



    //        if (query != null)
    //        {
    //            return query;

    //        }
    //        else
    //        {
    //            return null;

    //        }


    //    }
    //    catch (Exception ex)
    //    {

    //        throw ex;
    //    }
    //} 


    #region Manar
    public void fun_AddAppointement(DateTime _appDate
        , int _empId
        , int _slotId
        , bool checkLab
        , string _labName = "")
    {
        Appointment obj_Appointment = new Appointment();
        obj_Appointment.AppointmentDate = _appDate;
        obj_Appointment.ApStatus = (int)ApplicationStatuses.PENDING;
        obj_Appointment.EmployeeID = _empId;
        obj_Appointment.SlotID = _slotId;

        db.Appointments.InsertOnSubmit(obj_Appointment);
        db.SubmitChanges();

        if (checkLab)
        {
            fun_AddLabReport(_appDate, obj_Appointment.AppointmentID, _labName, 1)
;
        }






    }
    public void fun_AddLabReport(DateTime _appDate
       , int appId
       , string _labName
       , int _testId)
    {
        //add lab report
        LabReport obj_LabReport = new LabReport();
        obj_LabReport.AppointmentID = appId;
        obj_LabReport.LabName = _labName;
        obj_LabReport.PayStatus = 0;
        obj_LabReport.ReportDate = _appDate;

        db.LabReports.InsertOnSubmit(obj_LabReport);

        db.SubmitChanges();

        LabReportsDetail obj_LabReportsDetail = new LabReportsDetail();
        obj_LabReportsDetail.ReportID = obj_LabReport.ReportID;
        obj_LabReportsDetail.TestID = _testId;
        obj_LabReportsDetail.FinancialApprovalStatus = 0;

        db.LabReportsDetails.InsertOnSubmit(obj_LabReportsDetail);

        db.SubmitChanges();

    }
    public string GetAppointmentDay(string doctorName)
    {

        try
        {
            var DocID = (from doc in db.Doctors
                         where doc.DoctorName == doctorName
                         select doc.DoctorID).FirstOrDefault();

            var appDay = (from time in db.Timetables
                          where time.DoctorID == DocID
                          select time.TTDay).FirstOrDefault();

            return appDay;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public int GetAppointmentSlotID(string doctorName)
    {

        try
        {
            var DocID = (from doc in db.Doctors
                         where doc.DoctorName == doctorName
                         select doc.DoctorID).FirstOrDefault();

            var slot = (from time in db.Timetables
                        where time.DoctorID == DocID
                        select time.SlotID).FirstOrDefault();

            return slot;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    ////Past Appointments for Employee Account
    //public void getPastAppointmentsEmpAccount(Repeater rpt, int empID, ref List<int> PastAppointmentsIDs)
    //{

    //    try
    //    {
    //        var query = (from x in db.Appointments
    //                     where x.EmployeeID == empID
    //                     &&
    //                     x.ApStatus == (int)ApplicationStatuses.DONE
    //                     select new
    //                     {
    //                         AppointmentID = x.AppointmentID,
    //                         DoctorName = x.Timetable.Doctor.DoctorName,
    //                         DepartmentName = x.Timetable.Doctor.Department.DepartmentName,
    //                         ApStatus = x.ApStatus,
    //                         Diagnosis = x.Diagnosis,
    //                         sickLeaveCount = (Convert.ToDateTime(x.SLDEndd.HasValue ? x.SLDEndd.Value : DateTime.Today) - Convert.ToDateTime(x.SLDStart.HasValue ? x.SLDStart.Value : DateTime.Today)).Days
    //                     }).ToList();


    //        foreach (var row in query)
    //        {
    //            PastAppointmentsIDs.Add(row.AppointmentID);
    //        }
    //        rpt.DataSource = query;
    //        rpt.DataBind();

    //    }
    //    catch (Exception ex)
    //    {

    //        throw ex;
    //    }
    //}
    #endregion


    #region mahmoud
    public void getPastPrescriptionsByEmp(Repeater rpt, int empId)
    {
        try
        {
            var query = (from x in db.Prescriptions
                         where empId == x.Appointment.EmployeeID
                         &&
                         x.Appointment.ApStatus == (int)ApplicationStatuses.DONE
                         select new
                         {
                             PrescriptionID = x.PrescriptionID,
                             //Date = Convert.ToDateTime(x.SupplyDate.HasValue ? x.SupplyDate.Value : DateTime.Today),
                             DoctorName = docInfo.RetrieveDoctorInfo(getDoctorBySlotID(getAppointmentByID(x.AppointmentID.Value).SlotID.Value).DoctorID.Value),
                             Department = docInfo.RetrieveDoctorDepartment(getDepartmentIDByDoctorID(getDoctorBySlotID(getAppointmentByID(x.AppointmentID.Value).SlotID.Value).DoctorID.Value).DepartmentID.Value)

                         }).ToList();

            rpt.DataSource = query;
            rpt.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public void getPastLabReportsByEmp(Repeater rpt, int empId)
    {

        try
        {

            var query = (from x in db.LabReports
                         where empId == x.Appointment.EmployeeID
                         select new
                         {
                             ReportDate = Convert.ToDateTime(x.ReportDate),
                             LabName = x.LabName,
                             ReportID = x.ReportID

                         }).ToList();

            rpt.DataSource = query;
            rpt.DataBind();

        }

        catch (Exception ex)
        {

            throw ex;
        }
    }

    #endregion
}