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
    public partial class BookVet : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {

                //   getInfo();
                txtStart.Text = "00:00";
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ParcelInfo.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            DateTime dateTime = DateTime.Today;
            DateTime starttime = Convert.ToDateTime(TextBox2.Text);
            double rnd = (starttime - dateTime).TotalDays;
            if ((starttime - dateTime).TotalDays > 0)
            {
                string startDnt = TextBox2.Text.ToString() + " " + txtStart.Text;
                string endDnt = TextBox2.Text.ToString() + " " + txtEnd.Text;
                cmd.CommandText = "insert into Booking(customerID,pet_ID,v_ID, startDnT,endDnT,ServiceID) Values('" + Session["UserID"].ToString() + "', '" + DropDownList2.SelectedValue.ToString() + "', '" + ddlVet.SelectedValue.ToString() + "','" + startDnt + "','" + endDnt + "','" + DropDownList3.SelectedValue.ToString() + "')";
                cmd.ExecuteNonQuery();
                Response.Redirect("ClientBookings.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Date')</script>");
            }
        }



        protected void DropDownList3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from Service where ServiceID='" + DropDownList3.SelectedValue + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            DateTime starttime = Convert.ToDateTime(txtStart.Text);
            int dur = 0;
            if (dr.Read())
            {
                dur = Convert.ToInt32(dr["duration"]);
            }
            dr.Close();
            DateTime endtime = starttime.AddHours(dur);
            string endhr = endtime.ToString("HH");
            string endmin = endtime.ToString("mm");
            txtEnd.Text = endhr + ":" + endmin;
        }

        protected void ddlVet_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine(ddlVet.SelectedValue);
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from distributionCenters where distributerID ='" + ddlVet.SelectedValue + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
            //*vetAdd.Text = dr["Address"].ToString();
            }
                dr.Close();
        }
    }
}