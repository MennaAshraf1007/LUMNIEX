using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

namespace WebApplication1
{   
    public partial class RemainingAmountView : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensure this logic only runs on the initial load, not on postbacks
            {
                string mobile = Session["mobile_num"] as string;

                if (!string.IsNullOrEmpty(mobile))
                {
                    // Call the ViewVoucher method with the mobile number
                    
                }

            }
        }



        //protected String mobileNo(String mobileNo)
        //{
        //    return mobileNo;
        //}

        protected void ViewAmount(object sender, EventArgs e) { 
       
            try
            {
                // Check if Session["mobile_num"] is null or empty
                if (Session["mobile_num"] == null || string.IsNullOrEmpty(Session["mobile_num"].ToString()))
                {
                    Label2.Text = "Mobile number is not set. Please log in again.";
                    Label2.CssClass = "error-message";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Mobile number is not set. Please log in again.', true);", true);
                    return;
                }

                // Check if plan.Text is null or empty
                if (string.IsNullOrEmpty(plan.Text))
                {
                    Label2.Text = "Plan name cannot be empty. Please enter a plan name.";
                    Label2.CssClass = "error-message";
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
                        // Plan exists, now get the remaining amount
                        SqlCommand rem = new SqlCommand("SELECT dbo.Remaining_plan_amount(@mobile_num, @plan_name)", conn);
                        rem.CommandType = CommandType.Text;
                        rem.Parameters.Add(new SqlParameter("@mobile_num", mobile));
                        rem.Parameters.Add(new SqlParameter("@plan_name", planName));

                        int amount = Convert.ToInt32(rem.ExecuteScalar()); // Get the remaining amount
                        Label2.Text = $"Remaining amount: {amount}";
                        Label2.CssClass = "success-message"; // Add a CSS class for styling success messages

                        // Show success toast
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", $"showToast('Remaining amount: {amount}', false);", true);
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