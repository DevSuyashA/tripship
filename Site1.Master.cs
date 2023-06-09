﻿using System;
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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (Session["role"] != null)
                {

                    if (Session["role"].ToString() == "user")
                    {
                        LinkButton1.Visible = false; // user login link button
                        LinkButton2.Visible = false; // sign up link button
                        LinkButton3.Visible = true; // logout link button
                        LinkButton7.Visible = true; // hello user link button
                        LinkButton7.Text = "Hello " + Session["username"].ToString();


                        LinkButton6.Visible = false; // admin login link button
                        LinkButton11.Visible = false; // author management link button
                        LinkButton12.Visible = false; // publisher management link button

                    }
                    else if (Session["role"].ToString() == "admin")
                    {
                        LinkButton1.Visible = false; // user login link button
                        LinkButton2.Visible = false; // sign up link button

                        LinkButton3.Visible = true; // logout link button
                        LinkButton7.Visible = true; // hello user link button
                        LinkButton7.Text = "Hello Admin";


                        LinkButton6.Visible = false; // admin login link button
                        LinkButton11.Visible = true; // author management link button
                        LinkButton12.Visible = true; // publisher management link button

                    }
                    else if (Session["role"].ToString() == "dCenter")
                    {
                        LinkButton6.Visible = false;
                        LinkButton1.Visible = false; // user login link button
                        LinkButton2.Visible = false; // sign up link button

                        LinkButton3.Visible = true; // logout link button
                        LinkButton7.Visible = true; // hello user link button
                        LinkButton7.Text = "Hello " + Session["username"].ToString();


                        // admin login link button
                        LinkButton11.Visible = false; // author management link button
                        LinkButton12.Visible = false;
                    }
                    else if (Session["role"].ToString() == "traveller")
                    {
                        LinkButton6.Visible = false;
                        LinkButton1.Visible = false; // user login link button
                        LinkButton2.Visible = false; // sign up link button

                        LinkButton3.Visible = true; // logout link button
                        LinkButton7.Visible = true; // hello user link button
                        LinkButton7.Text = "Hello " + Session["username"].ToString();


                        // admin login link button
                        LinkButton11.Visible = false; // author management link button
                        LinkButton12.Visible = false;
                    }
                    else
                    {
                        LinkButton1.Visible = true; // user login link button
                        LinkButton2.Visible = true; // sign up link button

                        LinkButton3.Visible = false; // logout link button
                        LinkButton7.Visible = false; // hello user link button


                        LinkButton6.Visible = true; // admin login link button
                        LinkButton11.Visible = false; // author management link button
                        LinkButton12.Visible = false; // publisher management link button


                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }


        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                string tableName = "";
                string columnName = "";
                int userID = Convert.ToInt32( Session["UserID"]);
                if (Session["role"].ToString() == "user")
                {
                    tableName = "customers";
                    columnName = "customerID";
                    
                }
                else if (Session["role"].ToString().Equals("dCenter"))
                {
                    tableName = "distributionCenters";
                    columnName = "distributerID";
                }
                else if (Session["role"].ToString().Equals("traveller"))
                {
                    tableName = "travellers";
                    columnName = "TravellersID";
                }
                else if (Session["role"].ToString().Equals("admin"))
                {
                    tableName = "Admin";
                    columnName = "AdminID";
                    userID = Convert.ToInt32(Session["adminID"]);
                }
                cmd = con.CreateCommand();
                cmd.CommandText = "UPDATE " + tableName + " set lastLogin=GETDATE()  where " + columnName + "= '" + userID + "'";
                cmd.ExecuteNonQuery();
                
            }
            else
            {
                Response.Redirect("userlogin.aspx");
            }
            Session.Clear();
            Response.Redirect("homepage.aspx");
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");

        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginAdmin.aspx");
        }
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "user")
                {
                    Response.Redirect("myProfile.aspx");
                }
                else if (Session["role"].ToString() == "vet")
                {
                    Response.Redirect("vetProfile.aspx");
                }
                else if (Session["role"].ToString() == "travellers")
                {
                    Response.Redirect("travellerProfile.aspx");
                }
            }
            else
            {
                Response.Redirect("userlogin.aspx");
            }
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("traveller-manage.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("manage-center.aspx");
        }
    }
}