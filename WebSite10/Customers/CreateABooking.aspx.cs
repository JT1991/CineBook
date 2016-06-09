using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text;
using System.Web.Security;


public partial class Default5 : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
        Book.Enabled = false; 
        for (int i = 0; i < 7; i++)
        {
            DropDownListDate.Items.Add(DateTime.Now.AddDays(+i).ToShortDateString());

        }


    }
    protected void DropDownListDate_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Book.Enabled = true;
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {

   
        string movie_ID = string.Empty;
        string movie_Name = string.Empty;
        string movie_certification = string.Empty;
        string showing_ID = string.Empty;
        string venue_name = string.Empty;
        string UserId = string.Empty;
        string UserName = string.Empty;
        string seat_cat= this.rbseat_cat.SelectedItem.Text; 
        string performance_date = string.Empty;
        string performance_start = string.Empty;
        string booking_date = string.Empty;
        string venue_ID = string.Empty;
        int GVCount = GridView1.Rows.Count;

        //booking_date =  DateTime.Now.ToString("dd/MM/yyyy"); 

            foreach (GridViewRow GVRow in GridView1.Rows)
            {
                UserId = GVRow.Cells[0].Text;
                UserName = GVRow.Cells[1].Text;
                venue_ID = GVRow.Cells[2].Text;
                venue_name = GVRow.Cells[3].Text;
                showing_ID = GVRow.Cells[4].Text;
                movie_ID = GVRow.Cells[5].Text;
                movie_Name = GVRow.Cells[6].Text;
                movie_certification = GVRow.Cells[7].Text;
                


                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                {
                    SqlCommand scm = new SqlCommand();
                    scm.Connection = conn;
                    scm.CommandText = @"INSERT INTO booking
(user_ID, user_name, venue_ID,venue_name,showing_ID, movie_ID, movie_name,  movie_cert, seat_cat, performance_date, booking_date, performance_start)  
VALUES  
(@UserID, @UserName, @venue_ID, @venue_name, @showing_ID, @movie_ID, @movie_Name, @movie_certification, @seat_cat, @performance_date, @booking_date, @performance_start)";
                    {
                        scm.Connection = conn;
                        scm.Parameters.AddWithValue("@movie_ID", movie_ID.ToString());
                        scm.Parameters.AddWithValue("@movie_Name", movie_Name.ToString());
                        scm.Parameters.AddWithValue("@movie_certification", movie_certification.ToString());
                        scm.Parameters.AddWithValue("@showing_ID", showing_ID.ToString());
                        scm.Parameters.AddWithValue("@venue_ID", venue_ID.ToString());
                        scm.Parameters.AddWithValue("@venue_name", venue_name.ToString());
                        scm.Parameters.AddWithValue("@UserId", UserId.ToString());
                        scm.Parameters.AddWithValue("@UserName", UserName.ToString());
                        scm.Parameters.AddWithValue("@performance_start", rb1.SelectedValue);
                        scm.Parameters.AddWithValue("@seat_cat", rbseat_cat.SelectedValue);
                        scm.Parameters.AddWithValue("@booking_date", DateTime.Now);
                        scm.Parameters.AddWithValue("@performance_date", DateTime.Parse(DropDownListDate.SelectedItem.Text));
                        //conn.Open();
                        scm.ExecuteNonQuery();
                        conn.Close();
                    }
                }


            }
        }
    }




