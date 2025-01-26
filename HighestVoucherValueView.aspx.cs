using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class HighestVoucherValueView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensure this logic only runs on the initial load, not on postbacks
            {
                string mobile = Session["mobile_num"] as string;

                if (!string.IsNullOrEmpty(mobile))
                {
                    // Call the ViewVoucher method with the mobile number
                    ViewVoucher(mobile);
                }
               
            }
        }


        protected void ViewVoucher(string mobileNumber)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand highest_voucher = new SqlCommand("Account_Highest_Voucher", conn);
                highest_voucher.CommandType = CommandType.StoredProcedure;
                highest_voucher.Parameters.Add(new SqlParameter("@mobile_num", mobileNumber));

                conn.Open();
                SqlDataReader reader = highest_voucher.ExecuteReader();
                if (reader.HasRows) { 
                DataTable dt = new DataTable();
                dt.Load(reader);
                reader.Close();

                gvVoucher.DataSource = dt;
                gvVoucher.DataBind();
                    conn.Close();
                }
                else
                {
                    lblError.Text = "No vouchers are associated with this account";
                }
            }
        }


    }
}