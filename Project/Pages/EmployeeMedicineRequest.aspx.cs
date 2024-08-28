using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Pages_MedicineRequest : System.Web.UI.Page
{
    Class_Employee employee = new Class_Employee();

    public void Page_Load(object sender, EventArgs e)
    {
        var EmpAccount = Session["EmpAccount"] as Employee;
        if (EmpAccount == null)
        {
            Response.Redirect("Login.aspx");
        }
        employee.GetMonthlyPrescriptions(PrescriptionsRpt, EmpAccount.EmployeeID);
    }

    public void PrescriptionsRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            var EmpAccount = Session["EmpAccount"] as Employee;
            if (EmpAccount != null)
            {
                Label lbl_error = (Label)e.Item.FindControl("lbl_error");
                HtmlGenericControl error_div = (HtmlGenericControl)e.Item.FindControl("error_div");
                Label lbl_success = (Label)e.Item.FindControl("lbl_success");
                HtmlGenericControl success_div = (HtmlGenericControl)e.Item.FindControl("success_div");

                int prescriptionID = Convert.ToInt32(e.CommandArgument);
                DateTime? lastRenewalDate = employee.GetLastRenewalPrescriptionDate(prescriptionID);
                if (!lastRenewalDate.HasValue)
                {
                    lbl_error.Text = "Less than 30 days have passed since last renewal";
                    error_div.Visible = true;
                    success_div.Visible = false;
                    return;
                }
                DateTime today = DateTime.Today;
                TimeSpan timeSpan = today - lastRenewalDate.Value;
                int daysSinceLastRenewal = timeSpan.Days;

                if (daysSinceLastRenewal >= 30)
                {
                    employee.UpdateRenewalStatus(prescriptionID);
                    lbl_success.Text = "Prescription Renewal Requested";
                    success_div.Visible = true;
                    error_div.Visible = false;
                    LinkButton btn = (LinkButton)e.Item.FindControl("RenewButton");
                    btn.Visible = false;
                }
                else
                {
                    lbl_error.Text = "Less than 30 days have passed since last renewal";
                    error_div.Visible = true;
                    success_div.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}
