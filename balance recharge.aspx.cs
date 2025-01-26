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
    public partial class balance_recharge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobile = Session["mobile_num"] as string;
        }
        protected void recharge_balance(object sender, EventArgs e)
        {
            try
            {
                String mobileno = Session["mobile_num"] as string;
                int amount = Int32.Parse(TextBox2.Text);
                string paymethod = TextBox3.Text;
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();


                    SqlCommand ser = new SqlCommand("Initiate_balance_payment", conn);
                    ser.CommandType = CommandType.StoredProcedure;
                    ser.Parameters.Add(new SqlParameter("@mobile_num", mobileno));
                    ser.Parameters.Add(new SqlParameter("@amount", amount));
                    ser.Parameters.Add(new SqlParameter("@payment_method", paymethod));



                    int rowsAffected = ser.ExecuteNonQuery();

                    // Display success or failure message
                    if (rowsAffected > 0)
                    {
                        ResultLabel.Text = "balance recharged successfully!";
                    }
                    else
                    {
                        ResultLabel.Text = " ";
                    }
                }
            }
            catch (Exception ex)
            {
                // Display error message
                ResultLabel.Text = "Error: " + ex.Message;
            }
        }
    }
}
    
