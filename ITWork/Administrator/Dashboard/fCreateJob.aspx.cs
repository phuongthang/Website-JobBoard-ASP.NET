using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fCreateJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                pnSuccess.Visible = false;
                pnError.Visible = false;
                getComboLanguage();
                getComboLocation();
            }    
        }
        public void getComboLanguage()
        {
            WorkITEntities db = new WorkITEntities();
            List<Language> lang = db.Languages.Where(x=>x.ID >1).ToList();
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
            Response.Redirect("Home.aspx");
        }

        protected void btnSave_Command(object sender, CommandEventArgs e)
        {
            string username = (string)Session["username"];
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
            Job obj = new Job();
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
                db.Jobs.Add(obj);
                db.SaveChanges();
                pnSuccess.Visible = true;
                Response.Redirect("fListJobOverView.aspx");
            }
            catch
            {
                pnError.Visible = true;
                pnSuccess.Visible = false;
            }
        }
    }
}