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
    public partial class checkwallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Click += new EventHandler(this.checkifwallet);

        }

        protected void checkifwallet(object sender, EventArgs e)
        {


            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string mobile = TextBox1.Text;
            string query = "SELECT COUNT(*) FROM customer_account WHERE mobileNo = @mobileNo";

            // Check if the number exists


            SqlCommand cmd = new SqlCommand(query, conn);

            // Add the parameter to prevent SQL injection
            cmd.Parameters.Add(new SqlParameter("@mobileNo", mobile));


            conn.Open();
            object result = cmd.ExecuteScalar(); // ExecuteScalar returns an object

            // Check if result is null or DBNull before casting
            int count = result != null && result != DBNull.Value ? Convert.ToInt32(result) : 0;

            if (count > 0)
            {
                // Use SELECT to call the SQL function
                SqlCommand Checkwallet = new SqlCommand("SELECT dbo.Wallet_MobileNo(@mobile_num)", conn);
                Checkwallet.Parameters.Add(new SqlParameter("@mobile_num", mobile));


                object res = Checkwallet.ExecuteScalar();




                if (res is bool bitValue)
                {
                    Message.Text = "The mobile number is linked to a wallet";
                }
                else
                {
                    Message.Text = "The mobile number is not linked to a wallet";
                }
                conn.Close();
            }
            else
            {

                Message.Text = "The mobile number is not there";

            }
        }
    }
}