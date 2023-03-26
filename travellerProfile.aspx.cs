using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Library_Management_New
{
    public partial class pbProfile : System.Web.UI.Page
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
            cmd.CommandText = "select * from PetBuddy where pb_ID = '" + Session["UserID"] + "'";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dr = new DataTable();
            sda.Fill(dr);
            if (dr.Rows.Count == 1)
            {

                inputUsername.Text = dr.Rows[0]["travellerUname"].ToString();
                inputPass.Text = dr.Rows[0]["Password"].ToString();
                inputName.Text = dr.Rows[0]["Name"].ToString();
                rating.Text = dr.Rows[0]["Rating"].ToString();
                inputEmailAddress.Text = dr.Rows[0]["Email"].ToString();
                inputPhone.Text = dr.Rows[0]["Mobno"].ToString();
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
            cmd.CommandText = "UPDATE PetBuddy SET travellerUname=@c_username,Password=@Password,Name=@Name,Email=@Email,Mobno=@Mobno WHERE pb_ID = " + Session["UserID"];
            cmd.Parameters.AddWithValue("@c_username", inputUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", inputPass.Text.Trim());
            cmd.Parameters.AddWithValue("@Name", inputName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", inputEmailAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@Mobno", inputPhone.Text.Trim());
            cmd.ExecuteNonQuery();
            Session["username"] = inputName.Text.ToString();
            Response.Write("<script>alert('Details updated succesfully')</script>");
        }
    }
}