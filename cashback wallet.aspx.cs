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
    public partial class cashback_wallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobile = Session["mobile_num"] as string;
        }



        protected void cashbackpaywallet(object sender, EventArgs e)
        {
            try
            {
                // Check if payment ID and benefit ID are empty
                if (string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Payment ID and Benefit ID cannot be empty. Please enter valid IDs.', true);", true);
                    return;
                }

                string mobileno = Session["mobile_num"].ToString();
                int paymentid = Convert.ToInt32(TextBox2.Text);
                int benefitid = Convert.ToInt32(TextBox3.Text);

                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // Validate if the payment ID and benefit ID exist in the database
                    SqlCommand validatePayment = new SqlCommand("SELECT COUNT(*) FROM Payment WHERE paymentID = @paymentID", conn);
                    validatePayment.Parameters.Add(new SqlParameter("@paymentID", paymentid));

                    SqlCommand validateBenefit = new SqlCommand("SELECT COUNT(*) FROM Benefits WHERE benefitID = @benefitID", conn);
                    validateBenefit.Parameters.Add(new SqlParameter("@benefitID", benefitid));

                    conn.Open();
                    int paymentCount = (int)validatePayment.ExecuteScalar();
                    int benefitCount = (int)validateBenefit.ExecuteScalar();

                    if (paymentCount > 0 && benefitCount > 0)
                    {
                        // Payment and benefit exist, now apply cashback
                        SqlCommand ser = new SqlCommand("Payment_wallet_cashback", conn);
                        ser.CommandType = CommandType.StoredProcedure;
                        ser.Parameters.Add(new SqlParameter("@mobile_num", mobileno));
                        ser.Parameters.Add(new SqlParameter("@payment_id", paymentid));
                        ser.Parameters.Add(new SqlParameter("@benefit_id", benefitid));

                        int rowsAffected = ser.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected > 0)
                        {
                            ResultLabel.Text = "Cashback applied successfully!";
                            ResultLabel.CssClass = "success-message";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Cashback applied successfully!', false);", true);
                        }
                        else
                        {
                            ResultLabel.Text = "Failed to apply cashback.";
                            ResultLabel.CssClass = "error-message";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Failed to apply cashback.', true);", true);
                        }
                    }
                    else
                    {
                        // Payment or benefit does not exist
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Invalid Payment ID or Benefit ID. Please re-enter.', true);", true);
                        ResultLabel.Text = "Invalid Payment ID or Benefit ID. Please re-enter.";
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