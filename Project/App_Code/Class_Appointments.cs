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
    public enum AppointmentPayStatus
    {
        PENDING = 1,
        ACCEPTED = 2,
        DECLINED = 3
    };
	public Class_Appointments()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<Timetable> getAppointmentSlots(int docID){

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
                         &&
                         appointments.ApStatus == 1
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
                         &&
                         x.ApStatus == (int)ApplicationStatuses.DONE
                         select new 
                         {
                             AppointmentID = x.AppointmentID,
                             //SlotID = x.SlotID.Value,
                             DoctorName = x.Timetable.Doctor.DoctorName,
                             DepartmentName = x.Timetable.Doctor.Department.DepartmentName,
                             ApStatus = "Attended",
                             Diagnosis = x.Diagnosis,
                             //SLDStart = x.SLDStart,
                             //SLDEndd = x.SLDEndd,
                             sickLeaveCount = (Convert.ToDateTime(x.SLDEndd.HasValue ? x.SLDEndd.Value : DateTime.Today) - Convert.ToDateTime(x.SLDStart.HasValue ? x.SLDStart.Value : DateTime.Today)).Days
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
                         select new
                         {
                             ReportDate = Convert.ToDateTime(x.ReportDate) ,
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
}