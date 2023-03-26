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
                //your code here...
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

            string type = "";
            //if (RadioButton1.Checked)
            //  type = "Dog";
            //else if (RadioButton2.Checked)
            // type = "Cat";
            if (Button1.Text == "Submit")
            {

                SqlCommand cmd = new SqlCommand("INSERT INTO Pet(petName,petType,Age,Gender,Breed,) values(@petName,@petType,@Age,@Gender,@Breed,@customerID)", con);
                cmd.Parameters.AddWithValue("@petName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@petType", type);
                cmd.Parameters.AddWithValue("@Age", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                //  cmd.Parameters.AddWithValue("@Breed", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@customerID", Session["UserID"].ToString());

                cmd.ExecuteNonQuery();
                Clear();
                con.Close();
                Response.Redirect("ParcelInfo.aspx");
            }
            else if (Button1.Text == "Edit")
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                //SqlCommand cmd = new SqlCommand("update pet set petName='hhaa',petType='Dog',Age=3,Gender='M',Breed='Randi' where pet_ID=9", con);
                SqlCommand cmd = new SqlCommand("Update pet set petName='" + TextBox1.Text.Trim() + "',petType='" + type + "',Age='" + TextBox3.Text.Trim() + "',Gender='" + ddlGender.SelectedValue + "',Breed='" + /*TextBox5.Text.Trim() */ "' where pet_ID = '" + id + "'", con);



                cmd.ExecuteNonQuery();
                Clear();
                con.Close();
                Response.Redirect("ParcelInfo.aspx");
            }
        }

        private void Clear()
        {
            TextBox1.Text = "";
            TextBox3.Text = "";

            //TextBox5.Text = "";
        }
    }
}