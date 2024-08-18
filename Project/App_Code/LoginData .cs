using System;
using System.Linq;

/// <summary>
/// Summary description for LoginData
/// </summary>
public class LoginData
{
    NewAccountDataClassesDataContext db;

    public LoginData()
    {
        // Initialize the database context with the correct connection string
        NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    }

    // Function to check user validity
    public object CheckUserValidity(string userName, string password, string accountType)
    {
        try
        {
            switch (accountType)
            {
                case "Employee":
                    return (from tbl in db.Employees
                            where tbl.EmployeeName == userName
                            && tbl.Password == password  // Ensure password is being checked
                            select tbl).FirstOrDefault();

                case "Doctor":
                    return (from tbl in db.Doctors
                            where tbl.DoctorName == userName
                            && tbl.DoctorPassword == password
                            select tbl).FirstOrDefault();

                case "Middle Man":
                    return (from tbl in db.MiddleMans
                            where tbl.MMName == userName
                            && tbl.MMPassword == password
                            select tbl).FirstOrDefault();

                case "Medical Field":
                    return (from tbl in db.MedicalFields
                            where tbl.MFName == userName
                            && tbl.MFPassword == password
                            select tbl).FirstOrDefault();

                case "Finance":
                    return (from tbl in db.Finances
                            where tbl.FinanceName == userName
                            && tbl.FinancePassword == password
                            select tbl).FirstOrDefault();

                default:
                    return null;
            }
        }
        catch (Exception ex)
        {
            // Log the exception details for debugging purposes
            // For example: LogError(ex);
            throw new ApplicationException("An error occurred while checking user validity.", ex);
        }
    }
}
