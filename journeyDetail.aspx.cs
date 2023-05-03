using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using TripShip;

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
                if (Session["UserID"] == null)
                {
                    Response.Redirect("userlogin.aspx");
                }

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
            addNewJourney();
            //DateTime dateTime = DateTime.Today;
            //DateTime txtDate = Convert.ToDateTime(TextBox2.Text);
            //double rnd = (txtDate - dateTime).TotalDays;
            //if ((txtDate - dateTime).TotalDays > 0)
            //{
            //    DateTime starttime = Convert.ToDateTime(TextBox9.Text);
            //    DateTime endtime = Convert.ToDateTime(TextBox1.Text);
            //    rnd = (endtime - starttime).TotalHours;
            //    if ((endtime - starttime).TotalHours >= 1)
            //    {

            //        signUpNewMember();
            //    }
            //    else
            //    {
            //        Response.Write("<script>alert('Book for minimum 1 hour')</script>");
            //    }
            //}
            //else
            //{
            //    Response.Write("<script>alert('Im not a time traveller! Choose Proper date 😊')</script>");
            //}
        }

        void addNewJourney()
        {
            //Response.Write("<script>alert('Testing');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO journeyLog(sourceCity,destinationCity,startDateTime,endDateTime,acceptableWeight,TravellersID) VALUES('"+DropDownList1.SelectedValue+"','"+DropDownList2.SelectedValue+"','"+TextBox2.Text+"','"+TextBox3.Text+"',"+txtWeight.Text+"," + Session["UserID"] +")", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("traveller.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}