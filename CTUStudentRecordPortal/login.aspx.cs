using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CTUStudentRecordPortal
{
    public partial class login : System.Web.UI.Page
    {
        private string username = null;
        private string password = null;
        string loginStatus = "false";
        //getter for username
        public string GetUsername()
        {
            return username;
        }
        //setter for username
        public void Username(string user) {
            username = user;
        }
        //getter for password
        public string GetPassword()
        {
            return password;
        }
        //setter for password
        public void SetPassword(string pass)
        {
            password = pass;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            loginStatus = "false";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
        }
        protected void signinBTN_Click(object sender, EventArgs e)
        {
            string conString = WebConfigurationManager.ConnectionStrings["accountsdbconnection"].ConnectionString;
            SqlConnection connect = new SqlConnection(conString);
            try {
                connect.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from PortalAccounts where Username ='" + userNameTB.Text + "'and Password='" + passwordTB.Text + "'", connect);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                cmd.ExecuteNonQuery();
                //if the user enter the wrong password/username it clears the entered password and gives error message
                if (dt.Rows[0][0].ToString() == "1") {
                    loginStatus = "true";
                    Session.Add("status", loginStatus);
                    Response.Redirect("index.aspx");
                }
                else
                {
                    ErrorMessage();
                }
                if(rememberMeCB.Checked == false)
                {
                    ClearAllTextBoxText();
                }else
                connect.Close();
                //if the user checked the remember me  checkbox it stores the password and username
            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
                
        }
        //clears the contents inside the textbox of usernameTB and passwordTB
        public void ClearAllTextBoxText()
        {
            userNameTB.Text = null;
            passwordTB.Text = null;
        }
        //changes
        public void ErrorMessage()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "changeColor();", true);
        }

        protected void forgotPasswordBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgetpassword.aspx");
        }

        protected void signupBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }
    }
}