using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

public partial class Pages_Finance_home : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int financeID = GetFinanceID();
            if (financeID > 0)
            {
                LoadData(financeID);
            }
            else
            {
                // Redirect or show an error if FinanceID is not found
                Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }

    private int GetFinanceID()
    {
        Finance obj_Finance = (Finance)Session["FinanceAccount"];
        return obj_Finance.FinanceID;
    }

    private void LoadData(int financeID)
    {
        using (NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext(connectionString))
        {
            var finance = db.Finances.FirstOrDefault(f => f.FinanceID == financeID);
            if (finance != null)
            {
                lblFinanceName.Text = finance.FinanceName;
                lblUsername.Text = finance.Username;
            }
        }
    }
}