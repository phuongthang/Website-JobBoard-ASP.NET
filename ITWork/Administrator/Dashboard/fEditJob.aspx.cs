using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fEditJob : System.Web.UI.Page
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
                    getComboLocation();
                    getComboLanguage();
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
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == index);
            if(obj != null)
            {
                txtJobTitle.Text = obj.JobTitle;
                txtNumber.Text = obj.NumPeople;
                txtRequiredSkill.Text = obj.RequireSkill;
                txtDescription.Text = obj.Description;
                txtPosition.Text = obj.JobPosition;
                txtSalary.Text = obj.Salary.ToString();
                DropLanguage.SelectedValue = obj.Language;
                DropLocation.SelectedValue = obj.Location;
                txtDateStart.Text = String.Format("{0:yyyy-MM-dd}", obj.StartDate);
                txtDateEnd.Text = String.Format("{0:yyyy-MM-dd}", obj.EndDate);
            }    
        }

        protected void btnSave_Command(object sender, CommandEventArgs e)
        {

           
            string id = Request.QueryString["ID"];
            string username = Request.QueryString["Username"];
            int index = Convert.ToInt32(id);
            string jobtitle = txtJobTitle.Text;
            string jobposition = txtPosition.Text;
            string language = DropLanguage.SelectedValue;
            string location = DropLocation.SelectedValue;
            string salary = txtSalary.Text;
            string number = txtNumber.Text;
            DateTime datestart = Convert.ToDateTime(txtDateStart.Text);
            DateTime dateend = Convert.ToDateTime(txtDateEnd.Text);
            string description = txtDescription.Text;
            string requiredskill = txtRequiredSkill.Text;
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x=>x.ID==index);
            if(obj != null)
            {
                try
                {
                    obj.Location = location;
                    obj.Username = username;
                    obj.JobTitle = jobtitle;
                    obj.StartDate = datestart;
                    obj.EndDate = dateend;
                    obj.JobPosition = jobposition;
                    obj.Language = language;
                    obj.Salary = Convert.ToInt32(salary);
                    obj.NumPeople = number;
                    obj.Description = description;
                    obj.RequireSkill = requiredskill;
                    obj.Active = "0";
                    obj.Main = "0";
                    db.Jobs.AddOrUpdate(obj);
                    db.SaveChanges();
                    pnError.Visible = false;
                    pnSuccess.Visible = true;
                    Response.Redirect("fListJobOverview.aspx");
                }
                catch
                {
                    pnError.Visible = true;
                    pnSuccess.Visible = false;
                }
            }    
            
        }
    }
}