using System;
using System.Data.SqlClient;

public partial class Pages_Finance_home : System.Web.UI.Page
{
    private string connectionString = @"Data Source=LAPTOP-NBC2SOFE\MSSQLSERVER01;Initial Catalog='Bank Medical DB';Integrated Security=True";

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
        string query = @"
            SELECT 
                FinanceName, Username 
            FROM 
                Finance 
            WHERE 
                FinanceID = @FinanceID";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@FinanceID", financeID);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblFinanceName.Text = reader["FinanceName"].ToString();
                lblUsername.Text = reader["Username"].ToString();
            }
        }
    }
}
