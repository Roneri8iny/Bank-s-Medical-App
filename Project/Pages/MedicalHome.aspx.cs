using System.Data.SqlClient;
using System;
using System.Configuration;

public partial class Pages_MedicalHome : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int medicalFieldID = GetMedicalFieldID();
            if (medicalFieldID > 0)
            {
                LoadData(medicalFieldID);
            }
            else
            {
                // Redirect or show an error if MFID is not found
                Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }

    private int GetMedicalFieldID()
    {
        MedicalField obj_MedicalField = (MedicalField)Session["MedicalFieldAccount"];

        
        return obj_MedicalField.MFID;
    }

    private void LoadData(int medicalFieldID)
    {
        string query = @"
            SELECT 
                (SELECT COUNT(*) FROM Doctor WHERE MFID = @MFID) AS DoctorCount,
                MFName, Username, Email, Hotline, MFAddress
            FROM 
                MedicalField 
            WHERE 
                MFID = @MFID";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@MFID", medicalFieldID);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblDoctorsAvailable.Text = reader["DoctorCount"].ToString();
                lblProfileName.Text = reader["MFName"].ToString();
                lblUsername.Text = "Username: " + reader["Username"].ToString();
                lblEmail.Text = "Email: " + reader["Email"].ToString();
                lblHotline.Text = "Hotline: " + reader["Hotline"].ToString();
                lblAddress.Text = "Address: " + reader["MFAddress"].ToString();
            }
        }
    }
}
