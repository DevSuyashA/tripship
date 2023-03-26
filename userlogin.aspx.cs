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

    public partial class userlogin : System.Web.UI.Page
    {


        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // user login

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                if (rdbUser.Checked)
                {
                    rdbBuddy.Checked = false;
                    rdbVet.Checked = false;

                    SqlCommand cmd = new SqlCommand("select * from customers where c_username='" + TextBox1.Text.Trim() + "' AND Password='" + TextBox2.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    //TextBox2.Text.Trim();

                    if (dr.Read())
                    {
                        Session["role"] = "user";
                        Session["UserID"] = dr["customerID"].ToString();
                        Session["username"] = dr["name"];
                        Session["userAddr"] = dr["address"];
                        Response.Write("<script>alert('" + dr.GetValue(3).ToString() + "');</script>");
                        Response.Redirect("homepage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }

                }
                else if (rdbVet.Checked)
                {
                    rdbUser.Checked = false;
                    rdbBuddy.Checked = false;
                    SqlCommand cmd = new SqlCommand("select * from distributionCenters where v_username='" + TextBox1.Text.Trim() + "' AND Password='" + TextBox2.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    //TextBox2.Text.Trim();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["role"] = "vet";
                            Session["UserID"] = dr["distributerID"];
                            Session["username"] = dr["Name"];
                            Response.Write("<script>alert('" + dr.GetValue(2).ToString() + "');</script>");
                            Response.Redirect("homepage.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }
                }
                else if (rdbBuddy.Checked)
                {
                    rdbUser.Checked = false;
                    rdbVet.Checked = false;
                    SqlCommand cmd = new SqlCommand("select * from travellers where travellerUname='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    //TextBox2.Text.Trim();
                    if (dr.Read())
                    {
                        if (dr.GetString(8) == "waiting")
                        {
                            dr.Close();
                            Response.Write("<script>alert('Waiting for approval')</script>");
                        }
                        else if (dr.GetString(8) == "rejected")
                        {
                            dr.Close();
                            Response.Write("<script>alert('Your application was rejected!')</script>");

                        }
                        else
                        {

                                                       
                                Session["role"] = "traveller";
                                Session["UserID"] = dr.GetInt32(0).ToString();
                                Session["username"] = dr.GetString(1);
                                Response.Write("<script>alert('" + dr.GetValue(1).ToString() + "');</script>");
                                dr.Close();
                                Response.Redirect("homepage.aspx");
                            
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}