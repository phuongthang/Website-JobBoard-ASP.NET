using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fDetailCV : System.Web.UI.Page
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
                    getData(id, username);
                }
            }
        }
        public void getData(string id, string username)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                lbbirthday.Text = String.Format("{0:dd-MM-yyyy}", obj.Birthday);
                lblocation.Text = obj.Location;
                lblanguage.Text = obj.Language;
                lbposition.Text = obj.Position;
                lbExperience.Text = obj.Skill;
                lbSkill.Text = obj.Experience;
                imgCV.ImageUrl = "../Template/assets/images/CV/" + obj.ImgCV;
            }
            AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                lbFullname.Text = acc.Fullname;
                lbNickname.Text = acc.Position;
                lbEmail.Text = acc.Email;
                lbDetail.Text = acc.Detail;
                if (acc.Url == null)
                {
                    imageAvt.ImageUrl = "../Template/assets/images/users/unknown.jpg";
                }
                else
                {
                    imageAvt.ImageUrl = "../Template/assets/images/person/" + acc.Url;
                }
                lbAddress.Text = acc.Address;
                lbPhone.Text = acc.Phone;
            }
        }
        
    }
}