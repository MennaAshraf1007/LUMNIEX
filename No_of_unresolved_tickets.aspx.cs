using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class No_of_unresolved_tickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowUnresolvedTickets(object sender, EventArgs e)
        {
            try
            {
                // Check if National ID is empty
                if (string.IsNullOrEmpty(NationalID.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('National ID cannot be empty. Please enter a valid ID.', true);", true);
                    return;
                }

                String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    int id = Convert.ToInt32(NationalID.Text);

                    // Validate if the National ID exists in the database
                    SqlCommand validateID = new SqlCommand("SELECT COUNT(*) FROM customer_account WHERE nationalID = @NID", conn);
                    validateID.Parameters.Add(new SqlParameter("@NID", id));

                    conn.Open();
                    int idCount = (int)validateID.ExecuteScalar();

                    if (idCount > 0)
                    {
                        // National ID exists, now fetch unresolved tickets
                        SqlCommand unrestickets = new SqlCommand("Ticket_Account_Customer", conn);
                        unrestickets.CommandType = CommandType.StoredProcedure;
                        unrestickets.Parameters.Add(new SqlParameter("@NID", id));

                        SqlDataReader reader = unrestickets.ExecuteReader();
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        reader.Close();

                        gvTickets.DataSource = dt;
                        gvTickets.DataBind();
                        ErrorMessage.Visible = false;
                    }
                    else
                    {
                        // National ID does not exist
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Invalid National ID. No matching records found.', true);", true);
                        ErrorMessage.Text = "Invalid National ID. No matching records found. Please enter it again.";
                        ErrorMessage.Visible = true;
                        gvTickets.DataSource = null;
                        gvTickets.DataBind();
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                // Show error toast
                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", $"showToast('Error: {ex.Message}', true);", true);
                ErrorMessage.Text = $"Error: {ex.Message}";
                ErrorMessage.Visible = true;
            }
        }
    }
}
  
