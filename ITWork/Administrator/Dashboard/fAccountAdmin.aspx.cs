using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fAccountAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
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
        public void getData()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from acc in db.AccountAdministrators
                       select acc).ToList();
            dgvAccountAdmin.DataSource = obj;
            dgvAccountAdmin.DataBind();
        }
        public string getImage(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator obj = db.AccountAdministrators.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                if (obj.Url == null)
                {
                    return "users/unknow.jpg";
                }
                else
                {
                    return "administrator/" + obj.Url;
                }
            }
            else
            {
                return "";
            }
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            string username = e.CommandArgument.ToString();
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator obj = db.AccountAdministrators.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                db.AccountAdministrators.Remove(obj);
                db.SaveChanges();
                getData();
            }
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            string username = e.CommandArgument.ToString();
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator obj = db.AccountAdministrators.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                obj.Password = GetMD5("123456");
                db.SaveChanges();
                getData();
                pnThongbao.Visible = true;
            }
        }

        protected void dgvAccountAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAccountAdmin.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}