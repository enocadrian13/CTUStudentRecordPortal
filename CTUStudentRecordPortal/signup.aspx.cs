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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string conString = WebConfigurationManager.ConnectionStrings["accountsdbconnection"].ConnectionString;
        
        protected void signinBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void registerBTN_Click(object sender, EventArgs e)
        {
            string fname = firstnameTB.Text;
            string lname = lastnameTB.Text;
            string bday = birthdateTB.Text;
            string email = emailTB.Text;
            string user = usernameTB.Text;
            string pass = passwordTB.Text;
            string query = "insert into PortalAccounts values('"+fname+"','"+lname+"','"+bday+"','"+email+"','"+user+"','"+pass+"')";
            SqlConnection connect = new SqlConnection(conString);

            if(AllTextBoxIsNotEmpty() == false)
            {
                if (CheckDuplicate() == false)
                {
                    if(termsCB.Checked == true)
                    {
                        connect.Open();
                        SqlCommand command = new SqlCommand(query, connect);
                        int x = command.ExecuteNonQuery();
                        if (x == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('New Portal Account is successfully Registered!');", true);
                            ClearAllTextboxValues();
                        }

                        connect.Close();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "termsMustBeChecked();", true);
                    }
                }
            }
        }

        //checks if all textbox have inputted values/
        private bool AllTextBoxIsNotEmpty()
        {
            bool empty = false;

            if(CheckFirstnameIsEmpty() == false)
            {
                if(CheckLastnameIsEmpty() == false)
                {
                    if(CheckBirthdateIsEmpty() == false)
                    {
                        if(CheckEmailIsEmpty() == false)
                        {
                            if(CheckUsernameIsEmpty() == false)
                            {
                                if(CheckPasswordIsEmpty() == false)
                                {
                                    if(CheckConfirmIsEmpty() == false)
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
        //checks if theres an duplicate account
        private bool CheckDuplicate()
        {
            bool duplicate = false;
            if (CheckPasswordDoMatch() == true)
            {
                if (CheckEmailIsDuplicate() == false)
                {
                    if (CheckUsernameIsDuplicate() == false)
                    {
                        duplicate = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "usernameExistText();", true);
                        duplicate = true;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "emailExistText();", true);
                    duplicate = true;
                }
            }
            else
            {
                duplicate = true;
            }
            return duplicate;
        }
        //checks duplicate firstname
        /*private bool CheckFirstnameIsDuplicate()
        {
            bool duplicate = false;


            return duplicate;
        }
        //checks duplicate lastname
        private bool CheckLastnameIsDuplicate()
        {
            bool duplicate = false;
            return duplicate;
        }*/

        //checks duplicate email
        private bool CheckEmailIsDuplicate()
        {
            bool duplicate = false;
            SqlConnection connect = new SqlConnection(conString);
            string email = emailTB.Text;
            //query statement
            string query = "select * from PortalAccounts where Email = '"+email+"'";

            connect.Open();
            SqlCommand cmd = new SqlCommand(query, connect);
            SqlDataReader r = cmd.ExecuteReader();

                if (r.HasRows)
                {
                    duplicate = true;
                }

            connect.Close();
            return duplicate;
        }
        //checks duplicate username
        private bool CheckUsernameIsDuplicate()
        {
            bool duplicate = false;
            SqlConnection connect = new SqlConnection(conString);
            string username = usernameTB.Text;
            //query statement
            string query = "select * from PortalAccounts where Username = '" + username + "'";

            connect.Open();
            SqlCommand cmd = new SqlCommand(query, connect);
            SqlDataReader r = cmd.ExecuteReader();

            if (r.HasRows)
            {
                duplicate = true;
            }

            connect.Close();
            return duplicate;
        }
        //checks if firstname is empty/null
        private bool CheckFirstnameIsEmpty()
        {
            bool empty = false;

            if(firstnameTB.Text.Length == 0)
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

            if(lastnameTB.Text.Length == 0)
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

            if(emailTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "emailMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }

        private bool CheckUsernameIsEmpty()
        {
            bool empty = false;

            if(usernameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "unameMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }
        //checks if password is empty/null
        private bool CheckPasswordIsEmpty()
        {
            bool empty = false;

            if (passwordTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "passwordMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }
        //checks if confirm is empty/null
        private bool CheckConfirmIsEmpty()
        {
            bool empty = false;

            if (confirmpasswordTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "confirmMustNotEmpty();", true);
                empty = true;
            }

            return empty;
        }
        //checks if password do match
        private bool CheckPasswordDoMatch()
        {
            bool match = false;
            string password = passwordTB.Text;
            string confirm = confirmpasswordTB.Text;

            if(String.Equals(password, confirm))
            {
                match = true;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "passwordDoNotMatchText();", true);
                confirmpasswordTB.Text = null;
                match = false;
            }

            return match;
        }
        //clears all the textbox values
        private void ClearAllTextboxValues()
        {
            firstnameTB.Text = null;
            lastnameTB.Text = null;
            birthdateTB.Text = null;
            emailTB.Text = null;
            usernameTB.Text = null;
            passwordTB.Text = null;
        }

    }
}