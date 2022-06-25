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



            if (CheckAllTextboxIsEmpty() == false)
            {
                if(CheckDuplicateStudentInformation() == false)
                {
                    if(CheckAllTextboxFormat() == true)
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


        //checks all textbox is empty/null
        private bool CheckAllTextboxIsEmpty()
        {
            bool empty = false;
            if(CheckIdIsEmpty() == false)
            {
                if(CheckLastnameIsEmpty() == false)
                {
                    if(CheckFirstnameIsEmpty() == false)
                    {
                        if(CheckMiddlenameIsEmpty() == false)
                        {
                            if(CheckBirthdateIsEmpty() == false)
                            {
                                if(CheckBirthdateIsEmpty() == false)
                                {
                                    if(CheckEmailIsEmpty() == false)
                                    {
                                        if(CheckAddressIsEmpty() == false)
                                        {
                                            if(CheckContactNumIsEmpty() == false)
                                            {
                                                if(CheckCreditUnitIsEmpty() == false)
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

        //checks all the textbox format is correct or not
        private bool CheckAllTextboxFormat()
        {
            bool format = true;

            if(CheckGenderListTextbox() == false)
            {
                if (CheckBirthdateFormat() == false)
                {
                    if (CheckContactNumFormat() == false)
                    {
                        if(CheckEnrolledProgramListTextbox() == false)
                        {
                            if(CheckYearlevelListTextBox() == false)
                            {
                                try
                                {
                                    int credit = int.Parse(creditunitTB.Text);
                                    format = false;
                                }catch (FormatException fe)
                                {
                                    format = true;
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "creditTextBoxBorder();", true);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Error due to :"+fe+"');", true);
                                }
                            }
                            else
                            {
                                format = true;
                            }
                        }
                        else
                        {
                            format = true;
                        }
                    }
                    else
                    {
                        format = true;
                    }
                }
                else
                {
                    format = true;
                }
            }
            else 
            {
                format = true;
            }

            return format;
        }

        //checks if id textbox is empty/null and checks if id textbox contains a character
        private bool CheckIdIsEmpty()
        {
            bool empty = false;
            if (idTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "idTextboxIsEmpty();", true);
                empty = true;
            }

            for(int i = 0; i < idTB.Text.Length; i++)
            {
                bool result = Char.IsLetter(idTB.Text, i);
                if(result == true)
                {
                    empty = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "idTextboxContainsCharacter();", true);
                    break;
                }
            }

            return empty;
        }
        //checks if lastname textbox is empty/null
        private bool CheckLastnameIsEmpty()
        {
            bool empty = false;

            if(lastnameTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "lnameTextboxIsEmpty();", true);
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

        //checks if email textbox is empty/null
        private bool CheckEmailIsEmpty()
        {
            bool empty = false;

            if(emailTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "emailTextBoxBorder();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student email address');", true);
                empty = true;
            }

            return empty;
        }

        //checks if address textbox is empty/null
        private bool CheckAddressIsEmpty()
        {
            bool empty = false;

            if(addressTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student email address');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "addressTextBoxBorder();", true);
                empty = true;
            }

            return empty;
        }

        //checks ifcontact num textbox is empty/null
        private bool CheckContactNumIsEmpty()
        {
            bool empty = false;

            if(contactTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "contactTextBoxBorder();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student contact number');", true);
                empty = true;
            }

            return empty;
        }

        //checks if credit unit textbox is empty/null
        private bool CheckCreditUnitIsEmpty()
        {
            bool empty = false;

            if(creditunitTB.Text.Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "creditTextBoxBorder();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the student credit unit');", true);
                empty = true;
            }
            return empty;
        }

        //checks if birthdate entered in a correct format mm/dd/yyyy
        private bool CheckBirthdateFormat()
        {
            bool format = true;

            if(birthdateTB.Text.Length != 10)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "bdayTextBoxBorder();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the date correct format');", true);
                format = false;
                birthdateTB.Text = null;
            }

            return format;
        }

        //checks if contact number is entered in a correct format 09XXXXXXXX
        private bool CheckContactNumFormat()
        {
            bool format = true;
            if (contactTB.Text.Length != 11)
            { 
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "contactTextBoxBorder();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Enter the correct contact number format');", true);
                contactTB.Text = null;
                format = false;
            }

            return format;
        }

        //checks if gender is selected the default choice
        private bool CheckGenderListTextbox()
        {
            bool format = true;

            if(genderTB.Text == "--Select Gender--")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "genderTextboxDefaultChoice();", true);
                format = false;
            }

            return format;
        }

        //checks if enrolled program is selected the default choice
        private bool CheckEnrolledProgramListTextbox()
        {
            bool format = true;

            if (enrolledprogramTB.Text == "--Select Course--")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "programTextBoxBorder();", true);
                format = false;
            }

            return format;
        }

        //checks if year level is selected the default choice
        private bool CheckYearlevelListTextBox()
        {
            bool format = true;

            if (yearlevelTB.Text == "--Select Year Level--")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "yearTextBoxBorder();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Select the student year level');", true);
                format = false;
            }

            return format;


        }

        //checks if theres a duplicate student information using its student id
        private bool CheckDuplicateStudentInformation()
        {
            bool duplicate = false;
            string message = "Student Id is in use";
            int i = 2;
            string conString = WebConfigurationManager.ConnectionStrings["studentrecorddbconnection"].ConnectionString;
            SqlConnection connect = new SqlConnection(conString);
            connect.Open();
            SqlCommand cmd = new SqlCommand("select * from StudentRecordTable where studentId = '" + idTB.Text +"'", connect);
            SqlDataReader r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    duplicate = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "idTextBoxBorder();", true);
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

        //clears all the textbox values/contents
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

            //checks if search student id textbox contains a alphabet
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