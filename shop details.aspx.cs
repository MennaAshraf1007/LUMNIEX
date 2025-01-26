using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication1
{
    public partial class shop_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void allshop_SelectedIndexChanged(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string query = "select*from allshops";
            SqlCommand ser = new SqlCommand(query, conn);

            conn.Open();


            // Create a DataTable to hold the data
            DataTable dt = new DataTable();
            dt.Columns.Add("name");
            dt.Columns.Add("shopID");
            dt.Columns.Add("Category");

            SqlDataReader reader = ser.ExecuteReader();
            Table shop = new Table();


            while (reader.Read())
            {
                DataRow row = dt.NewRow();
                row["name"] = reader["name"];
                row["shopID"] = reader["shopID"];
                row["Category"] = reader["Category"];
                dt.Rows.Add(row);

            }
            allshop.DataSource = dt;
            allshop.DataBind();

            // Close the connection
            conn.Close();
            conn.Close();
        }
    }
}