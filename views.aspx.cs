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
    public partial class views : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //testing out github
        protected void selectView(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            ///2
            if(DropDownList1.SelectedValue == "Customer Profiles + Active Accounts")
            {
              

                conn.Open();

                SqlCommand profiles = new SqlCommand("SELECT * FROM allCustomerAccounts", conn);
                //profiles.CommandType = System.Data.CommandType.Text;

               
                SqlDataReader rdr = profiles.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
                conn.Close();
                //SqlDataReader rdr = profiles.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                //while (rdr.Read())
                //{
                //    string profileID = rdr.GetString(rdr.GetOrdinal("status"));
                //    Label status = new Label();
                //    status.Text = profileID;
                //    form1.Controls.Add(status);
                //}
                Message.Text="Successfully retrieved details for all Customer Profiles and their active accounts..";
            }
            //3
            else if(DropDownList1.SelectedValue == "Physical Stores + Vouchers")
            {
                Message.Text = "Successfully retrieved details for all physical stores and their redeemed vouchers..";

                conn.Open();

                SqlCommand stores = new SqlCommand("Select * from PhysicalStoreVouchers", conn);
                SqlDataReader rdr = stores.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
                conn.Close();
            }
            //4
            else if(DropDownList1.SelectedValue == "Resolved Tickets")
            {
                Message.Text = "Successfully retrieved details for all resolved tickets..";

                conn.Open();

                SqlCommand tickets = new SqlCommand("Select * from allResolvedTickets", conn);
                SqlDataReader rdr = tickets.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
                conn.Close();
            }
            //5 
            else if(DropDownList1.SelectedValue == "Accounts + Subscribed Plans")
            {
                Message.Text = "Successfully retrieved details for all accounts and their subscribed service plans..";

                conn.Open();

                SqlCommand accounts = new SqlCommand("Account_Plan", conn);
                accounts.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader rdr = accounts.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                GridView1.DataSource = rdr;
                GridView1.DataBind();
                conn.Close();

            }
            //clear grid view when not selecting anything
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }

        }
        protected void backToHomepage(object sender, EventArgs e)
        {
            Response.Redirect("admin_homepage.aspx");
        }
    }
}