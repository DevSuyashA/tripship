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
    public partial class RegisterPet : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Write("You are not logged in. Redirecting to login. . .");
                    Response.Redirect("userlogin.aspx");
                }
                if (Convert.ToInt32(Request.QueryString["id"]) != 0)
                {
                    Button1.Text = "Edit";
                    getPetInfo();

                }
            }

        }

        private void getPetInfo()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand(@"select * from Pet where pet_ID = '" + Request.QueryString["id"] + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            //if (dr.Read())
            //{
            //    TextBox1.Text = dr["petName"].ToString();
            //    TextBox3.Text = dr["Age"].ToString();
            //    //TextBox5.Text = dr["Breed"].ToString();
            //    ddlGender.SelectedValue = dr["Gender"].ToString();
            //    if (dr["petType"].ToString() == "Dog")
            //    {
            //        RadioButton1.Checked = true;
            //    }
            //    else
            //    {
            //        RadioButton2.Checked = true;
            //    }
            //}
            dr.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            int volume = Convert.ToInt32(TextBox3.Text.ToString()) * Convert.ToInt32(TextBox4.Text.ToString()) * Convert.ToInt32(TextBox6.Text.ToString());
            Random rnd = new Random();
            int otp = rnd.Next(100000, 999999);
            SqlCommand cmd;
            cmd = con.CreateCommand();
            cmd.CommandText = "insert into parcelTracking(destDistributionCenter,receiverEmail,customerID,weight,sourceDistributionCenter,Volume,parcelName,price,parcelStatus,destCity,sourceCity,maxDate,otp) values(@destDist,@receiverEmail,@customerID,@weight,@sourceDist,@volume,@parcelName,@price,@parcelStatus,@destCity,@sourceCity,@maxDate,@otp)";
            cmd.Parameters.AddWithValue("@destDist", ddlDest.SelectedValue);
            cmd.Parameters.AddWithValue("@receiverEmail", TextBox8.Text);
            cmd.Parameters.AddWithValue("@customerID", ddlUser.SelectedValue);
            cmd.Parameters.AddWithValue("@weight", TextBox7.Text);
            cmd.Parameters.AddWithValue("@sourceDist", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@volume", volume);
            cmd.Parameters.AddWithValue("@parcelName", TextBox1.Text);
            cmd.Parameters.AddWithValue("@price", TextBox5.Text);
            cmd.Parameters.AddWithValue("@parcelStatus", "Pending");
            cmd.Parameters.AddWithValue("@destCity", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@sourceCity", Session["city"]);
            cmd.Parameters.AddWithValue("@maxDate", TextBox2.Text);
            cmd.Parameters.AddWithValue("@otp", otp);
                cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Parcel added to pending lists')</script>");
            Clear();
        }

        private void Clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            //TextBox5.Text = "";
        }

        protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void priceCalc_Click(object sender, EventArgs e)
        {
            double volume = Convert.ToInt32(TextBox3.Text.ToString()) * Convert.ToInt32(TextBox4.Text.ToString()) * Convert.ToInt32(TextBox6.Text.ToString());
            double weight = Convert.ToInt32(TextBox7.Text.ToString());
            double baseRate = 50;
            double weightRate = Math.Ceiling(weight * 2) * 50; // round up weight to nearest 500 g
            double volumeRate = Math.Ceiling((volume - 500) / 100) * 5; // subtract base volume of 500 cc
            double totalCost = baseRate + weightRate + volumeRate;
            TextBox5.Text= totalCost.ToString();
        }
    }
}