using System;
using System.Data.SqlClient;

public partial class Pages_middlemanHome : System.Web.UI.Page
{
    private string connectionString = @"Data Source=LAPTOP-NBC2SOFE\MSSQLSERVER01;Initial Catalog='Bank Medical DB';Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int middleManID = GetMiddleManID();
            if (middleManID > 0)
            {
                LoadData(middleManID);
            }
            else
            {
                // Redirect or show an error if MiddleManID is not found
                Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }

    private int GetMiddleManID()
    {
        MiddleMan obj_MiddleMan = (MiddleMan)Session["MiddleManAccount"];
        if (obj_MiddleMan != null)
        {
            return obj_MiddleMan.MMID;
        }
        else
        {
            return 0; // Return 0 if the session object is null
        }
    }

    private void LoadData(int middleManID)
    {
        string query = @"
            SELECT 
                MMName, Username, Email 
            FROM 
                MiddleMan 
            WHERE 
                MMID = @MMID";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@MMID", middleManID);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                MMNameLabel.Text = reader["MMName"].ToString();
                UsernameLabel.Text = reader["Username"].ToString();
                EmailLabel.Text = reader["Email"].ToString();
            }
        }
    }
}
