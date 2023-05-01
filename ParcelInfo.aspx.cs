using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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
            cmd.CommandText = "select * from parcelTracking where sourceDistributionCenter = '" + Session["UserID"] + "' and parcelStatus='completed'";
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
            cmd.CommandText = "select * from parcelTracking where destDistributionCenter = '" + Session["UserID"] + "' and parcelStatus='In Transit'";
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
            if (e.CommandName == "accept")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                cmd = con.CreateCommand();
                cmd.CommandText = "update parcelTracking set parcelStatus='In Transit' where trackingID='"+e.CommandArgument+"'";
                cmd.ExecuteNonQuery();
            }
        }
    }
}