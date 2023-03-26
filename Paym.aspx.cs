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
    public partial class Paym : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["role"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    txtAmount.Text = Session["grantTotalPrice"].ToString();
                    
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.Today;
            if (txtCardNumber.Text == "" || txtCVV.Text == "" || txtMonths.Text == "" || txtName.Text == "" || txtYear.Text == "")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Please Enter all the values";
                lblMsg.CssClass = "alert alert-danger";
            }
            else if ((Convert.ToInt32(txtYear.Text) - Convert.ToInt32(dateTime.ToString("yyyy"))) <= 0)
            {
                if ((Convert.ToInt32(txtYear.Text) - Convert.ToInt32(dateTime.ToString("yyyy"))) == 0)
                {
                    if ((Convert.ToInt32(txtMonths.Text) - Convert.ToInt32(dateTime.ToString("yyyy"))) <= 0)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Your card has expired!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                    else
                    {
                        confirmPayment();
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Your card has expired!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            else
            {
                confirmPayment();
            }
        }
        private void confirmPayment()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string expdate = txtMonths.Text.ToString() + "/" + txtYear.Text.ToString();
            int payid = 0;
            
            int toVet = 0;
            cmd.CommandText = "select * from Booking where b_ID = '" + Request.QueryString["id"] + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (Convert.ToInt32( dr["v_ID"]) == 0)
                    toVet = 0;
                else
                    toVet = 1;
            }
            dr.Close();
            cmd.CommandText = "insert into Payment(Name,CardNo,Expiry,Cvv,TrTime,Amount,toVet) " +
                "values('" +txtName.Text.Trim() + "','" + txtCardNumber.Text.Trim() + "','" + expdate + "','" + Convert.ToInt32(txtCVV.Text.Trim()) + "',GETDATE(),'" + txtAmount.Text.Trim() + "','"+toVet+"')";
            try
            {
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select Top(1) * from Payment Order by TrTime DESC";
                dr= cmd.ExecuteReader();
                
                if (dr.Read())
                {
                    payid = Convert.ToInt32( dr["payID"]);
                }
                dr.Close();
                cmd.CommandText = "update Booking set payID = '" + payid + "' where b_ID = '" + Request.QueryString["id"] + "'";
                cmd.ExecuteNonQuery();
                Response.Write("Payment Successfull!");
                Response.Redirect("Payments.aspx");
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error - " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
        }
    }
}