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
    public partial class input_for__transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Click += new EventHandler(this.gettransactions);
            
        }
       
        protected void gettransactions(object sender, EventArgs e)
        {
            string mobileNumber = TextBox1.Text.Trim();





            // Define the database connection string (from Web.config)
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();

            // SQL query to check if the mobile number exists
            string query = "SELECT COUNT(*) FROM customer_account WHERE mobileNo = @mobileNo";

            // Check if the number exists
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand(query, conn);

            // Add the parameter to prevent SQL injection
            cmd.Parameters.Add(new SqlParameter("@mobileNo", mobileNumber));


            conn.Open();
            object result = cmd.ExecuteScalar(); // ExecuteScalar returns an object

            // Check if result is null or DBNull before casting
            int count = result != null && result != DBNull.Value ? Convert.ToInt32(result) : 0;
            // Get the count of matching rows

            if (count > 0)
            {
                GridView1.DataBind();
            }
            else
            {
                Response.Write("Please enter a valid mobile number");

            }
            conn.Close();



        }
        }


    }
    


