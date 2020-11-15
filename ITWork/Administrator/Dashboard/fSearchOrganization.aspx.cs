using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fSearchOrganization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDgvJob();

            }
        }
        public void getComboLocation()
        {
            WorkITEntities db = new WorkITEntities();
            List<City> city = db.Cities.ToList();
            DropChoosee.DataSource = city;
            DropChoosee.DataValueField = "City1";
            DropChoosee.DataTextField = "City1";
            DropChoosee.DataBind();

        }
        public void getComboSalary()
        {
            WorkITEntities db = new WorkITEntities();
            List<Salary> salary = db.Salaries.ToList();
            DropChoosee.DataSource = salary;
            DropChoosee.DataValueField = "Salary1";
            DropChoosee.DataTextField = "Salary1";
            DropChoosee.DataBind();

        }
        public void getComboLanguage()
        {
            WorkITEntities db = new WorkITEntities();
            List<Language> lang = db.Languages.ToList();
            DropChoosee.DataSource = lang;
            DropChoosee.DataValueField = "Languages";
            DropChoosee.DataTextField = "Languages";
            DropChoosee.DataBind();

        }
        protected void DropChoose_SelectedIndexChanged(object sender, EventArgs e)
        {

            string choose = DropChoose.SelectedValue;
            if (choose == "All")
            {
                DropChoosee.SelectedValue = "All";
                getDgvJob();
            }
            else if (choose == "Language")
            {
                getComboLanguage();
                getDgvJob();
            }
            else if (choose == "Location")
            {
                getComboLocation();
                getDgvJob();
            }
            else if (choose == "Salary")
            {
                getComboSalary();
                getDgvJob();
            }
        }

        public void getDataLanguage()
        {
            string val = DropChoosee.SelectedValue;
            if (val == "All")
            {
                getDgvJob();
            }
            else
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Language == val
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }

        }

        public void getDataLocation()
        {
            string val = DropChoosee.SelectedValue;
            if (val == "All")
            {
                getDgvJob();
            }
            else
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Location == val
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }

        }
        public void getDataSalary()
        {
            string val = DropChoosee.SelectedValue;
            if (val == "All")
            {
                getDgvJob();
            }
            else if (val == "< 499")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary < 500
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if (val == "500 - 999")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 500 && job.Salary < 1000
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if (val == "1000 - 1499")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 1000 && job.Salary < 1500
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if (val == "1500 - 2499")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 1500 && job.Salary < 2500
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if (val == "2500 - 4999")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 2500 && job.Salary < 5000
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if (val == "> 5000")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 5000
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }

        }
        protected void DropChoosee_SelectedIndexChanged(object sender, EventArgs e)
        {
            string choose = DropChoose.SelectedValue;
            if (choose == "Language")
            {
                getDataLanguage();
            }
            else if (choose == "Location")
            {
                getDataLocation();
            }
            else if (choose == "Salary")
            {
                getDataSalary();
            }
        }
        public string getImgJob(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                return acc.Url;
            }
            else
            {
                return "";
            }
        }
        public string getJobTitleJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.JobTitle;
            }
            else
            {
                return "";
            }
        }
        public string getPositionJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.JobPosition;
            }
            else
            {
                return "";
            }
        }
        public string getLocationJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Location;
            }
            else
            {
                return "";
            }
        }
        public string getLanguageJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Language;
            }
            else
            {
                return "";
            }
        }
        public string getJobSalaryJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Salary.ToString();
            }
            else
            {
                return "";
            }
        }
        public string getJobNumberJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.NumPeople;
            }
            else
            {
                return "";
            }
        }
        public string getStatusJob(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                if (obj.Active == "0")
                {
                    return "Processing";
                }
                else
                {
                    return "Active";
                }
            }
            else
            {
                return "";
            }
        }
        public string getPhoneJob(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                return acc.Phone;
            }
            else
            {
                return "";
            }
        }
        public void getDgvJob()
        {

            WorkITEntities db = new WorkITEntities();
            var Listjob = (from job in db.Jobs
                           where job.Active == "1"
                           orderby job.ID descending
                           select job).ToList();
            dgvJob.DataSource = Listjob;
            dgvJob.DataBind();
        }

        protected void btnSearch_Command(object sender, CommandEventArgs e)
        {
            string search = txtsearch.Text;
            WorkITEntities db = new WorkITEntities();
            var listjob = (from job in db.Jobs
                           select job);
            if (!String.IsNullOrEmpty(search))
            {
                listjob = listjob.Where(x => x.Location.Contains(search) || x.Language.Contains(search) || x.JobPosition.Contains(search) || x.JobTitle.Contains(search) || x.Username.Contains(search));
            }
            dgvJob.DataSource = listjob.ToList();
            dgvJob.DataBind();
            txtsearch.Text = "";
        }
    }
}