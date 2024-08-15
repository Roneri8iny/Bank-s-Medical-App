using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class_Login
/// </summary>
public class Class_Login
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();

    

	public Class_Login()
	{
		//
		// TODO: Add constructor logic here
		//
	}

   //Function Read////
    public Doctor CheckUserValidity(string UserName,string Password)
    {
        try
        {
            var query = (from doc in db.Doctors
                         where
                         doc.Username == UserName
                         &&
                         doc.DoctorPassword == Password
                         select doc).FirstOrDefault();



            if(query != null)
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