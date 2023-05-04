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
    public partial class notifications : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if(con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = con.CreateCommand();
            if (!Page.IsPostBack)
            {
                if (Session["role"] != null)
                {
                    if (Session["role"].ToString() == "user")
                    {
                        getUserNotification();
                    }
                    else if (Session["role"].ToString().Equals("dCenter"))
                    {
                        getCenterNotification();
                    }
                    else if (Session["role"].ToString().Equals("traveller"))
                    {
                        getTravellerNotification();
                    }
                    else if (Session["role"].ToString().Equals("admin"))
                    {
                        getAdminNotification();
                    }
                }
                else
                {
                    Response.Redirect("userlogin.aspx");
                }
            }

        }

        private void getAdminNotification()
        {
            try
            {
                DateTime dateTime = DateTime.Now;
                cmd.CommandText = "SELECT * from Admin where AdminID='"+Session["adminID"]+"'";
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dateTime = dr.GetDateTime(5);
                }
                dr.Close();
                string date = dateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
                cmd.CommandText = "SELECT * from Log where  '" + date + "'<actionDate and (Action = 'New Traveller' or Action = 'New Query')";
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                rNotifications.DataSource = dt;
                rNotifications.DataBind();
            }
            catch(Exception ex)
            {

            }
        }

        private void getTravellerNotification()
        {
            try
            {
                DateTime dateTime = DateTime.Now;
                string destCity = "";
                cmd.CommandText = "SELECT destinationCity from journeyLog j where TravellersID='" + Session["UserID"] + "' and GETDATE()<endDateTime";
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    destCity = destCity + dr.GetString(0) + ",";
                }
                dr.Close();
                cmd.CommandText = "Select lastLogin from travellers where TravellersID = '" + Session["UserID"] + "'";
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dateTime = dr.GetDateTime(0);
                }
                dr.Close();
                string[] cities = destCity.Split(',');
                string date = dateTime.ToString("yyyy-MM-dd HH:mm:ss.fff"); //2023-05-04 00:47:32.347
                cmd.CommandText = "SELECT Action from Log l inner join parcelTracking p on l.TrackingID = p.TrackingID where '" + destCity+ "' LIKE CONCAT('%', p.destCity, '%') and l.actionDate > '" + date + "' and l.Action = 'Pending'";
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                rNotifications.DataSource = dt;
                rNotifications.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        private void getCenterNotification()
        {
            DateTime dateTime = DateTime.Now;
            cmd.CommandText = "SELECT lastLogin from distributionCenters where distributerID='" + Session["UserID"] + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dateTime = dr.GetDateTime(0);
            }
            dr.Close();
            string date = dateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.CommandText = "SELECT * from Log where '" + date + "' < actionDate and (Action = 'Accepted' OR Action = 'In Transit') ";
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rNotifications.DataSource = dt;
            rNotifications.DataBind();
        }

        private void getUserNotification()
        {
            DateTime dateTime = DateTime.Now;
            cmd.CommandText = "SELECT lastLogin from customers where customerID='" + Session["UserID"] + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dateTime = dr.GetDateTime(0);
            }
            dr.Close();
            string date = dateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
            cmd.CommandText = "SELECT * from Log where '" + date + "' < actionDate and (Action <> 'New Traveller' AND Action <> 'Pending' AND Action <> 'Paid' AND Action <> 'New Query') ";
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rNotifications.DataSource = dt;
            rNotifications.DataBind();
        }

        protected void rNotifications_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField hdnAction = e.Item.FindControl("hdnAction") as HiddenField;
            Label lblNotification = e.Item.FindControl("lblNotification") as Label;
            if (hdnAction != null)
            {

            string action = hdnAction.Value.ToString();
            switch (action)
            {
                case "Accepted":
                    lblNotification.Text = "Your previous Parcel was accepted by our Delivery partner";
                    break;
                case "In Transit":
                    lblNotification.Text = "Your previous parcel is in transit. Navigate to 'Your Parcels' section to see more details!";
                    break;
                case "Shipped":
                    lblNotification.Text = "Your parcel has arrived at the location.";
                    break;
                case "Completed":
                    lblNotification.Text = "Previous parcel delivery was completed successfully!";
                    break;
                case "New Traveller":
                    lblNotification.Text = "A new traveller is waiting for approval!";
                    break;
                case "Response":
                    lblNotification.Text = "Your query has been answered!";
                    break;
                case "New Query":
                    lblNotification.Text = "A new query was generated by an user!";
                    break;
                case "Pending":
                    lblNotification.Text = "A new parcel is available for your destination!";
                    break;
                default:
                    lblNotification.Text = "No new notification";
                    break;
            }
            }
        }
    }
}