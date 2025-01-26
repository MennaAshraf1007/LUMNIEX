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
    public partial class cashwalletplan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Click += new EventHandler(this.viewamount);
            
        }
        
        protected void viewamount(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int walletID = Convert.ToInt32(TextBox1.Text);
            int planID = Convert.ToInt32(TextBox1.Text);
            string query1 = "SELECT COUNT(*) FROM wallet WHERE walletID = @walletID";
            string query2 = "SELECT COUNT(*) FROM Service_plan WHERE planID = @planID";
            // Check if the number exists


            SqlCommand cmd = new SqlCommand(query1, conn);
            SqlCommand cmd1 = new SqlCommand(query2, conn);
            // Add the parameter to prevent SQL injection
            cmd.Parameters.Add(new SqlParameter("@walletID", walletID));
            cmd1.Parameters.Add(new SqlParameter("@planID", planID));

            conn.Open();
            object result = cmd.ExecuteScalar(); // ExecuteScalar returns an object
            object result2 = cmd1.ExecuteScalar();
            // Check if result is null or DBNull before casting
            int count = result != null && result != DBNull.Value ? Convert.ToInt32(result) : 0;
            int count2 = result2 != null && result2 != DBNull.Value ? Convert.ToInt32(result2) : 0;
            if (count > 0 && count2 > 0)
            {

                SqlCommand viewamt = new SqlCommand("select dbo.Wallet_Cashback_Amount(@walletID,@planID)", conn);
                viewamt.Parameters.Add(new SqlParameter("@walletID", walletID));
                viewamt.Parameters.Add(new SqlParameter("@planID", planID));

                
                object res = viewamt.ExecuteScalar();
                Label1.Text = "Cashback Amount :" + res.ToString();
                
            }


            else
            {
                Response.Write("Please enter a valid walletID or planID");
            }
            conn.Close();

        }
    }
}