using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone2DB_24"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int id = Int16.Parse(userID.Text);
                string password = Request.Form["PasswordInput"];


                if (id == 0 && password=="admin")
                {
                    Session["user"] = id;
                    
                    Response.Redirect("loading.aspx");
                }
                else {
                    string script = "alert('Invalid mobile number or password. Please try again.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "LoginAlert", script, true);
                    Response.Write(password);
                }

            }
            catch (Exception)
            {
                Response.Write("Make sure your user ID an integer less than 11 digits long");
            }
            conn.Open();
            conn.Close();



        }
        protected void switchToAdmin(object sender, EventArgs e)
        {
            Response.Redirect("login_customer.aspx");
        }

    }
}