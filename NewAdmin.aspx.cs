using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_newAdmin_Click(object sender, EventArgs e)
    {
        LibraryDAL dal = new LibraryDAL();
        NewAdminModel model = new NewAdminModel();
        model.AdminName= txt_Adminname.Text;
        model.AdminEmailId = txt_Adminemailid.Text;
        model.AdminPassword = txt_Adminpassword.Text;
        model.AdminMobileNo = txt_AdminMobileNo.Text;

        
    }
}