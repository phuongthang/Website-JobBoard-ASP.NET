using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fViewCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] == null)
                {

                }
                else
                {
                    string id = Request.QueryString["ID"];
                    int index = Convert.ToInt32(id);
                    WorkITEntities db = new WorkITEntities();
                    Apply app = db.Applies.FirstOrDefault(x => x.ID == index);
                    if(app != null)
                    {
                        imgCV.ImageUrl = "../Template/assets/images/apply/" + app.ImgCV;
                    }    
                }
            }
        }
    }
}