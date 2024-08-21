using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI;
using System;

public partial class Pages_TimeTable : System.Web.UI.Page
{
    public string connectionString;
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
        connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString;
        if (!IsPostBack)
        {
            BindTimeTableGrid();
        }
    }

    private void BindTimeTableGrid()
    {
        try
        {
            DataTable dt = GetTimeTableData();
            timeTableGrid.DataSource = dt;
            timeTableGrid.DataBind();
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while loading the timetable.');", true);
        }
    }

    private DataTable GetTimeTableData()
    {
        DataTable dt = new DataTable();
        int mfid = GetMedicalFieldID();

        string query = @"
            SELECT SlotID, TimeTable.DoctorID, Doctor.DoctorName, TTDay, StartTime, EndTime
            FROM TimeTable
            INNER JOIN Doctor ON Doctor.DoctorID = TimeTable.DoctorID
            WHERE Doctor.MFID = @MFID";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@MFID", mfid);

                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while retrieving the timetable data.');", true);
                }
            }
        }

        return dt;
    }

    private int GetMedicalFieldID()
    {
        MedicalField obj_MedicalField = (MedicalField)Session["MedicalFieldAccount"];
        if (obj_MedicalField != null)
        {
            return obj_MedicalField.MFID;
        }
        else
        {
            return 0;
        }
    }


    private static int GetDoctorID(string doctorName)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Bank_Medical_DBConnectionString"].ConnectionString;
        int doctorID = 0;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT DoctorID FROM Doctor WHERE Username = @DoctorName";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@DoctorName", doctorName);

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        int.TryParse(result.ToString(), out doctorID);
                    }
                }
                catch (Exception)
                {
                    // Handle or log the error appropriately
                }
            }
        }

        return doctorID;
    }

    private static bool IsTimeSlotExisting(int doctorId, string day, TimeSpan startTime, TimeSpan endTime, string connectionString)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT COUNT(*)
                    FROM TimeTable
                    WHERE DoctorID = @DoctorID
                      AND TTDay = @TTDay
                      AND StartTime = @StartTime
                      AND EndTime = @EndTime";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                    cmd.Parameters.AddWithValue("@TTDay", day);
                    cmd.Parameters.AddWithValue("@StartTime", startTime);
                    cmd.Parameters.AddWithValue("@EndTime", endTime);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }
        catch (Exception)
        {
            // Handle or log the error appropriately
            return false;
        }
    }

    protected void deleteRow_Click(object sender, EventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(sender as Control).Parent.Parent;
            int ID = row.RowIndex;
            int Final = int.Parse(timeTableGrid.DataKeys[ID].Value.ToString());

            var Time = db.Timetables.SingleOrDefault(d => d.SlotID == Final);

            if (Time != null)
            {
                db.Timetables.DeleteOnSubmit(Time);
                db.SubmitChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot deleted successfully.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot not found.');", true);
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while deleting the time slot.');", true);
        }
        finally
        {
            BindTimeTableGrid();
        }
    }

    protected void addRow_Click(object sender, EventArgs e)
    {
        try
        {
            int doctorID = GetDoctorID(txt_doctorName.Text.Trim());
            if (doctorID == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor not found.');", true);
                return;
            }

            bool check = IsTimeSlotExisting(doctorID, ddl_days.SelectedValue, TimeSpan.Parse(txt_startTime.Text), TimeSpan.Parse(txt_endTime.Text), connectionString);

            if (!check)
            {
                Timetable Time = new Timetable
                {
                    DoctorID = doctorID,
                    TTDay = ddl_days.SelectedValue,
                    StartTime = TimeSpan.Parse(txt_startTime.Text),
                    EndTime = TimeSpan.Parse(txt_endTime.Text),
                    MFID = GetMedicalFieldID()
                };

                db.Timetables.InsertOnSubmit(Time);
                db.SubmitChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot added successfully.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot already exists.');", true);
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while adding the time slot.');", true);
        }
        finally
        {
            BindTimeTableGrid();
        }
    }
}
