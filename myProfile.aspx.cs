using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripShip
{
    public partial class myProfile : System.Web.UI.Page
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
                if (!Page.IsPostBack)
                {
                    
                getInfo();
                }
            }
        }

        private void getInfo()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            cmd = con.CreateCommand();
            cmd.CommandText = "select * from customers where customerID = '" + Session["UserID"] + "'";
           SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dr = new DataTable();
            sda.Fill(dr);
            if (dr.Rows.Count == 1)
            {

                inputUsername.Text = dr.Rows[0]["c_username"].ToString();
                inputPass.Text = dr.Rows[0]["password"].ToString();
                inputName.Text = dr.Rows[0]["name"].ToString();
                inputLocation.Text = dr.Rows[0]["address"].ToString();
                inputEmailAddress.Text = dr.Rows[0]["email"].ToString();
                inputPhone.Text = dr.Rows[0]["phone"].ToString();
            }
            
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }

            cmd = con.CreateCommand();
            int id = Convert.ToInt32(Session["UserID"]);
            cmd.CommandText = "UPDATE Client SET c_username=@c_username,Password=@Password,Name=@Name,Address=@Address,Email=@Email,Mobno=@Mobno WHERE customerID = " +  Session["UserID"] ;
            cmd.Parameters.AddWithValue("@c_username", inputUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", inputPass.Text.Trim());
            cmd.Parameters.AddWithValue("@Name", inputName.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", inputLocation.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", inputEmailAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@Mobno", inputPhone.Text.Trim());
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Details updated succesfully')</script>");
        
        }

       
    }
}