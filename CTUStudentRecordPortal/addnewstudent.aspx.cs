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


namespace CTUStudentRecordPortal
{
    public partial class addnewstudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            //All variables in all textbox
            string id = idTB.Text;
            string lname = lastnameTB.Text;
            string fname = firstnameTB.Text;
            string mname = middlenameTB.Text;
            string suf = suffixTB.Text;
            string gender = genderTB.Text;
            string birth = birthdateTB.Text;
            string address = addressTB.Text;
            string email = emailTB.Text;
            string contact = contactTB.Text;
            string program = enrolledprogramTB.Text;
            string status = null;
            string cred = creditunitTB.Text;

            //filenaming convention for storing students images
            string filename = lname.ToLower() + "-" + fname.ToLower() + "(" + program.ToLower() + ")";
            //for sql connections
            string conString = WebConfigurationManager.ConnectionStrings["studentrecorddbconnection"].ConnectionString;
            SqlConnection connect = new SqlConnection(conString);
            
            //checks if the student status is regular and irregular
            if (irregularCB.Checked == true)
                status = "Irregular";
            if (regularCB.Checked == true)
                status = "Regular";


            if (id.Length == 0)
            {
                
            }
            else
            {
                if (CheckDuplicate() == false)
                {
                    if (lname.Length == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "lnameTextBoxBorder();", true);
                    }
                    else
                    {
                        if (gender == "--Select Gender--")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "genderTextBoxBorder();", true);
                        }
                        else
                        {
                            if (fname.Length == 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "fnameTextBoxBorder();", true);
                            }
                            else
                            {
                                if (mname.Length == 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "mnameTextBoxBorder();", true);
                                }
                                else
                                {
                                    if (birth.Length == 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student birthdate');", true);
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "bdayTextBoxBorder();", true);
                                    }
                                    else
                                    {
                                        if (birth.Length != 10)
                                        {
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the date correct format');", true);
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "bdayTextBoxBorder();", true);
                                            birthdateTB.Text = null;
                                        }
                                        else
                                        {
                                            if (address.Length == 0)
                                            {
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the students address');", true);
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "addressTextBoxBorder();", true);
                                            }
                                            else
                                            {
                                                if (email.Length == 0)
                                                {
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student email address');", true);
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "emailTextBoxBorder();", true);
                                                }
                                                else
                                                {
                                                    if (contact.Length == 0)
                                                    {
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student contact number');", true);
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "contactTextBoxBorder();", true);
                                                    }
                                                    else
                                                    {
                                                        if (contact.Length != 11)
                                                        {
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the correct contact number format');", true);
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "contactTextBoxBorder();", true);
                                                            contactTB.Text = null;
                                                        }
                                                        else
                                                        {
                                                            if (program == "--Select Course--")
                                                            {
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Select the student enrolled course');", true);
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "programTextBoxBorder();", true);
                                                            }
                                                            else
                                                            {
                                                                if (yearlevelTB.Text == "--Select Year Level--")
                                                                {
                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Select the student year level');", true);
                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "yearTextBoxBorder();", true);
                                                                }
                                                                else
                                                                {
                                                                    if (cred.Length == 0)
                                                                    {
                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student credit unit');", true);
                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "creditTextBoxBorder();", true);
                                                                    }
                                                                    else
                                                                    {
                                                                        if (pictureUpload.HasFile)
                                                                        {
                                                                            int year = int.Parse(yearlevelTB.Text);
                                                                            int credit = int.Parse(creditunitTB.Text);
                                                                            try
                                                                            {
                                                                                string extension = Path.GetExtension(pictureUpload.FileName);
                                                                                if (extension == ".jpg" || extension == ".JPG" || extension == ".jpeg" || extension == ".JPEG" || extension == ".png" || extension == ".PNG")
                                                                                {
                                                                                    if (pictureUpload.PostedFile.ContentLength <= 2097152)
                                                                                    {
                                                                                        pictureUpload.SaveAs(Server.MapPath("images/") + filename + extension.ToLower());
                                                                                        connect.Open();
                                                                                        SqlCommand command = new SqlCommand("insert into StudentRecordTable values('" + id + "','" + lname + "','" + fname + "','" + mname + "','" + suf + "','" + gender + "','" + birth + "','" + address + "','" + email + "','" + contact + "','" + program + "','" + year + "','" + status + "','" + credit + "','" + pictureUpload.FileName + "')", connect);
                                                                                        int x = command.ExecuteNonQuery();
                                                                                        if (x == 1)
                                                                                        {
                                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('New student information is successfully added!');", true);
                                                                                        }
                                                                                        connect.Close();
                                                                                        ClearAllContents();
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        ErrorMessage(3);
                                                                                    }
                                                                                }
                                                                                else
                                                                                {
                                                                                    ErrorMessage(2);
                                                                                }
                                                                            }
                                                                            catch (Exception ex)
                                                                            {
                                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Cannot add student due to error: " + ex + " ');", true);
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "showErrorMessage0();", true);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    ErrorMessage(1);
                }
            }
        }

        //checks if id textbox is empty/null
        private bool CheckIdIsEmpty()
        {
            bool empty = false;
            if (idTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "idTextBoxBorder();", true);
                empty = true;
            }


            return empty;
        }
        //checks if lastname textbox is empty/null
        private bool CheckLastnameIsEmpty()
        {
            bool empty = false;

            if(lastnameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "lnameTextBoxBorder();", true);
                empty = true;
            }

            return empty;
        }
        
        //checks if firstname textbox is empty/null
        private bool CheckFirstnameIsEmpty()
        {
            bool empty = false;

            if(firstnameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "fnameTextBoxBorder();", true);
                empty = true;
            }
            return empty;
        }

        //checks if middlename textbox is empty/null
        private bool CheckMiddlenameIsEmpty()
        {
            bool empty = false;

            if(middlenameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "mnameTextBoxBorder();", true);
                empty = true;
            }
            return empty;
        }

        //checks if birthdate textbox is empty/null
        private bool CheckBirthdateIsEmpty()
        {
            bool empty = false;

            if(birthdateTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "mnameTextBoxBorder();", true);
            }

            return empty;
        }

        private bool CheckDuplicate()
        {
            bool duplicate = false;
            string conString = WebConfigurationManager.ConnectionStrings["studentrecorddbconnection"].ConnectionString;
            SqlConnection connect = new SqlConnection(conString);
            connect.Open();
            SqlCommand cmd = new SqlCommand("select * from StudentRecordTable where studentId = '" + idTB.Text +"'", connect);
            SqlDataReader r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    duplicate = true;
                }
            connect.Close();

            return duplicate;
        }

        private void ErrorMessage(int code)
        {
            switch (code)
            {
                case 1:
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('This new student record already existed');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "idTextBoxBorder();", true);
                    break;
                case 2:
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "showErrorMessage1();", true);
                    break;
                case 3:
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "showErrorMessage2();", true);
                    break;
            }
        }

        private void ClearAllContents()
        {
            idTB.Text = null;
            lastnameTB.Text = null;
            firstnameTB.Text = null;
            middlenameTB.Text = null;
            suffixTB.Text = null;
            genderTB.Text = null;
            birthdateTB.Text = null;
            addressTB.Text = null;
            emailTB.Text = null;
            contactTB.Text = null;
            enrolledprogramTB.Text = null;
            yearlevelTB.Text = null;
            irregularCB.Checked = false;
            regularCB.Checked = false;
            creditunitTB.Text = null;
        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            ClearAllContents();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
            Response.Redirect("login.aspx");
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            bool result = false;

            for(int i = 0; i < searchTB.Text.Length; i++)
            {
                result = Char.IsLetter(searchTB.Text, i);
                if(result == true)
                {
                    break;
                }
            }
            if(result == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "searchBoxBorder();", true);
                searchTB.Text = null;
            }
            else if(result == false)
            {
                string conString = WebConfigurationManager.ConnectionStrings["studentrecorddbconnection"].ConnectionString;
                SqlConnection connect = new SqlConnection(conString);
                connect.Open();
                SqlCommand cmd = new SqlCommand("select * from StudentRecordTable where studentId = '" + searchTB.Text + "'", connect);
                SqlDataReader r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    Session.Add("searchId", searchTB.Text);
                    Response.Redirect("searchresult.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "studentIdDoesNotExist();", true);
                    searchTB.Text = null;
                }
                connect.Close();
            }
        }
    }
}