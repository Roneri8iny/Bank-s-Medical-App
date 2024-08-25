using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DoctorInfo
/// </summary>
public class DoctorInfo
{
    DataClassesDataContext db = new DataClassesDataContext("Data Source=LAPTOP-NBC2SOFE\\MSSQLSERVER01;Initial Catalog=Bank Medical DB;Integrated Security=True");


    public DoctorInfo()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Doctor RetrieveDoctorInfo(int ID)
    {
        try
        {
            var query = (from doc in db.Doctors
                         where
                         doc.DoctorID == ID
                         select doc).FirstOrDefault();



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

    public string RetrieveDoctorDepartment(int deptID)
    {
        try
        {
            var query = (from dept in db.Departments
                         where
                         dept.DepartmentID == deptID
                         select dept.DepartmentName).FirstOrDefault();



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

}