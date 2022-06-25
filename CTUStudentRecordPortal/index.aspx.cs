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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addstudentBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("addnewstudent.aspx");
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

        protected void viewlistBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewlistofstudents.aspx");
        }

        protected void aboutusBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("aboutus.aspx");
        }
    }
}