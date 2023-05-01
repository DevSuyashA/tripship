using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripShip
{
    public partial class homepage : System.Web.UI.Page
    {
        protected string url = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                if (Session["role"] != null)
                {

                    if (Session["role"].ToString() == "admin")
                    {

                        Button1.Enabled = false;
                        Button2.Enabled = false;
                        Button6.Text = "User Details";
                        //Buttom3Enabled = false;
                    }
                    else if (Session["role"].ToString() == "center")
                    {


                    }
                    else if (Session["role"].ToString() == "traveller")
                    {
                        Button3.Text = "My journey";
                    }
                    else if (Session["role"].ToString() == "dCenter")
                    {
                        Button6.Text = "New Parcel";
                    }
                    else
                    {
                        Button1.Enabled = true;
                        Button2.Enabled = true;
                        Button3.Enabled = true;
                        url = "Payments.aspx";
                        //viewmyPayments.Visible = false;

                    }
                }

            }
            catch (Exception ex)
            {
                Button1.Enabled = true;
                Button2.Enabled = true;
                //Buttom3Enabled = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Redirecting you to login . . .');</script>");

            Response.Redirect("ParcelInfo.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payments.aspx");
        }
        
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("traveller.aspx");
         
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("distributionCenters.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("notifications.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString().Equals("admin"))
            {

                Response.Redirect("Users.aspx");
            }
            else if (Session["role"].ToString().Equals("dCenter"))
            {
                Response.Redirect("RegisterParcel.aspx");
            }
            Response.Redirect("createServiceRequest.aspx");
            
        }
    }
}