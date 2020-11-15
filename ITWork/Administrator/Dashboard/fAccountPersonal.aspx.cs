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
    public partial class fAccountPersonal : System.Web.UI.Page
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
        protected void dgvAccountPerson_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAccountPerson.PageIndex = e.NewPageIndex;
            getData();
        }
        public void getData()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from acc in db.AccountPersons
                       select acc).ToList();
            dgvAccountPerson.DataSource = obj;
            dgvAccountPerson.DataBind();
        }
        public string getImage(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                if (obj.Url == null)
                {
                    return "users/unknow.jpg";
                }
                else
                {
                    return "person/" + obj.Url;
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
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                db.AccountPersons.Remove(obj);
                db.SaveChanges();
                getData();
            }
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            string username = e.CommandArgument.ToString();
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                obj.Password = GetMD5("123456");
                db.SaveChanges();
                getData();
                pnThongbao.Visible = true;
            }
        }
    }
}