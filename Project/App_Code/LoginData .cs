using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class_Login
/// </summary>
public class LoginData
{
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    public LoginData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

   //Function Read//
    public Object CheckUserValidity(string UserName,string Password, string accountType)
    {
        try
        {
            switch(accountType)
            {
                case "Employee":
                    return (from tbl in db.Employees
                               where tbl.EmployeeName == UserName
                               //&& tbl.Password == Password
                               select tbl).FirstOrDefault();
                case "Doctor":
                    return (from tbl in db.Doctors
                               where tbl.DoctorName == UserName
                               && tbl.DoctorPassword == Password
                               select tbl).FirstOrDefault();
                //case  "Lab Doctor"
                case "Middle Man":
                    return (from tbl in db.MiddleMans
                                  where tbl.MMName == UserName
                                  && tbl.MMPassword == Password
                                  select tbl).FirstOrDefault();
                case "Medical Field":
                    return (from tbl in db.MedicalFields
                                    where tbl.MFName == UserName
                                    && tbl.MFPassword == Password
                                    select tbl).FirstOrDefault();
                case "Finance":
                    return (from tbl in db.Finances
                               where tbl.FinanceName == UserName
                               && tbl.FinancePassword == Password
                               select tbl).FirstOrDefault();
                default:
                    return null;
            }

            
        }
        catch (Exception ex)
        {
            
            throw ex;
        }
    }

}