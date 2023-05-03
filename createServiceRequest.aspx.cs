using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TripShip
{
    public partial class createIssue : System.Web.UI.Page
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
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("INSERT INTO service(customerID,TrackingID,query) values(" + Session["UserID"] + "," + ddlTrackingId.SelectedValue + ",'" + TextBox1.Text + "')", con);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    
    }
}
