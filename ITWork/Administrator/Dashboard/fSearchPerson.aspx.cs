using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fSearchPerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDgvCV();

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
                DropChooseeCV.SelectedValue = "All";
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