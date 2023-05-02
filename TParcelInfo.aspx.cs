using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripShip
{
    public partial class TParcelInfo : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getNewParcelInfo();
            getAccParcelInfo();
        }

        private void getAccParcelInfo()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("SELECT TrackingID,parcelName,destDistributionCenter, sourceDistributionCenter,weight,Volume,parcelStatus from parcelTracking where TravellersID = '" + Session["UserID"].ToString() + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rAccParcels.DataSource = dt;
            rAccParcels.DataBind();
        }

        private void getNewParcelInfo()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("SELECT p.TrackingID, p.sourceDistributionCenter, p.weight, p.Volume, p.parcelName, p.price, j.journeyID AS Expr1 FROM parcelTracking AS p INNER JOIN journeyLog AS j ON p.sourceCity = j.sourceCity AND p.destCity = j.destinationCity AND p.weight < j.acceptableWeight WHERE (j.TravellersID = '" + Session["UserID"] + "') AND (p.parcelStatus = 'Pending')", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rParcelInfo.DataSource = dt;
            rParcelInfo.DataBind();
        }

        protected void rParcelInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "acceptParcel")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("Update parcelTracking set parcelStatus = 'Accepted', TravellersID='" + Session["UserID"] + "' where TrackingID='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                Response.Write("Parcel Accepted");
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void rAccParcels_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "collectParcel")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = con.CreateCommand();

                cmd.CommandText = "update parcelTracking set parcelStatus='In Transit' where trackingID='" + e.CommandArgument + "'";
                cmd.ExecuteNonQuery();

            }
        }

        protected void rAccParcels_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus = e.Item.FindControl("lblStatus") as Label;
                LinkButton collectParcel = e.Item.FindControl("collectParcel") as LinkButton;
                if (lblStatus.Text.ToString().Equals("Accepted"))
                {
                    collectParcel.Visible = true;
                }
                else
                {
                    collectParcel.Visible = false;
                }
            }
        }
    }
}