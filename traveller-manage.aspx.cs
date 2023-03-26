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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

              

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandText = "DELETE from PetBuddy where pb_ID = '" + Convert.ToInt32( delNum.Text.Trim() ) + "'";
            cmd.ExecuteNonQuery();
            Response.Redirect("petManage.aspx");
        }

    }
}