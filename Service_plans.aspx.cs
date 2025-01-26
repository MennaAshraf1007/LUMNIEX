using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Service_plans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string mob = Session["mob"] as string;
            string mobile = Session["mobile_num"] as string;
            if (!IsPostBack)
            {
                LoadServicePlans(mobile); 
            }
        }
        private void LoadServicePlans(String customernumber)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string query = "SELECT * from DBO.allServicePlans";
            SqlCommand ser = new SqlCommand(query, conn);

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

                // Add an icon (e.g., Wi-Fi icon)
                Literal icon = new Literal();
                icon.Text = "<i class='fas fa-wifi'></i>";
                leftSection.Controls.Add(icon);

                // Add the plan name
                Label planLabel = new Label();
                planLabel.Text = reader["name"].ToString();
                planLabel.CssClass = "plan-label";
                leftSection.Controls.Add(planLabel);

                // Add the left section to the card
                card.Controls.Add(leftSection);

                // Right Section (Details)
                Panel rightSection = new Panel();
                rightSection.CssClass = "right-section";

                // Add plan details
                Label planidlabel = new Label();
                planidlabel.Text = "<strong>Plan ID:</strong> " + reader["planID"].ToString();
                planidlabel.CssClass = "plan-details";
                rightSection.Controls.Add(planidlabel);

                Label p2 = new Label();
                p2.Text = "<strong>Price:</strong> " + reader["price"].ToString();
                p2.CssClass = "plan-details";
                rightSection.Controls.Add(p2);

                Label p3 = new Label();
                p3.Text = "<strong>SMS Offered:</strong> " + reader["SMS_offered"].ToString();
                p3.CssClass = "plan-details";
                rightSection.Controls.Add(p3);

                Label p4 = new Label();
                p4.Text = "<strong>Minutes Offered:</strong> " + reader["minutes_offered"].ToString();
                p4.CssClass = "plan-details";
                rightSection.Controls.Add(p4);

                Label p5 = new Label();
                p5.Text = "<strong>Data Offered:</strong> " + reader["data_offered"].ToString();
                p5.CssClass = "plan-details";
                rightSection.Controls.Add(p5);

                Label p6 = new Label();
                p6.Text = reader["description"].ToString();
                p6.CssClass = "plan-details";
                rightSection.Controls.Add(p6);

                // Add the right section to the card
                card.Controls.Add(rightSection);

                // Add the card to the container
                myContainer.Controls.Add(card);
            }
            conn.Close();


        }
        protected void Active(object sender, EventArgs e)
        {
            
            Response.Redirect("Active_plans.aspx");
        }

        protected void Not_Subscribed_to(object sender, EventArgs e)
        {
            
            Response.Redirect("other_plans.aspx");
        }
    }
}