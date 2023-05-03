using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripShip
{
    public partial class UParcelInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserID"]==null)
                {
                    Response.Write("You are not logged in. Redirecting to login. . .");
                    Response.Redirect("userlogin.aspx");
                }
            }
        }

        protected void rParcelInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "pay")
            {
                Label lblAmount = e.Item.FindControl("lblAmount") as Label;
                Session["amount"]= lblAmount.Text;
                Session["TrackingID"] = e.CommandArgument;
                Response.Redirect("Paym.aspx");
            }
        }

        protected void rParcelInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label parcelStatus = e.Item.FindControl("lblParcelStatus") as Label;
                Label paymentStatus = e.Item.FindControl("lblPaymentStatus") as Label;
                LinkButton pay = e.Item.FindControl("pay") as LinkButton;
                if (parcelStatus.Text.Equals("Shipped") && paymentStatus.Text.Equals("pending"))
                {
                    pay.Visible = true;
                }
                else
                {
                    pay.Visible = false;
                }
            }
        }
    }
}