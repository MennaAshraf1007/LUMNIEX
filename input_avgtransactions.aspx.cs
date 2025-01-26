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
    public partial class input_avgtransactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Click += new EventHandler(this.viewamt);
           
        }
        
        
        protected void viewamt(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int walletID = int.Parse(TextBox1.Text);
            DateTime start = DateTime.Parse(TextBox2.Text);
            DateTime end = DateTime.Parse(TextBox3.Text);

            SqlCommand viewamount = new SqlCommand(" select dbo.Wallet_Transfer_Amount(@walletID,@start_date,@end_date)", conn);
            viewamount.Parameters.Add(new SqlParameter("@walletID", walletID));
            viewamount.Parameters.Add(new SqlParameter("@start_date", start));
            viewamount.Parameters.Add(new SqlParameter("@end_date", end));
            conn.Open();
            object res = viewamount.ExecuteScalar();
            Label1.Text = "Average transaction  Amount :" + res.ToString();

            conn.Close();

        }
    }
}