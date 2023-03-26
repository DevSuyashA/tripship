//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Library_Management_New
//{
//    public partial class usign : System.Web.UI.Page
//    {
//        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
//        protected void Page_Load(object sender, EventArgs e)
//        {
            
//        }

//        //protected void Button1_Click(object sender, EventArgs e)
//        //{
//        //    if (checkMemberExists())
//        //    {

//        //        Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
//        //    }
//        //    else
//        //    {
//        //        signUpNewMember();
//        //    }
//        //}
//        //bool checkMemberExists()
//        {
//            try
//            {
//                SqlConnection con = new SqlConnection(strcon);
//                if (con.State == ConnectionState.Closed)
//                {
//                    con.Open();
//                }
//                SqlCommand cmd = new SqlCommand("SELECT * from Client where Username='" + TextBox8.Text.Trim() + "';", con);
//                SqlDataAdapter da = new SqlDataAdapter(cmd);
//                DataTable dt = new DataTable();
//                da.Fill(dt);
//                if (dt.Rows.Count >= 1)
//                {
//                    return true;
//                }
//                else
//                {
//                    return false;
//                }
//            }
//            catch (Exception ex)
//            {
//                Response.Write("<script>alert('" + ex.Message + "');</script>");
//                return false;
//            }
//        }
//        void signUpNewMember()
//        {
//            //Response.Write("<script>alert('Testing');</script>");
//            try
//            {
//                SqlConnection con = new SqlConnection(strcon);
//                if (con.State == ConnectionState.Closed)
//                {
//                    con.Open();
//                }
//                string Faddress = TextBox4.Text + TextBox5.Text + DropDownList1.SelectedValue + TextBox6.Text;
//                SqlCommand cmd = new SqlCommand("INSERT INTO Client(Name,Mobno,Email,Address,Username,Password) values(@full_name,@contact_no,@email,@full_address,@username,@password)", con);
//                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
//                cmd.Parameters.AddWithValue("@contact_no", TextBox2.Text.Trim());
//                cmd.Parameters.AddWithValue("@email", TextBox3.Text.Trim());
//                cmd.Parameters.AddWithValue("@full_address", Faddress);
//                cmd.Parameters.AddWithValue("@username", TextBox7.Text.Trim());
//                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());
//                cmd.ExecuteNonQuery();
//                con.Close();
//                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
//            }
//            catch (Exception ex)
//            {
//                Response.Write("<script>alert('" + ex.Message + "');</script>");
//            }
//        }
//    }
//}