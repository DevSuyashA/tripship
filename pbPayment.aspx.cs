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
    public partial class pbPayment : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            if (Session["role"].Equals("PetBuddy")){
                cmd.CommandText = "SELECT p.TrTime, p.Amount, pet.petName, c.Name AS Client, b.b_ID from (((booking b INNER JOIN payment p on b.payID=p.payID) INNER JOIN client c on b.=c.customerID)INNER JOIN pet pet on b.pet_ID=pet.pet_ID) where b.pb_ID='" + Session["UserID"] + "'";

            }
            else if (Session["role"].Equals("vet"))
            {
                cmd.CommandText = "SELECT p.TrTime, p.Amount, pet.petName, c.Name AS Client , b.b_ID from (((booking b INNER JOIN payment p on b.payID=p.payID) INNER JOIN client c on b.customerID=c.customerID)INNER JOIN pet pet on b.pet_ID=pet.pet_ID) where b.v_ID='" + Session["UserID"] + "'";
            }
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource= dt;
            GridView1.DataBind();
        }
    }
}