using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Account
{
    public partial class fRegisterAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                pnError.Visible = false;
                pnExist.Visible = false;
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
        protected void btnSignup_Command(object sender, CommandEventArgs e)
        {
            string username = txtusername.Text;
            string email = txtemail.Text;
            string pass1 = txtpassword.Text;
            string pass2 = txtpasswordConfirm.Text;
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator acc = db.AccountAdministrators.FirstOrDefault(x => x.Username == username || x.Email == email);
            if(acc == null)
            {
                if(pass1 == pass2)
                {
                    string password = GetMD5(pass1);
                    AccountAdministrator obj = new AccountAdministrator();
                    obj.Username = username;
                    obj.Email = email;
                    obj.Password = password;
                    obj.Role = "admin";
                    db.AccountAdministrators.Add(obj);
                    db.SaveChanges();
                    Response.Redirect("fLoginAdmin.aspx");
                }
                else
                {
                    pnError.Visible = true;
                }    
                
            }
            else
            {
                pnExist.Visible = true;
            }    

        }
    }
}