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
    public partial class E_shops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindShopData();
            }
        }
        private void BindShopData()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM E_shopVouchers";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Dynamically generate shop cards
                while (reader.Read())
                {
                    string shopCard = $@"
                        <div class='shop-card'>
                            <h3>Shop {reader["shopID"]}</h3>
                            <p><strong>Shop ID:</strong> {reader["shopID"]}</p>
                            <p><strong>URL:</strong> {reader["URL"]}</p>
                            <p><strong>Rating:</strong> {reader["rating"]}</p>
                            <p><strong>Voucher ID:</strong> {reader["voucherID"]}</p>
                            <p><strong>Value:</strong> ${reader["value"]}</p>
                        </div>
                    ";
                    shopGrid.InnerHtml += shopCard;
                }
            }
        }
        protected void goback(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            Response.Redirect("admin_homepage.aspx");

        }
       
    }
}