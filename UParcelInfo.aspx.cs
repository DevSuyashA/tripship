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
    }
}