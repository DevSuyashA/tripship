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
    public partial class travellers : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            getTraveller();
        }

        private void getTraveller()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "SELECT * FROM travellers where status = 'waiting'";
            sda=new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rTraveller.DataSource=dt;
            rTraveller.DataBind();
            con.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "DELETE from travellers where TravellersID = '" + Convert.ToInt32( delNum.Text.Trim() ) + "'";
            cmd.ExecuteNonQuery();
            Response.Redirect(Request.RawUrl);
        }

        protected void rTraveller_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
            if(e.CommandName.ToString() == "accept")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                cmd = con.CreateCommand();
                cmd.CommandText = "UPDATE travellers set status = 'approved',AdminID='" + Session["adminID"] +"' where TravellersID = "+e.CommandArgument;
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);  
                
            }
            else if (e.CommandName.ToString() == "deny")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = con.CreateCommand();
                cmd.CommandText = "UPDATE travellers set status = 'rejected',AdminID='" + Session["adminID"] + "' where TravellersID = " + e.CommandArgument;
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);

            }
        }
    }
}