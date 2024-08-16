using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_NewAccount : System.Web.UI.Page
{
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_addDoctor_Click(object sender, EventArgs e)
    {
        Doctor doctor_obj = new Doctor();
        doctor_obj.DoctorName = txt_doctor_name.Text;
        doctor_obj.Price = Convert.ToDecimal(txt_price.Text);
        doctor_obj.Username = username.Text;
        doctor_obj.DoctorPassword = password.Text;
        doctor_obj.Mobile = Convert.ToInt64(txt_mobile.Text);
        doctor_obj.Position = ddl_postion.SelectedItem.Text;
        doctor_obj.DepartmentID = Convert.ToInt32(ddl_Departments.SelectedValue);
        doctor_obj.MFID = 3;

        
        db.Doctors.InsertOnSubmit(doctor_obj);
        db.SubmitChanges();
    }
}