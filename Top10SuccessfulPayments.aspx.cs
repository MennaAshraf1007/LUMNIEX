using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Top10SuccessfulPayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobile = Session["mobile_num"] as string;
            if (!IsPostBack) // Ensure this logic only runs on the initial load, not on postbacks
            {

                if (!string.IsNullOrEmpty(mobile))
                {
                    // Call the ViewVoucher method with the mobile number
                    ViewPayments(mobile);
                }

            }
        }

        protected void ViewPayments(String mobileNo)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand highest_payments = new SqlCommand("Top_Successful_Payments", conn);
            highest_payments.CommandType = CommandType.StoredProcedure;
            highest_payments.Parameters.Add(new SqlParameter("@mobile_num", mobileNo));
            conn.Open();
            SqlDataReader reader = highest_payments.ExecuteReader();
            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                reader.Close();
                gvPayments.DataSource = dt;
                gvPayments.DataBind();
                conn.Close();
            }
            else
            {
                Message.Text = "there is no payments associated with this account";
            }
        }
    }
}