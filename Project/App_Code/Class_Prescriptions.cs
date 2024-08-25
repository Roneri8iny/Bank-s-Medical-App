using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Class_Prescriptions
/// </summary>
public class Class_Prescriptions
{
    DataClassesDataContext db = new DataClassesDataContext("Data Source=LAPTOP-NBC2SOFE\\MSSQLSERVER01;Initial Catalog=Bank Medical DB;Integrated Security=True");

    public Class_Prescriptions()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void getPrescriptionData(Repeater rpt, int prescriptionID)
    {
        try
        {
            var query = (from x in db.PrescriptionsDetails
                         where
                         x.PrescriptionID == prescriptionID
                         select new
                         {

                             MedicineName = x.Medicine.MedicineName,
                             Quantity = x.Quantity,
                             Frequency = x.Frequency,
                             Notes = x.Notes

                         }).ToList();

            rpt.DataSource = query;
            rpt.DataBind();


        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}