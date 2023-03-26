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
    public partial class journeyDetail : System.Web.UI.Page
    {
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

                    //getInfo();
                //if (RadioButton1.Checked)
                //{
                //    TextBox5.Text = Session["userAddr"].ToString();
                //    TextBox5.Enabled = false;
                //}
                //else if (RadioButton2.Checked)
                //{
                //    TextBox5.Text = "";
                //    TextBox5.Enabled = true;
                //}
            }

        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.Today;
            DateTime txtDate = Convert.ToDateTime(TextBox2.Text);
            double rnd = (txtDate - dateTime).TotalDays;
            if ((txtDate - dateTime).TotalDays > 0)
            {
                DateTime starttime = Convert.ToDateTime(TextBox9.Text);
                DateTime endtime = Convert.ToDateTime(TextBox1.Text);
                rnd = (endtime - starttime).TotalHours;
                if ((endtime - starttime).TotalHours >= 1)
                {

                    signUpNewMember();
                }
                else
                {
                    Response.Write("<script>alert('Book for minimum 1 hour')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Im not a time traveller! Choose Proper date 😊')</script>");
            }
        }

        void signUpNewMember()
        {
            //Response.Write("<script>alert('Testing');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string startdnt = TextBox2.Text.Trim() + " " + TextBox9.Text.Trim();
                string enddnt = TextBox2.Text.Trim() + " " + TextBox1.Text.Trim();
                SqlCommand cmd = new SqlCommand("INSERT INTO Booking(,pet_ID,destAddress,startDnt,endDnt,ServiceID) Values(@clientId,@pet_name,@full_address,@startTime,@endtime,@serviceId)", con);
                cmd.Parameters.AddWithValue("@pet_name", DropDownList1.SelectedValue);
                // cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@endtime", enddnt);
                cmd.Parameters.AddWithValue("@startTime", startdnt);
                // cmd.Parameters.AddWithValue("@serviceId", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@clientId", Session["UserID"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Booking Succesfull');</script>");
                Response.Redirect("ClientBookings.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}