﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{

    public Movie[] mMovie = new Movie[10];

    protected void loadMovie()
    {
        SqlConnection myConnection = new SqlConnection(Constants.DB_CONN_STR);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("select * from movie", myConnection);
        SqlDataReader myReader = myCommand.ExecuteReader();
        for (int index = 0; myReader.Read(); index++)
        {
            Movie movie = new Movie();
            movie.id = myReader[0].ToString();
            movie.name = myReader[1].ToString();
            movie.year = myReader[2].ToString();
            movie.image = myReader[3].ToString();
            mMovie[index] = movie;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        loadMovie();
        Page.DataBind();
    }

    public class Movie
    {
        public String id;
        public String name;
        public String year;
        public String image;
    }
}