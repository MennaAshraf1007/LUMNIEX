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
    public partial class admin_homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Session["user"]);
            

        }
        protected void view(object sender, EventArgs e)
        {
            //redirect to page with options of views to see
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the views page");
            Response.Redirect("views.aspx");
        }

        protected void list(object sender, EventArgs e)
        {
            //redirect to page with options of lists to see
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the lists page");
            Response.Redirect("lists.aspx");
        }

        protected void takeAction(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the actions page");
            Response.Redirect("actions.aspx");

        }
        protected void gocashback(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the CashBack page");
            Response.Redirect("cashback.aspx");

        }
        protected void goE_shops(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the E_Shops page");
            Response.Redirect("E_Shops.aspx");

        }
        protected void goadminpt2(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the Wallets page");
            Response.Redirect("Adminpt2.aspx");

        }
        protected void goPayments(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the Payments page");
            Response.Redirect("payments.aspx");

        }
        protected void Gocheckwallet(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to checking accounts wallets page");
            Response.Redirect("checkwallet.aspx");

        }
        protected void gotransactions(object sender, EventArgs e)
        {
           
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the transactions page");
            Response.Redirect("input_for_transactions.aspx");

        }

        protected void gocashbackwallet(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the view the cashback for your chosen account ");
            Response.Redirect("cashwalletplan.aspx");

        }

        protected void goavgtransactions(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to the view the average transactions for your chosen account");
            Response.Redirect("input_avgtransactions.aspx");

        }
        protected void goupdatepts(object sender, EventArgs e)
        {
            //redirect to page with actions to take (remove, add,etc)
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Write("Taking you to  update the points for your chosen account ");
            Response.Redirect("updatepoints.aspx");

        }

        protected void goactions(object sender, EventArgs e)
        {

            Response.Redirect("actions2.aspx");

        }


    }
}