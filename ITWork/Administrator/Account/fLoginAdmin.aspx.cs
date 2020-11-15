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
    public partial class fLoginAdmin : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                pnThongbao.Visible = false;
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

        protected void btnLogin_Command(object sender, CommandEventArgs e)
        {
            string username = txtusername.Text;
            string password = txtpassword.Text;
            string pass = GetMD5(password);
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator acc = db.AccountAdministrators.FirstOrDefault(x => x.Username == username && x.Password == pass);
            if (acc != null)
            {
                Session["username"] = username;
                Session["role"] = acc.Role;
                Response.Redirect("../Dashboard/Home.aspx");
            }
            else
            {
                pnThongbao.Visible = true;
            }
        }
    }
}