using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ExtraAmountView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewAmount(object sender, EventArgs e)
        {
            try
            {
                // Check if plan name is empty
                if (string.IsNullOrEmpty(plan.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Plan name cannot be empty. Please enter a plan name.', true);", true);
                    return;
                }

                String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string mobile = Session["mobile_num"].ToString(); // Convert to string
                    string planName = plan.Text;

                    // Validate if the plan exists in the database
                    SqlCommand validatePlan = new SqlCommand(
                        "SELECT COUNT(*) FROM Service_Plan WHERE name = @plan_name", conn);
                    validatePlan.Parameters.Add(new SqlParameter("@plan_name", planName));

                    conn.Open();
                    int idCount = (int)validatePlan.ExecuteScalar(); // Check if the plan exists

                    if (idCount > 0)
                    {
                        // Plan exists, now get the extra amount
                        SqlCommand Extra = new SqlCommand("SELECT dbo.Extra_plan_amount(@mobile_num, @plan_name)", conn);
                        Extra.CommandType = CommandType.Text;
                        Extra.Parameters.Add(new SqlParameter("@mobile_num", mobile));
                        Extra.Parameters.Add(new SqlParameter("@plan_name", planName));

                        int amount1 = Convert.ToInt32(Extra.ExecuteScalar());
                        Label2.Text = $"Extra amount: {amount1}";
                        Label2.CssClass = "success-message";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", $"showToast('Extra amount: {amount1}', false);", true);
                    }
                    else
                    {
                        // Plan does not exist
                        Label2.Text = "Invalid Plan name. Please re-enter.";
                        Label2.CssClass = "error-message";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Invalid Plan name. Please re-enter.', true);", true);
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                // Show error toast
                Label2.Text = $"Error: {ex.Message}";
                Label2.CssClass = "error-message";
                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", $"showToast('Error: {ex.Message}', true);", true);
            }
        }
    }
}