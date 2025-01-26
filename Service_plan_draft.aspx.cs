using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Service_plan_draft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Consume(object sender, EventArgs e)
        {
            Response.Redirect("plan_view.aspx");

        }

        protected void otherplan(object sender, EventArgs e)
        {
            Response.Redirect("other_plans.aspx");
        }

        protected void active(object sender, EventArgs e)
        {
            Response.Redirect("Active_plans.aspx");
        }
        protected void alloffered(object sender, EventArgs e)
        {
            Response.Redirect("Service_plans.aspx");
        }
      

    }
}