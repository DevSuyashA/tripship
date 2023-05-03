using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripShip
{
    public partial class resolveQueries : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["role"] != null)
                {

                    if (Session["role"].ToString() != "admin")
                    {
                        Response.Write("You are not logged in. Redirecting to login. . .");
                        Response.Redirect("homepage.aspx");
                    }
                }
                else if(Session["role"]== null)
                {

                        Response.Redirect("homepage.aspx");
                }
            }
        }

        protected void rServiceRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            if (e.CommandName == "edit")
            {
                string[] commArg = e.CommandArgument.ToString().Split('^');
                txtQuery.Text = commArg[0];
                hdnID.Value = commArg[1];
            }
            else if(e.CommandName == "delete")
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("delete from service where serviceID='" + e.CommandArgument + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtQuery.Text.ToString() == "")
            {
                Response.Write("<script>alert('Select a Query to respond')</script>");
            }
            else
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                try
                {
                    SqlCommand cmd = new SqlCommand("update service set response='" + txtResponse.Text + "' where serviceID='" + hdnID.Value + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }
    }
}