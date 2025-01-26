using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBM3
{
    public partial class updatepoints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Click += new EventHandler(this.updatepts);
           
        }
       
        protected void updatepts(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
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
                SqlCommand update = new SqlCommand("Total_Points_Account", conn);
                update.CommandType = System.Data.CommandType.StoredProcedure;
                update.Parameters.AddWithValue("mobile_num", mobile);

                update.ExecuteNonQuery();
                Message.Text="Updated Succesfully!";
                conn.Close();

            }
            else
            {
                Message.Text="Please enter a valid mobile number";
            }
        }
    }
}
