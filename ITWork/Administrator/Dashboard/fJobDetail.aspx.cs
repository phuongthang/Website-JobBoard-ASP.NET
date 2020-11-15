using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fJobDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["ID"] == null || Request.QueryString["Username"]==null)
                {
                    
                }
                else
                {
                    
                    string role = (string)Session["Role"];
                    string id = Request.QueryString["ID"];
                    string username = Request.QueryString["Username"];
                    if (role == "personal")
                    {
                        
                        getData(id, username);
                        getCV();
                        txtfullnameedit.ReadOnly = true;
                        txtaddressedit.ReadOnly = true;
                        txtphonenumberedit.ReadOnly = true;
                        btnApply.Visible = true;
                    }
                    else
                    {
                        
                        btnApply.Visible = false;
                        getData(id, username);
                        txtfullnameedit.ReadOnly = true;
                        txtaddressedit.ReadOnly = true;
                        txtphonenumberedit.ReadOnly = true;
                        txtmailedit.ReadOnly = true;
                    }
                }
                    
            }    
        }
        public void getData(string id,string username)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == index);
            if(obj != null)
            {
                lbstartdate.Text = String.Format("{0:dd-MM-yyyy}", obj.StartDate);
                lbenddate.Text = String.Format("{0:dd-MM-yyyy}", obj.EndDate);
                lblocation.Text = obj.Location;
                lblanguage.Text = obj.Language;
                lbnumbers.Text = obj.NumPeople;
                lbposition.Text = obj.JobPosition;
                lbRequiredSkill.Text = obj.RequireSkill;
                lbDescription.Text = obj.Description;
                lbsalary.Text = string.Format("{0:#,0}",Convert.ToInt32(obj.Salary)) + " USD";
            }
            AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if(acc != null)
            {
                lbFullname.Text = acc.NameOrganization;
                lbFiled.Text = acc.Field;
                lbEmail.Text = acc.Email;
                lbDetail.Text = acc.Detail;
                if(acc.Url == null)
                {
                    imageAvt.ImageUrl = "../Template/assets/images/users/unknown.jpg";
                }
                else
                {
                    imageAvt.ImageUrl = "../Template/assets/images/organization/" + acc.Url;
                }
                lbAddress.Text = acc.Address;
                lbPhone.Text = acc.Phone;
            }    
        }
        public void getCV()
        {
            string username = (string)Session["Username"];
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                txtfullnameedit.Text = obj.Fullname;
                txtmailedit.Text = obj.Email;
                txtphonenumberedit.Text = obj.Phone;
                txtaddressedit.Text = obj.Address;
                
                
            }


        }

        protected void btnApply_Command(object sender, CommandEventArgs e)
        {
            string id = Request.QueryString["ID"];
            long idJob = Convert.ToInt32(id);
            string usernameO = Request.QueryString["Username"];
            string usernameU = (string)Session["Username"];
            string email = txtmailedit.Text;
            WorkITEntities db = new WorkITEntities();
            Apply obj = db.Applies.FirstOrDefault(x => x.UsernameU == usernameU && x.IDJob == idJob);
            if(obj == null)
            {
                Apply app = new Apply();
                app.IDJob = idJob;
                app.UsernameU = usernameU;
                app.UsernameO = usernameO;
                app.Email = email;
                app.Status = "1";
                if (FuCV.HasFile)
                {
                    string ext = Path.GetFileName(FuCV.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    string fileName = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    FuCV.SaveAs(Server.MapPath("../Template/assets/images/apply/" + fileName));
                    app.ImgCV = fileName;
                }
                db.Applies.Add(app);
                db.SaveChanges();

            }
            else
            {
                obj.IDJob = idJob;
                obj.UsernameU = usernameU;
                obj.UsernameO = usernameO;
                obj.Email = email;
                if (FuCV.HasFile)
                {
                    string ext = Path.GetFileName(FuCV.FileName);
                    ext = ext.Split('.')[ext.Split('.').Length - 1];
                    string fileName = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                    FuCV.SaveAs(Server.MapPath("../Template/assets/images/apply/" + fileName));
                    obj.ImgCV = fileName;
                }
                db.SaveChanges();
            }    
            
        }
    }
}