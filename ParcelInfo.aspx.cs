using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Runtime.Remoting.Services;

namespace TripShip
{
    public partial class PetInfo : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Write("<script>alert('You are not logged in. Redirecting to login. . .');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                getPetInfo();
                getUpcoming();
                getCompleted();
            }

        }

        private void getCompleted()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from parcelTracking where destDistributionCenter = '" + Session["UserID"] + "' and parcelStatus='Completed'";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            rCompleted.DataSource = dt;
            rCompleted.DataBind();
        }

        private void getUpcoming()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from parcelTracking where destDistributionCenter = '" + Session["UserID"] + "' and (parcelStatus='In Transit' or parcelStatus='Shipped')";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            rUpcoming.DataSource = dt;
            rUpcoming.DataBind();
        }

        private void getPetInfo()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from parcelTracking where sourceDistributionCenter = '" + Session["UserID"] + "' and parcelStatus='pending' or parcelStatus='accepted'";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            rPetInfo.DataSource = dt;
            rPetInfo.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterParcel.aspx");
        }

        protected void rPetInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rUpcoming_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            if (e.CommandName == "collectParcel")
            {
                SqlCommand cmd = new SqlCommand("Update parcelTracking set parcelStatus = 'Shipped' where TrackingID='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
            else if(e.CommandName== "enterOTP")
            {
                int otp = 0;
                int travellersID = 0;
                //TextBox txtOtp = (TextBox)e.Item.FindControl("txtOtp");
                int enteredOTP = Convert.ToInt32( txtOtp.Text.ToString());
                SqlCommand cmd = new SqlCommand("Select otp,TravellersID from parcelTracking where TrackingID='" + e.CommandArgument + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    otp = Convert.ToInt32(dr.GetDecimal(0));
                    travellersID = dr.GetInt32(1);
                }
                dr.Close();
                if(otp==enteredOTP)
                {
                    cmd.CommandText = "update parcelTracking set parcelStatus = 'Completed' where TrackingID='" + e.CommandArgument + "'";
                    cmd.ExecuteNonQuery();
                    cmd.CommandText="update travellers set totalBookings = totalBookings+1 where TravellersID='"+travellersID+"'";
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    Response.Write("<script>alert('Invalid OTP');</script>");
                }
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void rUpcoming_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblPaymentStatus = e.Item.FindControl("lblPaymentStatus") as Label;
                Label lblParcelStatus = e.Item.FindControl("lblParcelStatus") as Label;
                LinkButton collectParcel = e.Item.FindControl("collectParcel") as LinkButton;
                LinkButton enterOTP = e.Item.FindControl("enterOTP") as LinkButton;
                
                if (lblParcelStatus.Text.ToString().Equals("In Transit"))
                {
                    collectParcel.Visible = true;
                    enterOTP.Visible = false;
                }
                else
                {
                    if (lblPaymentStatus.Text.ToString().Equals("Paid"))
                    {
                        collectParcel.Visible = false;
                        enterOTP.Visible=true;
                        
                    }
                    else
                    {
                        enterOTP.Visible= false;    
                        collectParcel.Visible = false;
                        
                    }
                }
            }
        }
    }
}