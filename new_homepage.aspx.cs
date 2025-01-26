using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class new_homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobile = Session["mobile_num"] as string;

        }
        protected void service_plan_direct(object sender, EventArgs e)
        {
            string mobile = Session["mobile_num"] as string;

            Session["mob"] = mobile;
            Response.Redirect("Service_plans.aspx");
        }
        protected void other_serviceplan(object sender, EventArgs e)
        {

            Response.Redirect("other_plans.aspx");
        }

        protected void ActiveBenefits(object sender, EventArgs e)
        {
            Response.Redirect("ActiveBenefitsView.aspx");

        }

        protected void UnresolvedTickets(object sender, EventArgs e)
        {
            Response.Redirect("No_of_unresolved_tickets.aspx");

        }

        protected void HighestVoucherValue(object sender, EventArgs e)
        {
            Response.Redirect("HighestVoucherValueView.aspx");
        }

        protected void RemainingAmount(object sender, EventArgs e)
        {
            Response.Redirect("RemainingAmountView.aspx");
        }


        protected void ExtraAmount(object sender, EventArgs e)
        {
            Response.Redirect("ExtraAmountView.aspx");
        }


        protected void Top10SuccessfulPayments(object sender, EventArgs e)
        {
            Response.Redirect("Top10SuccessfulPayments.aspx");
        }
        protected void Mywallet(object sender, EventArgs e)
        {
            Response.Redirect("My_Wallet.aspx");
        }
        protected void shop(object sender, EventArgs e)
        {
            Response.Redirect("shop details.aspx");
        }
        protected void past5(object sender, EventArgs e)
        {
            Response.Redirect("service plane last 5.aspx");
        }
        protected void renew(object sender, EventArgs e)
        {
            Response.Redirect("Renew subscription.aspx");
        }
        protected void redeem(object sender, EventArgs e)
        {
            Response.Redirect("redeem voucher.aspx");
        }
        protected void cashback(object sender, EventArgs e)
        {
            Response.Redirect("cashback wallet.aspx");
        }

        protected void recharge(object sender, EventArgs e)
        {
            Response.Redirect("balance recharge.aspx");
        }

        protected void learn_more(object sender, EventArgs e)
        {
            Response.Redirect("learn more.aspx");
        }
        protected void About_Us(object sender, EventArgs e)
        {
            Response.Redirect("About us.aspx");
        }
    }
}