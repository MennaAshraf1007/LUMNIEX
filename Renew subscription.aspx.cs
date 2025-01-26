using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Renew_subscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobile = Session["mobile_num"] as string;

        }

        protected void renew_subscription(object sender, EventArgs e)
        {
            try
            {
                // Check if all fields are filled
                if (string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('All fields are required. Please fill them out.', true);", true);
                    return;
                }

                string mobileno = Session["mobile_num"].ToString();
                int amount = Convert.ToInt32(TextBox2.Text);
                string paymethod = TextBox3.Text;
                int planid = Convert.ToInt32(TextBox4.Text);

                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Validate if the plan ID exists
                    SqlCommand validatePlan = new SqlCommand("SELECT COUNT(*) FROM Service_Plan WHERE planID = @planID", conn);
                    validatePlan.Parameters.Add(new SqlParameter("@planID", planid));

                    int planCount = (int)validatePlan.ExecuteScalar();

                    if (planCount > 0)
                    {
                        // Plan exists, now renew the subscription
                        SqlCommand ser = new SqlCommand("Initiate_plan_payment", conn);
                        ser.CommandType = CommandType.StoredProcedure;
                        ser.Parameters.Add(new SqlParameter("@mobile_num", mobileno));
                        ser.Parameters.Add(new SqlParameter("@amount", amount));
                        ser.Parameters.Add(new SqlParameter("@payment_method", paymethod));
                        ser.Parameters.Add(new SqlParameter("@plan_id", planid));

                        int rowsAffected = ser.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected > 0)
                        {
                            ResultLabel.Text = "The subscription has been renewed!";
                            ResultLabel.CssClass = "success-message";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('The subscription has been renewed!', false);", true);
                        }
                        else
                        {
                            ResultLabel.Text = "Sorry, the subscription could not be renewed.";
                            ResultLabel.CssClass = "error-message";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Sorry, the subscription could not be renewed.', true);", true);
                        }
                    }
                    else
                    {
                        // Plan does not exist
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Invalid Plan ID. Please re-enter.', true);", true);
                        ResultLabel.Text = "Invalid Plan ID. Please re-enter.";
                        ResultLabel.CssClass = "error-message";
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                // Show error toast
                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", $"showToast('Error: {ex.Message}', true);", true);
                ResultLabel.Text = $"Error: {ex.Message}";
                ResultLabel.CssClass = "error-message";
            }
        }
    }
    }
