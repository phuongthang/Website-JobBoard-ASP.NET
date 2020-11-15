using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                WorkITEntities db = new WorkITEntities();
                var Listjob = (from job in db.Jobs
                               select job).ToList();
                DateTime d1 = DateTime.Now;
                foreach (Job obj in Listjob)
                {
                    if (Datediff(Convert.ToDateTime(obj.EndDate), d1) < 0)
                    {
                        obj.Active = "2";
                    }
                }
                db.SaveChanges();
                getDataPinJob();
                getDataPinCV();
                getDgvJob();
                getDgvCV();

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
        public void getDataPinJob()
        {
            DateTime d1 = DateTime.Now;
            WorkITEntities db = new WorkITEntities();
            var Listjob = (from job in db.Jobs
                           where job.Active == "1" && job.Main == "1"
                           select job).ToList();
            rpJobhot.DataSource = Listjob;
            rpJobhot.DataBind();
        }
        
        public double Datediff(DateTime d1, DateTime d2)
        {
            TimeSpan t = d1 - d2;
            double diff = t.TotalDays;
            return diff;
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

        public string getImgCV(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                return acc.Url;
            }
            else
            {
                return "";
            }
        }
        public string getFullNameCV(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                return obj.Fullname;
            }
            else
            {
                return "";
            }
        }
        public string getPositionCV(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Position;
            }
            else
            {
                return "";
            }
        }
        public string getLocationCV(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Location;
            }
            else
            {
                return "";
            }
        }
        public string getLanguageCV(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Language;
            }
            else
            {
                return "";
            }
        }
        public void getDataPinCV()
        {
            WorkITEntities db = new WorkITEntities();
            var Listjob = (from cv in db.CVs
                           where cv.Pin == "1"
                           select cv).ToList();
            rpCVhot.DataSource = Listjob;
            rpCVhot.DataBind();
        }
        protected void btnSearch_Command(object sender, CommandEventArgs e)
        {
            string search = txtsearch.Text;
            WorkITEntities db = new WorkITEntities();
            var listjob = (from job in db.Jobs
                           select job);
            if(!String.IsNullOrEmpty(search))
            {
                listjob = listjob.Where(x => x.Location.Contains(search) || x.Language.Contains(search) || x.JobPosition.Contains(search) || x.JobTitle.Contains(search) || x.Username.Contains(search));
            }    
            dgvJob.DataSource = listjob.ToList();
            dgvJob.DataBind();
            txtsearch.Text = "";
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
        protected void DropChoose_SelectedIndexChanged(object sender, EventArgs e)
        {

            string choose = DropChoose.SelectedValue;
            if(choose == "All")
            {
                DropChoosee.SelectedValue = "All";
                getDgvJob();
            }    
            else if(choose == "Language")
            {
                getComboLanguage();
                getDgvJob();
            }
            else if(choose == "Location")
            {
                getComboLocation();
                getDgvJob();
            }
            else if(choose == "Salary")
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
            if(val == "All")
            {
                getDgvJob();
            }    
            else if(val == "< 499")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary < 500
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if(val == "500 - 999")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >=500 && job.Salary <1000
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if(val == "1000 - 1499")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 1000 &&job.Salary < 1500
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if(val == "1500 - 2499")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 1500 && job.Salary < 2500
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if(val == "2500 - 4999")
            {
                WorkITEntities db = new WorkITEntities();
                var listjob = (from job in db.Jobs
                               where job.Salary >= 2500 && job.Salary < 5000
                               orderby job.ID descending
                               select job).ToList();
                dgvJob.DataSource = listjob;
                dgvJob.DataBind();
            }
            else if(val == "> 5000")
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
            if(choose == "Language")
            {
                getDataLanguage();
            }
            else if(choose == "Location")
            {
                getDataLocation();
            }
            else if(choose == "Salary")
            {
                getDataSalary();
            }    
        }



        public string getImgCVU(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                return acc.Url;
            }
            else
            {
                return "";
            }
        }
        public string getFullNameCVU(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                return obj.Fullname;
            }
            else
            {
                return "";
            }
        }
        public string getPositionCVU(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Position;
            }
            else
            {
                return "";
            }
        }
        public string getLocationCVU(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Location;
            }
            else
            {
                return "";
            }
        }
        public string getLanguageCVU(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Language;
            }
            else
            {
                return "";
            }
        }
        public void getDgvCV()
        {
            WorkITEntities db = new WorkITEntities();
            var Listcv = (from cv in db.CVs
                           orderby cv.ID descending
                           select cv).ToList();
            dgvCV.DataSource = Listcv;
            dgvCV.DataBind();
        }

        protected void btnSearchCV_Command(object sender, CommandEventArgs e)
        {
            string searchCV = txtsearchCV.Text;
            WorkITEntities db = new WorkITEntities();
            var listcv = (from cv in db.CVs
                           select cv);
            if (!String.IsNullOrEmpty(searchCV))
            {
                listcv = listcv.Where(x => x.Location.Contains(searchCV) || x.Language.Contains(searchCV) || x.Position.Contains(searchCV));
            }
            dgvCV.DataSource = listcv.ToList();
            dgvCV.DataBind();
            txtsearchCV.Text = "";
        }

        public void getComboLanguageCV()
        {
            WorkITEntities db = new WorkITEntities();
            List<Language> lang = db.Languages.ToList();
            DropChooseeCV.DataSource = lang;
            DropChooseeCV.DataValueField = "Languages";
            DropChooseeCV.DataTextField = "Languages";
            DropChooseeCV.DataBind();

        }
        public void getComboLocationCV()
        {
            WorkITEntities db = new WorkITEntities();
            List<City> city = db.Cities.ToList();
            DropChooseeCV.DataSource = city;
            DropChooseeCV.DataValueField = "City1";
            DropChooseeCV.DataTextField = "City1";
            DropChooseeCV.DataBind();

        }

        public void getDataLanguageCV()
        {
            string val = DropChooseeCV.SelectedValue;
            if (val == "All")
            {
                getDgvCV();
            }
            else
            {
                WorkITEntities db = new WorkITEntities();
                var listcv = (from cv in db.CVs
                               where cv.Language == val
                               orderby cv.ID descending
                               select cv).ToList();
                dgvCV.DataSource = listcv;
                dgvCV.DataBind();
            }

        }

        public void getDataLocationCV()
        {
            string val = DropChooseeCV.SelectedValue;
            if (val == "All")
            {
                getDgvCV();
            }
            else
            {
                WorkITEntities db = new WorkITEntities();
                var listcv = (from cv in db.CVs
                               where cv.Location == val
                               orderby cv.ID descending
                               select cv).ToList();
                dgvCV.DataSource = listcv;
                dgvCV.DataBind();
            }

        }
        protected void DropChooseeCV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string choose = DropChooseCV.SelectedValue;
            if (choose == "Language")
            {
                getDataLanguageCV();
            }
            else if (choose == "Location")
            {
                getDataLocationCV();
            }
        }

        protected void DropChooseCV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string choose = DropChooseCV.SelectedValue;
            if (choose == "All")
            {
                DropChoosee.SelectedValue = "All";
                getDgvCV();
            }
            else if (choose == "Language")
            {
                getComboLanguageCV();
                getDgvCV();
            }
            else if (choose == "Location")
            {
                getComboLocationCV();
                getDgvCV();
            }
        }
    }
}