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
    public partial class redeem_voucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void RedeemVoucher(object sender, EventArgs e)
        {
            try
            {
                // Check if mobile number and voucher ID are empty
                if (string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox1.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Mobile number and Voucher ID cannot be empty. Please fill them out.', true);", true);
                    return;
                }

                string mobileno = TextBox2.Text;
                int vid = Convert.ToInt32(TextBox1.Text);

                string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // Validate if the voucher ID exists
                    SqlCommand validateVoucher = new SqlCommand("SELECT COUNT(*) FROM Voucher WHERE voucherID = @voucherID", conn);
                    validateVoucher.Parameters.Add(new SqlParameter("@voucherID", vid));

                    conn.Open();
                    int voucherCount = (int)validateVoucher.ExecuteScalar();

                    if (voucherCount > 0)
                    {
                        // Voucher exists, now redeem it
                        SqlCommand ser = new SqlCommand("Redeem_voucher_points", conn);
                        ser.CommandType = CommandType.StoredProcedure;
                        ser.Parameters.Add(new SqlParameter("@mobile_num", mobileno));
                        ser.Parameters.Add(new SqlParameter("@voucher_id", vid));

                        int rowsAffected = ser.ExecuteNonQuery();

                        // Display success or failure message
                        if (rowsAffected > 0)
                        {
                            ResultLabel.Text = "Voucher redeemed successfully!";
                            ResultLabel.CssClass = "success-message";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Voucher redeemed successfully!', false);", true);
                        }
                        else
                        {
                            ResultLabel.Text = "No voucher was redeemed. Please check if points are enough.";
                            ResultLabel.CssClass = "error-message";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('No voucher was redeemed. Please check if points are enough.', true);", true);
                        }
                    }
                    else
                    {
                        // Voucher does not exist
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Invalid Voucher ID. Please re-enter.', true);", true);
                        ResultLabel.Text = "Invalid Voucher ID. Please re-enter.";
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
    

    