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
        int weight = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getAccParcelInfo();
                getJourneyDetails();
                getDestination();
                getDate();
            }
        }

        private void getJourneyDetails()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("SELECT journeyID, sourceCity FROM journeyLog WHERE (TravellersID = '"+Session["UserID"]+ "') AND (GETDATE() < endDateTime)", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlSource.DataSource = dt;
            ddlSource.DataBind();
            
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
            DateTime dateTime = DateTime.Now;
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("Select acceptableWeight, endDateTime from journeyLog where journeyID = '" + ddlDate.SelectedValue + "'",con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                weight = dr.GetInt32(0);
                dateTime = dr.GetDateTime(1);
            }
            dr.Close();
            cmd = new SqlCommand("select TrackingID, sourceDistributionCenter, weight, Volume, parcelName, price from parcelTracking where sourceCity = '"+ddlSource.SelectedValue+"' and destCity = '"+ddlDest.SelectedValue+"' and parcelStatus = 'Pending' and weight<'"+weight+"' ", con);
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
                SqlCommand cmd = new SqlCommand("Update parcelTracking set parcelStatus = 'Accepted', TravellersID='" + Session["UserID"] + "',journeyID='"+ddlDate.SelectedValue+"'  where TrackingID='" + e.CommandArgument + "'", con);
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

        protected void ddlSource_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            getDestination();
            getDate();
            getNewParcelInfo();

        }

        private void getDestination()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT journeyID, destinationCity FROM journeyLog WHERE (TravellersID = '" + Session["UserID"] + "') AND sourceCity = '" + ddlSource.SelectedValue + "' AND (GETDATE() < endDateTime)", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDest.DataSource = dt;
            ddlDest.DataBind();
        }

        protected void ddlDest_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            getDate();
        }

        private void getDate()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("SELECT journeyID, startDateTime FROM journeyLog WHERE (TravellersID = '" + Session["UserID"] + "') AND sourceCity = '" + ddlSource.SelectedValue + "' AND destinationCity = '" + ddlDest.SelectedValue + "' AND (GETDATE() < endDateTime)", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDate.DataSource = dt;
            ddlDate.DataBind();
            getNewParcelInfo();
        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            getNewParcelInfo();
        }
    }
}