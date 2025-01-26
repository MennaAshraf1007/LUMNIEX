using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace WebApplication1
{
    public partial class login_customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void login_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string mobile = mobile_text.Text.PadRight(11);
            string password = Request.Form["PasswordInput"].PadRight(50);

            string query = "SELECT DBO.AccountLoginValidation(@mobile_num,@pass)";
            SqlCommand loginproc = new SqlCommand(query, conn);

            loginproc.Parameters.Add(new SqlParameter("@mobile_num", mobile));
            loginproc.Parameters.Add(new SqlParameter("@pass", password));
            

            conn.Open();
            int sucess = Convert.ToInt32(loginproc.ExecuteScalar());
            conn.Close();
           
            
            

            if (sucess == 1)
            {
                Session["mobile_num"] = mobile;
                Response.Redirect("post sign in.aspx?phoneNumber=" + mobile);

            }
            else
            {
                // Login failed: show an alert message
                string script = "alert('Invalid mobile number or password. Please try again.');";
                ClientScript.RegisterStartupScript(this.GetType(), "LoginAlert", script, true);
            }
        }
        protected void switchToAdmin(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}