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
    public partial class My_Wallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Show_Transactions(object sender, EventArgs e)
        {
            int national = Convert.ToInt32(id_input.Text);
            string query;
            SqlCommand ser;
            SqlDataReader reader;
            Table table;
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand validateID = new SqlCommand(
            "SELECT COUNT(*) FROM customer_account WHERE nationalID = @NID", conn);
            validateID.Parameters.Add(new SqlParameter("@NID", national));
            conn.Open();
            int idCount = (int)validateID.ExecuteScalar();

            if (idCount > 0)
            {
                query = "SELECT * from DBO.Cashback_Wallet_Customer(@NID)";
                ser = new SqlCommand(query, conn);

                ser.Parameters.Add(new SqlParameter("@NID", national));
                reader = ser.ExecuteReader();

                table = new Table();
                table.CssClass = "dynamic-table"; // Add CSS class for styling

                // Add table header
                TableHeaderRow headerRow = new TableHeaderRow();
                headerRow.Cells.Add(new TableHeaderCell { Text = "Cashback ID" });
                headerRow.Cells.Add(new TableHeaderCell { Text = "Benefit ID" });
                headerRow.Cells.Add(new TableHeaderCell { Text = "Wallet ID" });
                headerRow.Cells.Add(new TableHeaderCell { Text = "Amount" });
                headerRow.Cells.Add(new TableHeaderCell { Text = "Transaction Date" });
                table.Rows.Add(headerRow);

                // Populate table rows with data
                while (reader.Read())
                {
                    TableRow row = new TableRow();

                    // Add cells for each column
                    row.Cells.Add(new TableCell { Text = reader["CashbackID"].ToString() });
                    row.Cells.Add(new TableCell { Text = reader["benefitID"].ToString() });
                    row.Cells.Add(new TableCell { Text = reader["walletID"].ToString() });
                    row.Cells.Add(new TableCell { Text = reader["amount"].ToString() });
                    row.Cells.Add(new TableCell { Text = reader["credit_date"].ToString() });

                    table.Rows.Add(row);
                }

                conn.Close();

                myContainer.Controls.Add(table);
                ErrorMessage.Visible = false;
            }
            else
            {
                ErrorMessage.Text = "Invalid National ID. No matching records found. Please enter again.";
                ErrorMessage.Visible = true;
            }


        }
            

        }
    }
