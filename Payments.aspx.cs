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
    public partial class Payments : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected int totamount = 0;
        protected int d = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Write("<script>alert('You are not logged in. Redirecting to login. . .');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                getDetails();
            }

            
        }

        private void getDetails()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "select b.b_ID,b.endDnT,(DATEDIFF(hour,convert(varchar, b.startDnt,108), convert(varchar,b.endDnT,108))+1) duration, (s.Price*(DATEDIFF(hour,convert(varchar, b.startDnt,108), convert(varchar,b.endDnT,108))+1)) Amount,b.startDnt,p.petName,v.Name as vName,pb.Name as pbName from ((((Booking b INNER JOIN Pet p on b.pet_ID=p.pet_ID) INNER JOIN distributionCenters v on b.v_ID=v.distributerID) INNER JOIN PetBuddy pb on b.pb_ID=pb.pb_ID)INNER JOIN Service s on b.ServiceID=s.ServiceID) where b. = '" + Session["UserID"] + "' and b.payID = 0";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            rPayment.DataSource = dt;
            rPayment.DataBind();
            int i = 0;
            while (i < dt.Rows.Count)
            {
                d = Convert.ToInt32(dt.Rows[i]["duration"]);
                totamount = Convert.ToInt32(dt.Rows[i]["Amount"]);
                i++;
            }
        }

        protected void rPayment_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "pay")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                cmd = con.CreateCommand();
                cmd.CommandText = "select (s.Price*(DATEDIFF(hour,convert(varchar, b.startDnt,108), convert(varchar,b.endDnT,108))+1)) as Amount from Booking b INNER JOIN Service s on b.ServiceID=s.ServiceID where b.b_id = '" + e.CommandArgument + "'";
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    Session["grantTotalPrice"] = dr["Amount"];
                }
                dr.Close();
                Response.Redirect("Paym.aspx?id=" + e.CommandArgument);
            }
        }

        
    }
}