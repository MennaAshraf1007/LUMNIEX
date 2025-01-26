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
    public partial class lists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void backToHomepage(object sender, EventArgs e)
        {
            Response.Redirect("admin_homepage.aspx");
        }
        protected void selectedList(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (DropDownList2.SelectedValue == "Accounts subscribed to a plan")
            {
                Input1.Text = "Input Plan ID and";
                Input2.Text = "Input Date";

                //int id = Int16.Parse(planID.Text);
                //DateTime subDate = DateTime.Parse(DateORacc.Text);

                execAccPlanDate(sender,e);
                
            }
            else if (DropDownList2.SelectedValue == "SMS offers of an account")
            {
                Input1.Text = "Input Account Mobile Number and ";
                Input2.Text = "Input Account ID";

                execAccSMS(sender, e);
            }
            else if(DropDownList2.SelectedValue == "Account Total Usage on All Subscribed Plans")
            {
                Input1.Text = "Input Account Mobile Number and";
                Input2.Text = "Input Date";
                execAccUsagePlan(sender, e);
            }
            else
            {
                Input1.Visible = false;
                Input2.Visible = false;
                Button1.Visible = false;
                planID.Visible = false;
                DateORacc.Visible = false;
                GridView2.DataSource = null;
                GridView2.DataBind();
            }
        }
        protected void execAccPlanDate(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            planID.Visible = true;
            DateORacc.Visible = true;
            Input1.Visible = true;
            Input2.Visible = true;
            Button1.Visible = true;
            string date = DateORacc.Text;
            string planid = planID.Text;
            GridView2.DataSource = null;
            GridView2.DataBind();
            //if (date != "" && planid != "")
            //{
            //    string tvfCMD = "select * from dbo.Account_Plan_date('" + date + "'," + planid + ")";
            //    //string tvfCMD = "select * from dbo.Account_Plan_date('2023-06-15',1)";

            //    SqlCommand accounts = new SqlCommand(tvfCMD, conn);

            //    //accounts.CommandType = System.Data.CommandType.StoredProcedure;
            //    SqlDataReader rdr = accounts.ExecuteReader();
            //    GridView2.DataSource = rdr;
            //    GridView2.DataBind();
            //}
            DateORacc.Text = "";
            planID.Text = "";
            conn.Close();
        }
        protected void execAccSMS(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            planID.Visible = true;
            DateORacc.Visible = false;
            Input1.Visible = true;
            Input2.Visible = false;
            Button1.Visible = true;
            string mobileNo = planID.Text;
            GridView2.DataSource = null;
            GridView2.DataBind();
            //if (mobileNo != "")
            //{
            //    string tvfCMD = "select * from dbo.Account_SMS_Offers ('" + mobileNo + "')";
            //    //string tvfCMD = "select * from dbo.Account_SMS_Offers ('12345678901')";

            //    SqlCommand offers = new SqlCommand(tvfCMD, conn);

            //    //accounts.CommandType = System.Data.CommandType.StoredProcedure;
            //    SqlDataReader rdr = offers.ExecuteReader();
            //    GridView2.DataSource = rdr;
            //    GridView2.DataBind();
            //}
            planID.Text = "";
            conn.Close();
        }
        protected void execAccUsagePlan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            planID.Visible = true;
            DateORacc.Visible = true;
            Input1.Visible = true;

            Input2.Visible = true;

            Button1.Visible = true;
            string mobileNo = planID.Text;
            string from_date = DateORacc.Text;
            GridView2.DataSource = null;
            GridView2.DataBind();
            planID.Text = "";
            conn.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Input1.Text == "Input Plan ID" && Input2.Text == "Input Date") {//6
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string date = DateORacc.Text;
                string planid = planID.Text;
                string tvfCMD = "select * from dbo.Account_Plan_date('" + date + "'," + planid + ")";
                //string tvfCMD = "select * from dbo.Account_Plan_date('2023-06-15',1)";

                SqlCommand accounts = new SqlCommand(tvfCMD, conn);
                    try
                    {
                        //accounts.CommandType = System.Data.CommandType.StoredProcedure;
                        SqlDataReader rdr = accounts.ExecuteReader();
                        GridView2.DataSource = rdr;
                        GridView2.DataBind();
                    Message.Text = "Listing all customer accounts subscribed to the given plan on the given date...";

                }
                catch (System.Data.SqlClient.SqlException)
                    {
                        Message.Text="<br/>Plan ID must be a number less than 11 digits and Date must be in the form 'YYYY-MM-DD'";
                    }
                conn.Close();
            }
            else if(Input1.Text == "Input Account Mobile Number" && Input2.Text == "Input Account ID")
            {//9
                
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string mobileNo = planID.Text;
                string tvfCMD = "select * from dbo.Account_SMS_Offers ('" + mobileNo + "')";
                //string tvfCMD = "select * from dbo.Account_SMS_Offers ('12345678901')";

                SqlCommand offers = new SqlCommand(tvfCMD, conn);
                try
                {
                    //accounts.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlDataReader rdr = offers.ExecuteReader();
                    GridView2.DataSource = rdr;
                    GridView2.DataBind();
                    Message.Text="Listing all SMS offers for the given account...";

                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Message.Text="<br/>mobile number must be an 11 digit number";

                }
                conn.Close();

            }
            else if(Input1.Text =="Input Account Mobile Number" && Input2.Text == "Input Date")
            {//7
                
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                string mobileNo = planID.Text;
                string date = DateORacc.Text;
                string tvfCMD = "select * from dbo.Account_Usage_Plan ('" + mobileNo + "','"+date+"')";
                //string tvfCMD = select * from dbo.Account_Usage_Plan ('01234567895', '2023-05-01');

                SqlCommand usage = new SqlCommand(tvfCMD, conn);
                try
                {
                    //accounts.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlDataReader rdr = usage.ExecuteReader();
                    GridView2.DataSource = rdr;
                    GridView2.DataBind();
                    Message.Text = "Listing total usage on all subscribed plans for the given account and from the given date...";
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Message.Text = "<br/>mobile number must be an 11 digit number and Date must be in the form 'YYYY-MM-DD'";

                }
                conn.Close();

            }
            else
            {
                Input1.Visible = false;
                Input2.Visible = false;
                Button1.Visible = false;
                planID.Visible = false;
                DateORacc.Visible = false;
                GridView2.DataSource = null;
                GridView2.DataBind();
            }

        }
    }
}