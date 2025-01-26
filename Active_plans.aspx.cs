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
    public partial class Active_plans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string mobile = Session["mobile_num"] as string;
            if (!IsPostBack)
            {
                
                LoadActivePlans(mobile);
            }
        }
        private void LoadActivePlans(String customernumber)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string query = "SELECT * from DBO.Usage_Plan_CurrentMonth(@mobile_num)";
            SqlCommand ser = new SqlCommand(query, conn);

            ser.Parameters.Add(new SqlParameter("@mobile_num", customernumber));

            conn.Open();

            SqlDataReader reader = ser.ExecuteReader(CommandBehavior.CloseConnection);
            while (reader.Read())
            {
                // Create the main card container
                Panel card = new Panel();
                card.CssClass = "service-plan-box";

                // Left Section (Icon and Plan Name)
                Panel leftSection = new Panel();
                leftSection.CssClass = "left-section";

                // Add an icon (e.g., mobile icon)
                Literal icon = new Literal();
                icon.Text = "<i class='fas fa-mobile-alt'></i>";
                leftSection.Controls.Add(icon);

                // Add the plan name
                Label planLabel = new Label();
                planLabel.Text = "Active Plan";
                planLabel.CssClass = "plan-label";
                leftSection.Controls.Add(planLabel);

                // Add the left section to the card
                card.Controls.Add(leftSection);

                // Right Section (Details)
                Panel rightSection = new Panel();
                rightSection.CssClass = "right-section";

                // Add usage details
                Label dataConsume = new Label();
                dataConsume.Text = "<strong>Data Consumed:</strong> " + reader["data_consumption"].ToString();
                dataConsume.CssClass = "plan-details";
                rightSection.Controls.Add(dataConsume);

                Label sms = new Label();
                sms.Text = "<strong>SMS Consumed:</strong> " + reader["SMS_sent"].ToString();
                sms.CssClass = "plan-details";
                rightSection.Controls.Add(sms);

                Label min = new Label();
                min.Text = "<strong>Minutes Used:</strong> " + reader["minutes_used"].ToString();
                min.CssClass = "plan-details";
                rightSection.Controls.Add(min);

                // Add the right section to the card
                card.Controls.Add(rightSection);

                // Add the card to the container
                myContainer.Controls.Add(card);
            }
            conn.Close();


        }
    }
}