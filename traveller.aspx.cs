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
    public partial class BookPetB : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "traveller")
            {
                mtv1.ActiveViewIndex= 1;
                Button1.Visible= false;
                getTravellerDetails();

            }
            else
            {
                mtv1.ActiveViewIndex= 0;
            }
            
        }

        private void getTravellerDetails()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("SELECT name, totalBookings FROM travellers", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rTravellers.DataSource = dt;
            rTravellers.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("journeyDetail.aspx");
        }
    }
}