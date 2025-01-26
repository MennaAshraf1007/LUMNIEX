using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class service_plane_last_5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



     

        protected void service_plan_past_5_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            String mobilenum = mobileno.Text;
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string query = "SELECT * from DBO.Subscribed_plans_5_Months(@MobileNo)";
            SqlCommand ser = new SqlCommand(query, conn);

            ser.Parameters.Add(new SqlParameter("@MobileNo", mobilenum));
            conn.Open();
            SqlDataReader reader = ser.ExecuteReader();

            Table table = new Table();
            table.CssClass = "dynamic-table"; // Add CSS class for styling

            // Add table header
            TableHeaderRow headerRow = new TableHeaderRow();
            headerRow.Cells.Add(new TableHeaderCell { Text = "Plan ID" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Name" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Price" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "SMS Offered" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Minutes Offered" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Data Offered" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Description" });
            table.Rows.Add(headerRow);

            // Populate table rows with data
            while (reader.Read())
            {
                TableRow row = new TableRow();

                // Add cells for each column
                row.Cells.Add(new TableCell { Text = reader["planID"].ToString() });
                row.Cells.Add(new TableCell { Text = reader["name"].ToString() });
                row.Cells.Add(new TableCell { Text = reader["price"].ToString() });
                row.Cells.Add(new TableCell { Text = reader["SMS_offered"].ToString() });
                row.Cells.Add(new TableCell { Text = reader["minutes_offered"].ToString() });
                row.Cells.Add(new TableCell { Text = reader["data_offered"].ToString() });
                row.Cells.Add(new TableCell { Text = reader["description"].ToString() });

                table.Rows.Add(row);
            }

            DynamicTablePlaceholder.Controls.Add(table);
            conn.Close();


        }

    }
    }
