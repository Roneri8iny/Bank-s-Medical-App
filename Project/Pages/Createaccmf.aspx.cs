using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Linq;

public partial class Pages_Createaccmf : System.Web.UI.Page
{
    // Define the database context
    private DataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Initialize the database context
        db = new DataClassesDataContext("Data Source=LAPTOP-NBC2SOFE\\MSSQLSERVER01;Initial Catalog=Bank Medical DB;Integrated Security=True");
    }

    protected void CreateAccountButton_Click(object sender, EventArgs e)
    {
        try
        {
            // Create a new instance of the MedicalField entity
            MedicalField medicalField_obj = new MedicalField();

            // Set the properties from the input fields
            medicalField_obj.Username = UsernameTextBox.Text;
            medicalField_obj.MFPassword = PasswordTextBox.Text;

            // Hotline conversion with error handling
            int hotline;
            if (int.TryParse(HotlineTextBox.Text, out hotline))
            {
                medicalField_obj.Hotline = hotline;
            }
            else
            {
                // Display error message if the Hotline input is invalid
                ErrorMessage("Please enter a valid number for the Hotline.");
                return;
            }

            medicalField_obj.MFAddress = AddressTextBox.Text;
            medicalField_obj.MFType = MedicalFieldDropDown.SelectedItem.Text;
            medicalField_obj.Email = EmailTextBox.Text;

            // Insert the new MedicalField object into the database
            db.MedicalFields.InsertOnSubmit(medicalField_obj);
            db.SubmitChanges();

            // Display success message
            SuccessMessage("Medical Field account created successfully!");
        }
        catch (Exception ex)
        {
            // Log or handle the error
            ErrorMessage("An error occurred while creating the account: " + ex.Message);
        }
    }

    private void ErrorMessage(string message)
    {
        // Implement logic to display error messages (e.g., using a Label or JavaScript alert)
        // Example:
        // ErrorLabel.Text = message;
        // ErrorLabel.Visible = true;
    }

    private void SuccessMessage(string message)
    {
        // Implement logic to display success messages (e.g., using a Label or JavaScript alert)
        // Example:
        // SuccessLabel.Text = message;
        // SuccessLabel.Visible = true;
    }
}
 