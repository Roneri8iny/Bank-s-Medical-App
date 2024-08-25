using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Viewandedit : System.Web.UI.Page
{
    DataClasses_MedicalAppDataContext db = new DataClasses_MedicalAppDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //LoadAccounts();
        }
    }

    public void LoadAccounts(string searchTerm)
    {

        var query = (from tbl in db.MedicalFields
                     where
                     (tbl.Username.Contains(searchTerm)
                     || tbl.Email.Contains(searchTerm)
                     )
                     select new {
                         tbl.MFID,
                         tbl.Username,
                         tbl.Email,
                         tbl.Hotline,
                         tbl.MFAddress,
                         tbl.MFType,
                     }).ToList();


        AccountsGridView.DataSource = query;
        AccountsGridView.DataBind();



    }

    protected void AccountsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            int mfid = Convert.ToInt32(e.CommandArgument);
            LoadEditModal(mfid);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditModal", "$('#editModal').modal('show');", true);
        }
        else if (e.CommandName == "Delete")
        {
            int mfid = Convert.ToInt32(e.CommandArgument);
            DeleteAccount(mfid);
        }
    }

    public void LoadEditModal(int mfid)
    {
        var medicalField = db.MedicalFields.SingleOrDefault(mf => mf.MFID == mfid);

        if (medicalField != null)
        {
            EditUsername.Text = medicalField.Username;
            EditEmail.Text = medicalField.Email;
            EditHotline.Text = medicalField.Hotline.ToString();
            EditAddress.Text = medicalField.MFAddress;
            EditMedicalField.SelectedValue = medicalField.MFType;

            ViewState["MFID"] = mfid;
        }
    }

    public void DeleteAccount(int mfid)
    {
        try
        {
            // Check if the MedicalField exists in the database
            var medicalField = db.MedicalFields.SingleOrDefault(mf => mf.MFID == mfid);

            if (medicalField != null)
            {
                // Delete the MedicalField record
                db.MedicalFields.DeleteOnSubmit(medicalField);
                db.SubmitChanges();

                // Reload the accounts after deletion
                LoadAccounts("");

                // Notify the user of successful deletion
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "Toastify({text: 'Account deleted successfully!', backgroundColor: 'green'}).showToast();", true);
            }
            else
            {
                // Notify the user if the account was not found
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "Toastify({text: 'Account not found!', backgroundColor: 'red'}).showToast();", true);
            }
        }
        catch (Exception ex)
        {
            // Notify the user if there was an error during deletion
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "Toastify({text: 'Error deleting account: " + ex.Message + "', backgroundColor: 'red'}).showToast();", true);
        }
    }


    protected void SaveChangesButton_Click(object sender, EventArgs e)
    {
        try
        {
            int mfid = (int)ViewState["MFID"];

            var medicalField = db.MedicalFields.SingleOrDefault(mf => mf.MFID == mfid);

            if (medicalField != null)
            {
                medicalField.Username = EditUsername.Text;
                medicalField.Email = EditEmail.Text;
                medicalField.Hotline = Convert.ToInt32(EditHotline.Text);
                medicalField.MFAddress = EditAddress.Text;
                medicalField.MFType = EditMedicalField.SelectedValue;

                db.SubmitChanges();

                LoadAccounts("");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccess", "Toastify({text: 'Account updated successfully!', backgroundColor: 'green'}).showToast();", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "Toastify({text: 'Error updating account: " + ex.Message + "', backgroundColor: 'red'}).showToast();", true);
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "closeEditModal", "$('#editModal').modal('hide');", true);
    }

    protected void SearchButton1_Click(object sender, EventArgs e)
    {
        LoadAccounts(SearchInput.Text.Trim());
    }
    protected void DeleteButton_Command(object sender, CommandEventArgs e)
    {
        int mfid = Convert.ToInt32(e.CommandArgument);
        DeleteAccount(mfid);
    }
}
