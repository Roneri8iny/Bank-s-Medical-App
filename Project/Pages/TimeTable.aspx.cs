using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Linq;

public partial class Pages_TimeTable : System.Web.UI.Page
{
    public string connectionString; // Variable to store the connection string for the database
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
        connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString;
        if (!IsPostBack)
        {
            BindTimeTableGrid(); // Bind the data to the grid on initial page load
        }
    }

    private void BindTimeTableGrid()
    {
        DataTable dt = GetTimeTableData(); // Retrieve the time table data
        timeTableGrid.DataSource = dt; // Set the data source of the grid
        timeTableGrid.DataBind(); // Bind the data to the grid
    }

    private DataTable GetTimeTableData()
    {
        DataTable dt = new DataTable(); // Create a DataTable to hold the query results
        int mfid = GetMedicalFieldID(); // Retrieve the MFID from the session

        string query = @"
            SELECT SlotID, TimeTable.DoctorID, Doctor.DoctorName, TTDay, StartTime, EndTime
            FROM TimeTable
            INNER JOIN Doctor ON Doctor.DoctorID = TimeTable.DoctorID
            WHERE Doctor.MFID = @MFID"; // SQL query to get time table data and doctor names filtered by MFID

        using (SqlConnection conn = new SqlConnection(connectionString)) // Create a new SQL connection using the connection string
        {
            using (SqlCommand cmd = new SqlCommand(query, conn)) // Create a SQL command with the query and connection
            {
                cmd.Parameters.AddWithValue("@MFID", mfid); // Add MFID as a parameter

                using (SqlDataAdapter da = new SqlDataAdapter(cmd)) // Create a data adapter to fill the DataTable
                {
                    da.Fill(dt); // Fill the DataTable with data from the database
                }
            }
        }

        return dt; // Return the populated DataTable
    }

    private int GetMedicalFieldID()
    {
        // Retrieve the MFID from the session
        MedicalField obj_MedicalField = (MedicalField)Session["MedicalFieldAccount"];

            return obj_MedicalField.MFID;
    }

    private static int GetDoctorID(string doctorName)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString; // Retrieve connection string
        int doctorID = 0; // Default value for DoctorID

        using (SqlConnection conn = new SqlConnection(connectionString)) // Create a new SQL connection
        {
            string query = "SELECT DoctorID FROM Doctor WHERE Username = @DoctorName"; // SQL query to get DoctorID for a given doctor name

            using (SqlCommand cmd = new SqlCommand(query, conn)) // Create a SQL command with the query and connection
            {
                cmd.Parameters.AddWithValue("@DoctorName", doctorName); // Add parameter for doctor name
                conn.Open(); // Open the SQL connection
                object result = cmd.ExecuteScalar(); // Execute the query and get the result
                if (result != null) // Check if result is not null
                {
                    int.TryParse(result.ToString(), out doctorID); // Convert result to integer
                }
            }
        }

        return doctorID; // Return the DoctorID
    }

    private static bool IsTimeSlotExisting(int doctorId, string day, TimeSpan startTime, TimeSpan endTime, string connectionString)
    {
        using (SqlConnection conn = new SqlConnection(connectionString)) // Create a new SQL connection
        {
            string query = @"
                SELECT COUNT(*)
                FROM TimeTable
                WHERE DoctorID = @DoctorID
                  AND TTDay = @TTDay    
                  AND StartTime = @StartTime
                  AND EndTime = @EndTime"; // SQL query to check if the time slot already exists

            using (SqlCommand cmd = new SqlCommand(query, conn)) // Create a SQL command with the query and connection
            {
                // Add parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                cmd.Parameters.AddWithValue("@TTDay", day);
                cmd.Parameters.AddWithValue("@StartTime", startTime);
                cmd.Parameters.AddWithValue("@EndTime", endTime);

                conn.Open(); // Open the SQL connection
                int count = (int)cmd.ExecuteScalar(); // Execute the query and get the count of existing slots
                return count > 0; // Return true if the slot exists
            }
        }
    }

    protected void deleteRow_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)(sender as Control).Parent.Parent;
        int ID = row.RowIndex;
        int Final = int.Parse(timeTableGrid.DataKeys[ID].Value.ToString());

        var Time = db.Timetables.SingleOrDefault(d => d.SlotID == Final);

        if (Time != null)
        {
            try
            {
                db.Timetables.DeleteOnSubmit(Time);
                db.SubmitChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot deleted successfully.');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while deleting the time slot.');", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot not found.');", true);
        }
        BindTimeTableGrid();
    }

    protected void addRow_Click(object sender, EventArgs e)
    {
        bool check = IsTimeSlotExisting(GetDoctorID(txt_doctorName.Text.Trim()), ddl_days.SelectedValue, TimeSpan.Parse(txt_startTime.Text.ToString()), TimeSpan.Parse(txt_endTime.Text.ToString()), connectionString);

        if (!check)
        {
            Timetable Time = new Timetable
            {
                DoctorID = GetDoctorID(txt_doctorName.Text.Trim()),
                TTDay = ddl_days.SelectedValue,
                StartTime = TimeSpan.Parse(txt_startTime.Text.ToString()),
                EndTime = TimeSpan.Parse(txt_endTime.Text.ToString()),
                // Ensure MFID is correctly associated
                MFID = GetMedicalFieldID()
            };

            db.Timetables.InsertOnSubmit(Time);
            db.SubmitChanges();
            BindTimeTableGrid();
        }
    }
}
