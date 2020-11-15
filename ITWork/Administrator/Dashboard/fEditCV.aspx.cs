using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fEditCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] == null || Request.QueryString["Username"] == null)
                {

                }
                else
                {
                    string id = Request.QueryString["ID"];
                    string username = Request.QueryString["Username"];
                    getComboLanguage();
                    getComboLocation();
                    getData(id, username);
                    pnError.Visible = false;
                    pnSuccess.Visible = false;
                }
            }
        }
        public void getComboLanguage()
        {
            WorkITEntities db = new WorkITEntities();
            List<Language> lang = db.Languages.Where(x => x.ID > 1).ToList();
            DropLanguage.DataSource = lang;
            DropLanguage.DataValueField = "Languages";
            DropLanguage.DataTextField = "Languages";
            DropLanguage.DataBind();

        }
        public void getComboLocation()
        {
            WorkITEntities db = new WorkITEntities();
            List<City> city = db.Cities.Where(x => x.ID > 1).ToList();
            DropLocation.DataSource = city;
            DropLocation.DataValueField = "City1";
            DropLocation.DataTextField = "City1";
            DropLocation.DataBind();

        }
        public void getData(string id, string username)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                txtExperience.Text = obj.Experience;
                txtSkill.Text = obj.Skill;
                txtPosition.Text = obj.Position;
                DropLanguage.SelectedValue = obj.Language;
                DropLocation.SelectedValue = obj.Location;
                txtBirthday.Text = String.Format("{0:yyyy-MM-dd}", obj.Birthday);
                imgCV.ImageUrl = "../Template/assets/images/CV/" + obj.ImgCV;
            }
        }

        protected void btnSave_Command(object sender, CommandEventArgs e)
        {
            string username = (string)Session["username"];
            string jobposition = txtPosition.Text;
            string language = DropLanguage.SelectedValue;
            string location = DropLocation.SelectedValue;
            DateTime birthday = Convert.ToDateTime(txtBirthday.Text);
            string experience = txtExperience.Text;
            string skill = txtSkill.Text;
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.Username == username);
            if(obj != null)
            {
                try
                {
                    obj.Location = location;
                    obj.Username = username;
                    obj.Birthday = birthday;
                    obj.Position = jobposition;
                    obj.Language = language;
                    obj.Experience = experience;
                    obj.Skill = skill;
                    obj.Pin = "0";
                    if (FuCV.HasFile)
                    {
                        string ext = Path.GetFileName(FuCV.FileName);
                        ext = ext.Split('.')[ext.Split('.').Length - 1];
                        string fileName = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                        FuCV.SaveAs(Server.MapPath("../Template/assets/images/CV/" + fileName));
                        obj.ImgCV = fileName;
                    }
                    db.CVs.AddOrUpdate(obj);
                    db.SaveChanges();
                    pnSuccess.Visible = true;
                    Response.Redirect("fListCVOverview.aspx");
                }
                catch
                {
                    pnError.Visible = true;
                    pnSuccess.Visible = false;
                }
            }    
            
        }

        protected void btnCancel_Command(object sender, CommandEventArgs e)
        {

        }
    }
}