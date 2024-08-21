﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Class_LabTests
/// </summary>
public class Class_LabTests
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();

    public Class_LabTests()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void getReportData(Repeater rpt, int reportID)
    {
        try
        {
            var query = (from x in db.LabReportsDetails
                         where
                         x.ReportID == reportID
                         select new
                         {

                             TestName = x.Test.TestName,
                             ResultPDF = x.ResultPDF

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