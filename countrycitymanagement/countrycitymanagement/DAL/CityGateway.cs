using System.Data;
using countrycitymanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace countrycitymanagement.DAL
{
    public class CityGateway

    {
        //string connectionString = @"Data Source=ShahinAhmed;Initial Catalog=CCManagement; Uid=sa; Password=132188";
        string connectionString = @"Server=.\SQLEXPRESS; Database=CountryCityManagement; Integrated Security=true";
        public long  InsertCity(City city)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO CITY (NAME,ABOUT,DWELLERS,LOCATION,WEATHER,COUNTRYID)VALUES(@name,@about,@dwellers,@location,@weather,@countryId)";
            connection.Open();
            SqlCommand command=new SqlCommand(query,connection);

            command.Parameters.Clear();

            command.Parameters.Add("name", SqlDbType.VarChar);
            command.Parameters["name"].Value = city.Name;

            command.Parameters.Add("about", SqlDbType.VarChar);
            command.Parameters["about"].Value = city.About;

            command.Parameters.Add("dwellers", SqlDbType.BigInt);
            command.Parameters["dwellers"].Value = city.Dwellers;

            command.Parameters.Add("location", SqlDbType.VarChar);
            command.Parameters["location"].Value = city.Location;

            command.Parameters.Add("weather", SqlDbType.VarChar);
            command.Parameters["weather"].Value = city.Weather;

            command.Parameters.Add("countryId", SqlDbType.Int);
            command.Parameters["countryId"].Value = city.CountryId;

            command.CommandText = query;
            command.Connection = connection;

            long rowAffected = (long)command.ExecuteNonQuery();
            return rowAffected;
            
        }


        public bool IsUnique(City city)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select * From city  where Name = @name  and CountryId = " + city.CountryId;
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Clear();
            command.Parameters.Add("@name", SqlDbType.VarChar);
            command.Parameters["@name"].Value = city.Name;
            command.CommandText = query;
            command.Connection = connection;


            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                return true;
            }

            else
            {
                return false;
            }
        }

        public List<City> GetAllCityInformation()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select City.Name, City.Dwellers, Country.Name as countryName from City inner join Country on City.CountryId = Country.Id";

            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            List<City> countryList = new List<City>();

            while (reader.Read())
            {
                string name = reader["Name"].ToString();
                long dwellers = Convert.ToInt64(reader["Dwellers"]);
                string countryName = reader["countryName"].ToString();
                
                City city = new City(name,  dwellers, countryName);
                countryList.Add(city);

            }

            return countryList;
        } 


        public List<String> GetAllCountryName()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select Name From Country";
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            List<String> countryNameList = new List<String>();

            while (reader.Read())
            {
                string name = reader["Name"].ToString();
                countryNameList.Add(name);

            }
            return countryNameList;
        }

        public int GetSelectedCountryID(string selectedCountry)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "select id from Country where Name =  @selectedCountry " ;
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Clear();
            command.Parameters.Add("@selectedCountry", SqlDbType.VarChar);
            command.Parameters["@selectedCountry"].Value = selectedCountry;
            command.CommandText = query;
            command.Connection = connection;



           int  id =(int)  command.ExecuteScalar();
            connection.Close();
            return id;
        }
    }
}