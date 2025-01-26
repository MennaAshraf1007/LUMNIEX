using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class sign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
       protected void login_Admin(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void login_Customer(object sender, EventArgs e)
        {
            Response.Redirect("login_customer.aspx");
        }
    }
}