using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management_New
{
    public partial class vetProfile : System.Web.UI.Page
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
            cmd.CommandText = "select * from distributionCenters where distributerID = '" + Session["UserID"] + "'";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dr = new DataTable();
            sda.Fill(dr);
            if (dr.Rows.Count == 1)
            {

                inputUsername.Text = dr.Rows[0]["v_username"].ToString();
                inputPass.Text = dr.Rows[0]["Password"].ToString();
                inputName.Text = dr.Rows[0]["Name"].ToString();
                inputLocation.Text = dr.Rows[0]["Address"].ToString();
                inputEmailAddress.Text = dr.Rows[0]["Email"].ToString();
                inputPhone.Text = dr.Rows[0]["Mobno"].ToString();
                openTime.Text = dr.Rows[0]["Open_time"].ToString();
                closeTime.Text = dr.Rows[0]["Close_time"].ToString();
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
            try
            {

            cmd.CommandText = "UPDATE distributionCenters SET v_username=@c_username,Password=@Password,Name=@Name,Address=@Address,Email=@Email,Mobno=@Mobno,Open_time=@open_time,Close_time=@close_time WHERE distributerID = " + Session["UserID"];
            cmd.Parameters.AddWithValue("@c_username", inputUsername.Text.Trim()); 
            cmd.Parameters.AddWithValue("@Password", inputPass.Text.Trim());
            cmd.Parameters.AddWithValue("@Name", inputName.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", inputLocation.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", inputEmailAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@Mobno", inputPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@open_time", openTime.Text.Trim());
            cmd.Parameters.AddWithValue("@close_time", closeTime.Text.Trim());
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Details updated succesfully')</script>");
            }
            catch( Exception ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    Response.Write("<script>alert('Username Already Exists!')</script>");
                }
            }

        }
    }
}