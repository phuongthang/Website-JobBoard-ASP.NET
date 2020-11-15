using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fProfilePerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = (string)Session["username"];
                if (username != null)
                {
                    getData(username);
                    setData(username);
                }
            }
        }
        public void getData(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                lbEmail.Text = obj.Email;
                if (obj.Url == null)
                {
                    imageAvt.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                }
                else
                {
                    imageAvt.ImageUrl = "../Template/assets/images/person/" + obj.Url;
                }
                if (obj.Fullname == null)
                {
                    lbFullname.Text = "Unknown";
                }
                else
                {
                    lbFullname.Text = obj.Fullname;
                }
                if (obj.Position == null)
                {
                    lbPosition.Text = "Unknown";
                }
                else
                {
                    lbPosition.Text = obj.Position;
                }
                lbPhone.Text = obj.Phone;
                lbAddress.Text = obj.Address;
                lbDetail.Text = obj.Detail;
            }
        }
        public void setData(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                txtfullnameedit.Text = obj.Fullname;
                txtaddressedit.Text = obj.Address;
                txtphonenumberedit.Text = obj.Phone;
                txtdetailedit.Text = obj.Detail;
                txtpositionedit.Text = obj.Position;
            }
        }

        protected void btnUpdate_Command(object sender, CommandEventArgs e)
        {
            WorkITEntities db = new WorkITEntities();
            string username = (string)Session["username"];
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                obj.Fullname = txtfullnameedit.Text;
                obj.Position = txtpositionedit.Text;
                obj.Address = txtaddressedit.Text;
                obj.Detail = txtdetailedit.Text;
                obj.Phone = txtphonenumberedit.Text;
                if (FuAvt.HasFile)
                {
                    string ext = Path.GetFileName(FuAvt.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    string fileName = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    FuAvt.SaveAs(Server.MapPath("../Template/assets/images/person/" + fileName));
                    obj.Url = fileName;
                }
                db.SaveChanges();
                getData(username);
            }
        }
    }
}