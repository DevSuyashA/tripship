using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripShip
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
         
        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "DELETE from distributionCenters where distributerID = '" + Convert.ToInt32(delNum.Text.Trim()) + "'";
            cmd.ExecuteNonQuery();
            Response.Redirect("manage-center.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from distributionCenters where username =  '" + TextBox5.Text.Trim() + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Response.Write("UserName Already Exists");
                dr.Close();
            }
            else
            {
                dr.Close();
                cmd.CommandText = "insert into distributionCenters(username,password,ownerName,address,contact,city,openingTime,closingTime) Values('" + TextBox5.Text.Trim() + "','" + TextBox6.Text.Trim() + "','" + txtName.Text.Trim() + "','" + txtAddress.Text.Trim() + "','" + txtNum.Text.Trim() + "','" + txtCity.Text.Trim() + "','" + TextBox1.Text.ToString() + "','" + TextBox2.Text.ToString() + "')";
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                clear();
            }
        }

        private void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            txtNum.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            
        }
    }
}

