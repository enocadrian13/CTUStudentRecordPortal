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
    public partial class searchresult : System.Web.UI.Page
    {   
        string lname = null;
        string fname = null;
        string course = null;
        string id = null;
        private string conString = WebConfigurationManager.ConnectionStrings["studentrecorddbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["searchId"].ToString();

            if(id == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "window.alert('Invalid Student ID. \nReturning to the homepage');", true);
                Response.Redirect("index.aspx");
            }
            if (!IsPostBack)
            {
                getStudentImage(id);
                getStudentName(id);
            }
        }
        
        private void getStudentImage(string id)
        {
            SqlConnection connect = new SqlConnection(conString);
            string fname = null;
            string lname = null;
            string course = null;
            connect.Open();

            SqlCommand command = new SqlCommand("Select * from StudentRecordTable where studentId='" + id + "'", connect);
            //SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            SqlDataReader r = command.ExecuteReader();
            if (r.HasRows)
            {
                while (r.Read())
                {
                    lname = r.GetValue(1).ToString();
                    fname = r.GetValue(2).ToString();
                    course = r.GetValue(10).ToString();
                    
                }
            }
            string filename = lname.ToLower() + "-" + fname.ToLower() + "(" + course.ToLower() + ")";
            studentImg.ImageUrl = studentidLbl.Text;
            if (studentImg.ImageUrl == null)
            {
                studentImg.ImageUrl = "images/" + filename + ".png";
            }
            else
            {
                studentImg.ImageUrl = "images/" + filename + ".jpg";
            }
            //studentidTB.Text = studentImg.ToString;
            connect.Close();
        }
        private void getStudentName(string id)
        {
            SqlConnection connect = new SqlConnection(conString);
            
            connect.Open();
            SqlCommand command = new SqlCommand("Select * from StudentRecordTable where studentId='" + id + "'", connect);
            //SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            string mname = null;
            string suf = null;
            string gen = null;
            string birth = null;
            string add = null;
            string email = null;
            string cont = null;
            string year = null;
            string stat = null;
            string credit = null;
            SqlDataReader r = command.ExecuteReader();
            if (r.HasRows)
            {
                while (r.Read())
                {
                    lname = r.GetValue(1).ToString();
                    fname = r.GetValue(2).ToString();
                    mname = r.GetValue(3).ToString();
                    suf = r.GetValue(4).ToString();
                    gen = r.GetValue(5).ToString();
                    birth = r.GetValue(6).ToString();
                    add = r.GetValue(7).ToString();
                    email = r.GetValue(8).ToString();
                    cont = r.GetValue(9).ToString();
                    course = r.GetValue(10).ToString();
                    year = r.GetValue(11).ToString();
                    stat = r.GetValue(12).ToString();
                    credit = r.GetValue(13).ToString();
                }
            }
            connect.Close();

            //This places all the retreive student record to be displayed on the web api
            string full = fname + " " + mname.Substring(0,1).ToUpper() + ". " + lname;
            studentidTB.Text = id;
            studentnameTB.Text = full;
            genderTB.Text = gen;
            birthdayTB.Text = birth;
            addressTB.Text = add;
            contactTB.Text = cont;
            emailTB.Text = email;
            enrolledprogramTB.Text = course;
            yearTB.Text = year;
            enrollmentstatTB.Text = stat;
            creditTB.Text = credit;

            int level = int.Parse(yearTB.Text);
            int creditunit = int.Parse(creditTB.Text);
            int fee = 0;

            if(stat == "Irregular")
            {
                if (level == 1)
                {
                    fee = 1700;
                }
                else if (level == 2)
                {
                    fee = 2300;
                }
                else if (level == 3)
                {
                    fee = 2750;
                }
                else if (level == 4)
                {
                    fee = 3300;
                }
                else
                {
                    fee = 4000;
                }
            }
            else
            {
                if (level == 1)
                {
                    fee = 1500;
                }
                else if (level == 2)
                {
                    fee = 2000;
                }
                else if (level == 3)
                {
                    fee = 2500;
                }
                else if (level == 4)
                {
                    fee = 3000;
                }
                else
                {
                    fee = 3500;
                }
            }

            int total = fee * creditunit;

            totalTB.Text = total.ToString();
        }
        protected void updateBtn_Click(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(conString);
            string query2 = "Update StudentRecordTable set studentAddress = '" + addressTB.Text + "',studentEmail = '" + emailTB.Text + "',studentContactNumber ='" + contactTB.Text + "',studentEnrolledProgram ='" + enrolledprogramTB.Text + "',studentYearLevel='" + yearTB.Text + "',studentEnrollmentStatus='" + enrollmentstatTB.Text + "',studentCreditUnit='" + creditTB.Text + "' where studentId = '"+ studentidTB.Text + "'";

            string year = null;
            yearTB.Text = year;
            string stat = null;
            enrollmentstatTB.Text = stat;
            string credit = null;
            creditTB.Text = credit;


            connect.Open();
            SqlCommand command1 = new SqlCommand(query2, connect);
            command1.ExecuteNonQuery();
            connect.Close();

            int level = int.Parse(yearTB.Text);
            int creditunit = int.Parse(creditTB.Text);
            int fee = 0;
            if (stat == "Irregular")
            {
                if (level == 1)
                {
                    fee = 1700;
                }
                else if (level == 2)
                {
                    fee = 2300;
                }
                else if (level == 3)
                {
                    fee = 2750;
                }
                else if (level == 4)
                {
                    fee = 3300;
                }
                else
                {
                    fee = 4000;
                }
            }
            else
            {
                if (level == 1)
                {
                    fee = 1500;
                }
                else if (level == 2)
                {
                    fee = 2000;
                }
                else if (level == 3)
                {
                    fee = 2500;
                }
                else if (level == 4)
                {
                    fee = 3000;
                }
                else
                {
                    fee = 3500;
                }
            }

            int total = fee * creditunit;

            totalTB.Text = total.ToString();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(conString);
            string query = "Delete StudentRecordTable where studentId = '" + studentidTB.Text + "'";
            connect.Open();
            SqlCommand cmd = new SqlCommand(query,connect);
            
            cmd.ExecuteNonQuery();
            connect.Close();
            Response.Redirect("index.aspx");
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
            Response.Redirect("login.aspx");
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            bool result = false;

            for (int i = 0; i < searchTB.Text.Length; i++)
            {
                result = Char.IsLetter(searchTB.Text, i);
                if (result == true)
                {
                    break;
                }
            }
            if (result == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "searchBoxBorder();", true);
                searchTB.Text = null;
            }
            else if (result == false)
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

        protected void addstudentBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("addnewstudent.aspx");
        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}