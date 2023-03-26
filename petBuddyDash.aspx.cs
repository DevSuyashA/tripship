using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TripShip
{
    public partial class petBuddyDash : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select b.b_ID,b.destAddress,b.startDnT,b.endDnT,b.originAddress," + "c.Name as cname,p.petName as pname,p.Breed as pbreed,p.Age as pAge,p.Gender as pGender from ((Booking b inner join Client c on b.=c.customerID) inner join Pet p on b.pet_ID=p.pet_ID) where b.pb_ID = null";
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rAvailableOrder.DataSource = dt;
            rAvailableOrder.DataBind();
        }

        protected void rAvailableOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "accept")
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update Booking set pb_ID = '" + Session["UserID"]+"' where b_ID = " + e.CommandArgument;
                cmd.ExecuteNonQuery();
            }
        }
    }
}