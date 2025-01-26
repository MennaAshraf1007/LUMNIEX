using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBM3
{
    public partial class payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //Button1.Click += new EventHandler(this.goback);
           

        }
        protected void goback(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            Response.Redirect("admin_homepage.aspx");

        }
       
    }
}