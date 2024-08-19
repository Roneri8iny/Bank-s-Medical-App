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
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();

	public Class_Prescriptions()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //public Medicine getMedicineNameByID(int medicineID)
    //{
    //    try
    //    {
    //        var query = (from x in db.Medicines
    //                     where
    //                     x.MedicineID == medicineID
    //                     select x).FirstOrDefault();



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
    public void getPrescriptionData(Repeater rpt, int prescriptionID)
    {
        try
        {
            var query = (from x in db.PrescriptionsDetails
                         where
                         x.PrescriptionID == prescriptionID
                         select new {

                             MedicineName = x.Medicine.MedicineName,
                             Quantity = x.Quantity,
                             Frequency = x.Frequency,
                             Notes = x.Notes
                         
                         }).ToList();

            //select new
            //             {
            //                 ReportDate = Convert.ToDateTime(x.ReportDate) ,
            //                 LabName = x.LabName,
            //                 ReportID = x.ReportID

            //             }).ToList();

            rpt.DataSource = query;
            rpt.DataBind();


        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}