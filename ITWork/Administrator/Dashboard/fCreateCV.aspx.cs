using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fCreateCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                pnError.Visible = false;
                pnSuccess.Visible = false;
                getComboLanguage();
                getComboLocation();
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
            CV obj = new CV();
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
                db.CVs.Add(obj);
                db.SaveChanges();
                pnSuccess.Visible = true;
                Response.Redirect("fListCVOverView.aspx");
            }
            catch
            {
                pnError.Visible = true;
                pnSuccess.Visible = false;
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
        protected void btnCancel_Command(object sender, CommandEventArgs e)
        {

        }
    }
}