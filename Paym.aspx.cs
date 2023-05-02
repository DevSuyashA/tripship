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
                    txtAmount.Text = Session["amount"].ToString();

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
            int travellersID = 0;
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select TravellersID from parcelTracking where TrackingID = '" + Session["TrackingID"] + "'";
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    travellersID = dr.GetInt32(0);
                }
                dr.Close();

                cmd.CommandText = "insert into Transaction(customerID, travellersID, trackingID, paymentStatus, amount) values('" + Session["UserID"] +"','" + travellersID +"','" + Session["TrackingID"] +"','Paid','" + Session["amount"] +"')";
                cmd.ExecuteNonQuery();
                cmd.CommandText= "Update parcelTracking set paymentStatus = 'Paid' where TrackingID = '" + Session["TrackingID"] + "'";
                cmd.ExecuteNonQuery();
                Response.Write("Payment Successfull!");
                Response.Redirect("UParcelInfo.aspx");
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