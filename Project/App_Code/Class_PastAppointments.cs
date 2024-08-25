using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class_PastAppointments
/// </summary>
public class Class_PastAppointments
{
    public Class_PastAppointments()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int AppointmentID { get; set; }
    public int? SlotID { get; set; }
    public string DoctorName { get; set; }
    public string DepartmentName { get; set; }
    public int ApStatus { get; set; }
    public string Diagnosis { get; set; }
    public DateTime SLDStart { get; set; }
    public DateTime SLDEndd { get; set; }
}