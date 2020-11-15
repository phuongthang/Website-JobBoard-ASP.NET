using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Account
{
    public partial class fResetPasswordUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string username = (string)Session["username"];
                if(username == null)
                {
                    Response.Redirect("fLoginUser.aspx");
                }
                else
                {
                    pnSuccess.Visible = false;
                    pnError.Visible = false;
                }    
                
            }    
        }
        public static string GetMD5(string str)
        {

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

            StringBuilder sbHash = new StringBuilder();

            foreach (byte b in bHash)
            {

                sbHash.Append(String.Format("{0:x2}", b));

            }

            return sbHash.ToString();

        }
        protected void btnResetPassword_Command(object sender, CommandEventArgs e)
        {
            string obje = DropObject.SelectedValue;
            if(obje == "Organizations")
            {
                string username = txtusername.Text;
                string email = txtemail.Text;
                WorkITEntities db = new WorkITEntities();
                AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username && x.Email == email);
                if (obj != null)
                {
                    obj.Password = GetMD5("123456");
                    db.SaveChanges();
                    pnError.Visible = false;
                    pnSuccess.Visible = true;
                }
                else
                {
                    pnError.Visible = true;
                    pnSuccess.Visible = false;
                }
            }
            else
            {
                string username = txtusername.Text;
                string email = txtemail.Text;
                WorkITEntities db = new WorkITEntities();
                AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username && x.Email == email);
                if (obj != null)
                {
                    obj.Password = GetMD5("123456");
                    db.SaveChanges();
                    pnError.Visible = false;
                    pnSuccess.Visible = true;
                }
                else
                {
                    pnError.Visible = true;
                    pnSuccess.Visible = false;
                }
            }    
        }
    }
}