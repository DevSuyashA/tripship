using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Runtime.CompilerServices;

namespace TripShip
{
    public partial class ClientBookings : System.Web.UI.Page

    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Write("<script>alert('You are not logged in. Redirecting to login. . .');</script>");
                Response.Redirect("userlogin.aspx");
            }

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            if (Session["role"].ToString() == "user")
            {
                MultiView1.ActiveViewIndex = 0;
                //int clientid = Convert.ToInt32( Session["UserID"]);
                //SqlCommand cmd = new SqlCommand("select b.b_ID,b.startDnT, b.endDnt,s.Name as serviceType,p.petName,pb.Name as pbName,v.Name as vName from ((((Booking b INNER JOIN Pet p on b.pet_ID=p.pet_ID) INNER JOIN travellers pb on b.pb_ID=pb.pb_ID) INNER JOIN distributionCenters v on b.v_ID=v.distributerID)INNER JOIN Service s on b.ServiceID=s.ServiceID) where ((DATEDIFF(day,convert(varchar,b.endDnt,101), convert(varchar,getdate(),101))< 0) and (DATEDIFF(hour,convert(varchar,b.endDnt,108), convert(varchar,getdate(),108))<0)) and b.  = '" + Session["UserID"] + "'", con);
                //SqlDataAdapter sda = new SqlDataAdapter(cmd);
                //DataTable dt = new DataTable();
                //sda.Fill(dt);

                
                //rUser.DataSource =dt;
                ////GridView1.DataSource = dt;


                //rUser.DataBind();
                // cmd = new SqlCommand("select b.b_ID,b.startDnT, b.endDnt,s.Name as serviceType,p.petName,pb.Name as pbName,v.Name as vName from ((((Booking b INNER JOIN Pet p on b.pet_ID=p.pet_ID) INNER JOIN travellers pb on b.pb_ID=pb.pb_ID) INNER JOIN distributionCenters v on b.v_ID=v.distributerID)INNER JOIN Service s on b.ServiceID=s.ServiceID) where (DATEDIFF(day,convert(varchar,b.endDnt,101), convert(varchar,getdate(),101))> 0) and b.customerID = '" + Session["UserID"] + "'", con);
                // sda = new SqlDataAdapter(cmd);
                // dt = new DataTable();
                //sda.Fill(dt);


                //rClientCom.DataSource = dt;
                ////GridView1.DataSource = dt;


                //rClientCom.DataBind();
            }

            else if (Session["role"].ToString() == "vet")
            {
                MultiView1.ActiveViewIndex = 1;
                SqlCommand cmd = new SqlCommand("select b.b_ID,b.payID,b.endDnt,c.Name as cName,p.petName as pName,p.Breed as pBreed,p.Age as pAge,p.petType as pType,s.Name as serviceType from (((Booking b INNER JOIN Client c on b.customerID=c.customerID) INNER JOIN Pet p on b.pet_ID=p.pet_ID) INNER JOIN Service s on b.ServiceID=s.ServiceID) where ((DATEDIFF(day,convert(varchar,b.endDnt,101), convert(varchar,getdate(),101))< 0) and (DATEDIFF(hour,convert(varchar,b.endDnt,108), convert(varchar,getdate(),108))<0)) and b.v_ID = '" + Session["UserID"] + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rVet.DataSource = dt;
                rVet.DataBind();
                 cmd = new SqlCommand("select b.b_ID,b.endDnt,b.payID,c.Name as cName,p.petName as pName,p.Breed as pBreed,p.Age as pAge,p.petType as pType,s.Name as serviceType from (((Booking b INNER JOIN Client c on b.customerID=c.customerID) INNER JOIN Pet p on b.pet_ID=p.pet_ID) INNER JOIN Service s on b.ServiceID=s.ServiceID) where (DATEDIFF(day,convert(varchar,b.endDnt,101), convert(varchar,getdate(),101))> 0) and b.v_ID = '" + Session["UserID"] + "'", con);
                 sda = new SqlDataAdapter(cmd);
                 dt = new DataTable();
                sda.Fill(dt);
                rVetCompletedBookings.DataSource = dt;
                rVetCompletedBookings.DataBind();

            }
            else if (Session["role"].ToString() == "traveller")
            {
                MultiView1.ActiveViewIndex = 2;
                SqlCommand cmd = new SqlCommand("SELECT p.* FROM parcelTracking p INNER JOIN journeyLog j on p.sourceCity=j.sourceCity and p.destCity  = j.destinationCity where p.journeyID=0 and DATEDIFF(day,p.maxDate,j.endDateTime)>1", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rTravellerAvailable.DataSource = dt;
                rTravellerAvailable.DataBind();
                cmd = new SqlCommand("SELECT p.* FROM parcelTracking p INNER JOIN journeyLog j on p.journeyID = j.journeyID where j.TravellersID=" + Session["UsreID"]+" and not p.parcelStatus = 'waiting' and not p.parcelStatus = 'delivered'", con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                rTravellerAccepted.DataSource = dt;
                rTravellerAccepted.DataBind();
                cmd = new SqlCommand("SELECT p.*,j.endDateTime FROM parcelTracking p inner join journeyLog j on p.journeyID= j.journeyID where ", con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                rTravellerDone.DataSource = dt;
                rTravellerDone.DataBind();

            }

        }

        protected void rBuddy_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "accept")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("Update Booking set pb_ID = '" + Session["UserID"] + "' where b_ID = '"+e.CommandArgument+"'",con);
                cmd.ExecuteNonQuery();
                Response.Redirect("ClientBookings.aspx");
            }
        }

        protected void rBuddyOncoming_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblStatus = e.Item.FindControl("lblStatus") as Label;
                if (Convert.ToInt32( lblStatus.Text)== 0)
                {
                    lblStatus.Text = "Pending!";
                }
                else
                {
                    lblStatus.Text = "Paid!";
                }
            }
        }

        protected void rUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "pay")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                //SqlCommand cmd = new SqlCommand("Delete from Booking where b_ID = '" + e.CommandArgument + "'", con);
                //cmd.ExecuteNonQuery();
                Response.Redirect("ClientBookings.aspx");
            }
        }

        protected void rTravellerAvailable_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rTravellerAccepted_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}