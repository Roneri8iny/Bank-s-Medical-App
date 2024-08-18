using System; // Importing System namespace for basic functionalities
using System.Data; // Importing System.Data namespace for data manipulation
using System.Data.SqlClient; // Importing System.Data.SqlClient namespace for SQL Server operations
using System.Web.UI; // Importing System.Web.UI namespace for ASP.NET Web Forms
using System.Configuration; // Importing System.Configuration namespace for configuration management
using System.Web.Services; // Importing System.Web.Services namespace for web services

public partial class Pages_TimeTable : System.Web.UI.Page
{
    private string connectionString; // Variable to store the connection string for the database

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Retrieve connection string from Web.config
            connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString;
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
        string query = @"
            SELECT SlotID, TimeTable.DoctorID, Doctor.DoctorName, TTDay, StartTime, EndTime
            FROM TimeTable
            INNER JOIN Doctor ON Doctor.DoctorID = TimeTable.DoctorID"; // SQL query to get time table data and doctor names

        using (SqlConnection conn = new SqlConnection(connectionString)) // Create a new SQL connection using the connection string
        {
            using (SqlCommand cmd = new SqlCommand(query, conn)) // Create a SQL command with the query and connection
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd)) // Create a data adapter to fill the DataTable
                {
                    da.Fill(dt); // Fill the DataTable with data from the database
                }
            }
        }

        return dt; // Return the populated DataTable
    }

    [WebMethod]
    public static bool AddRow(string doctorName, string day, string startTime, string endTime)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString; // Retrieve connection string

        try
        {
            // Get DoctorID based on DoctorName
            int doctorId = GetDoctorID(doctorName); // Get the DoctorID for the given doctor name

            if (doctorId == 0) // Check if DoctorID is valid
                return false; // Return false if DoctorID is not found

            if (IsTimeSlotExisting(doctorId, day, startTime, endTime, connectionString)) // Check if the time slot already exists
                return false; // Return false if the time slot exists

            using (SqlConnection conn = new SqlConnection(connectionString)) // Create a new SQL connection
            {
                string query = @"
                    INSERT INTO TimeTable (DoctorID, TTDay, StartTime, EndTime)
                    VALUES (@DoctorID, @TTDay, @StartTime, @EndTime)"; // SQL query to insert a new row into TimeTable

                using (SqlCommand cmd = new SqlCommand(query, conn)) // Create a SQL command with the query and connection
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                    cmd.Parameters.AddWithValue("@TTDay", day);
                    cmd.Parameters.AddWithValue("@StartTime", startTime);
                    cmd.Parameters.AddWithValue("@EndTime", endTime);

                    conn.Open(); // Open the SQL connection
                    int rowsAffected = cmd.ExecuteNonQuery(); // Execute the command and get the number of rows affected
                    return rowsAffected > 0; // Return true if the row was inserted successfully
                }
            }
        }
        catch (Exception ex)
        {
            // Log exception (logging code not included)
            return false; // Return false if there was an exception
        }
    }

    private static int GetDoctorID(string doctorName)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString; // Retrieve connection string
        int doctorID = 0; // Default value for DoctorID

        using (SqlConnection conn = new SqlConnection(connectionString)) // Create a new SQL connection
        {
            string query = "SELECT DoctorID FROM Doctor WHERE DoctorName = @DoctorName"; // SQL query to get DoctorID for a given doctor name

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

    private static bool IsTimeSlotExisting(int doctorId, string day, string startTime, string endTime, string connectionString)
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
}
