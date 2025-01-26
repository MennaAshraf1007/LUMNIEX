using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class actions2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void goupdatepts(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to  update the points for your chosen account ");
            Response.Redirect("updatepoints.aspx");

        }
        protected void goavgtransactions(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the view the average transactions for your chosen account");
            Response.Redirect("input_avgtransactions.aspx");

        }
        protected void gocashbackwallet(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the view the cashback for your chosen account ");
            Response.Redirect("cashwalletplan.aspx");

        }
        protected void gotransactions(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the transactions page");
            Response.Redirect("input_for_transactions.aspx");

        }
        protected void Gocheckwallet(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to checking accounts wallets page");
            Response.Redirect("checkwallet.aspx");

        }
    }
}