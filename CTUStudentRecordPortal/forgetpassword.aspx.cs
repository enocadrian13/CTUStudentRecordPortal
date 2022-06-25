using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace CTUStudentRecordPortal
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBTN_Click(object sender, EventArgs e)
        {

            if(CheckAllTextBoxIsEmpty() == false)
            {
                if(UserExist() == true)
                {
                    ClearAllTextboxValues();
                }
            }

        }
        private string conString = WebConfigurationManager.ConnectionStrings["accountsdbconnection"].ConnectionString;

        //checks if user exists
        private bool UserExist()
        {
            bool exist = false;
            string fname = firstnameTB.Text;
            string lname = lastnameTB.Text;
            string bday = birthdateTB.Text;
            string email = emailTB.Text;
            string user = usernameTB.Text;
            string query = "select * from PortalAccounts where Firstname ='"+fname+"'and Lastname ='"+lname+"'and Birthdate ='"+bday+"'and Email ='"+email+"'and Username ='"+user+"'";
            string pass = null;
            SqlConnection connect = new SqlConnection(conString);
            connect.Open();
            SqlCommand command = new SqlCommand(query, connect);
            SqlDataReader r = command.ExecuteReader();
            if (r.HasRows)
            {
                
                while (r.Read())
                {
                    pass = r.GetValue(5).ToString();
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Password is : "+pass+"');", true);
                exist = true;
            }

            connect.Close();

            return exist;
        }

        //Checks if all textbox are empty/null
        private bool CheckAllTextBoxIsEmpty()
        {
            bool empty = false;

            if (CheckFirstnameIsEmpty() == false)
            {
                if (CheckLastnameIsEmpty() == false)
                {
                    if (CheckBirthdateIsEmpty() == false)
                    {
                        if (CheckEmailIsEmpty() == false)
                        {
                            if (CheckUsernameIsEmpty() == false)
                            {
                                empty = false;
                            }
                            else
                            {
                                empty = true;
                            }
                        }
                        else
                        {
                            empty = true;
                        }
                    }
                    else
                    {
                        empty = true;
                    }
                }
                else
                {
                    empty = true;
                }
            }
            else
            {
                empty = true;
            }

            return empty;
        }
        //checks if firstname is empty/null
        private bool CheckFirstnameIsEmpty()
        {
            bool empty = false;

            if (firstnameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "fnameMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }
        //checks if lastname is empty/null
        private bool CheckLastnameIsEmpty()
        {
            bool empty = false;

            if (lastnameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "lnameMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }
        //checks if birthdate is empty/null
        private bool CheckBirthdateIsEmpty()
        {
            bool empty = false;

            if (birthdateTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", " bdayMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }
        //checks if email is empty/null
        private bool CheckEmailIsEmpty()
        {
            bool empty = false;

            if (emailTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "emailMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }

        private bool CheckUsernameIsEmpty()
        {
            bool empty = false;

            if (usernameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "unameMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }

        private void ClearAllTextboxValues()
        {
            firstnameTB.Text = null;
            lastnameTB.Text = null;
            birthdateTB.Text = null;
            emailTB.Text = null;
            usernameTB.Text = null;
        }

        protected void signinBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}