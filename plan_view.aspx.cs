using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class plan_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic (if any)
        }

        protected void Show_plan_consumption(object sender, EventArgs e)
        {
            string plan = id_input.Text;
            DateTime startDate = startcalendar.SelectedDate;
            DateTime enddate = endcalendar.SelectedDate;

            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand validatePlan = new SqlCommand(
                   "SELECT COUNT(*) FROM Service_Plan WHERE name = @plan_name", conn);
            validatePlan.Parameters.Add(new SqlParameter("@plan_name", plan));

            conn.Open();
            int idCount = (int)validatePlan.ExecuteScalar(); // Check if the plan exists

            if (idCount > 0)
            {
                string query = "SELECT * from DBO.Consumption(@Plan_name,@start_date,@end_date)";
                SqlCommand ser = new SqlCommand(query, conn);

                ser.Parameters.Add(new SqlParameter("@Plan_name", plan));
                ser.Parameters.Add(new SqlParameter("@start_date", startDate));
                ser.Parameters.Add(new SqlParameter("@end_date", enddate));
                SqlDataReader reader = ser.ExecuteReader();

                Table table = new Table();
                table.CssClass = "dynamic-table"; // Add CSS class for styling

                TableHeaderRow headerRow = new TableHeaderRow();
                headerRow.Cells.Add(new TableHeaderCell { Text = "Data Consumption" });
                headerRow.Cells.Add(new TableHeaderCell { Text = "Minutes Used" });
                headerRow.Cells.Add(new TableHeaderCell { Text = "SMS" });

                table.Rows.Add(headerRow);

                // Populate table rows with data
                while (reader.Read())
                {
                    TableRow row = new TableRow();

                    // Add cells for each column
                    row.Cells.Add(new TableCell { Text = reader["data_consumption"].ToString() });
                    row.Cells.Add(new TableCell { Text = reader["minutes_used"].ToString() });
                    row.Cells.Add(new TableCell { Text = reader["SMS_sent"].ToString() });

                    table.Rows.Add(row);
                }

                conn.Close();

                myContainer.Controls.Clear(); // Clear previous content
                myContainer.Controls.Add(table); // Add the new table
                Message.Text = ""; // Clear any previous error message
            }
            else
            {
                // Plan does not exist
                myContainer.Controls.Clear(); // Clear previous content
                Message.Text = "Invalid Plan name. Please re-enter.";
            }
        }
    }
}