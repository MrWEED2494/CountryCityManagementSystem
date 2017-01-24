using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using countrycitymanagement.Models;

namespace countrycitymanagement.DAL
{
    public class ViewCityGetway
    {
        //string connectionString = @"Data Source=ShahinAhmed;Initial Catalog=CCManagement; Uid=sa; Password=132188";

        string connectionString = @"Server=.\SQLEXPRESS; Database=CountryCityManagement; Integrated Security=true";


        

        public List<City> GetAllCityInformation()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select City.Name, City.About, City.Dwellers, City.Location, City.Weather, Country.Name as countryName, Country.About as countryAbout from City inner join Country on City.CountryId = Country.Id";


            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            List<City> cityInformationList = new List<City>();

            while (reader.Read())
            {
                string name = reader["Name"].ToString();
                string about = reader["About"].ToString();
                long dwellers = Convert.ToInt64(reader["Dwellers"]);
                string location = reader["Location"].ToString();
                string weather = reader["Weather"].ToString();

                string countryName = reader["countryName"].ToString();
                string countryAbout = reader["countryAbout"].ToString();

                City city = new City(name, about, dwellers, location, weather, countryName, countryAbout);
                cityInformationList.Add(city);

            }

            return cityInformationList;
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

       

        public List<City> GetSearchedCityInformation(string cityName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select City.Name, City.About, City.Dwellers, City.Location, City.Weather, Country.Name as countryName, Country.About as countryAbout from City inner join Country on City.CountryId = Country.Id and City.Name = @cityName";

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Clear();
            command.Parameters.Add("@cityName", SqlDbType.VarChar);
            command.Parameters["@cityName"].Value = cityName;
            command.CommandText = query;
            command.Connection = connection;

            SqlDataReader reader = command.ExecuteReader();

            List<City> cityInformationList = new List<City>();

            while (reader.Read())
            {
                string name = reader["Name"].ToString();
                string about = reader["About"].ToString();
                long dwellers = Convert.ToInt64(reader["Dwellers"]);
                string location = reader["Location"].ToString();
                string weather = reader["Weather"].ToString();

                string countryName = reader["countryName"].ToString();
                string countryAbout = reader["countryAbout"].ToString();

                City city = new City(name, about, dwellers, location, weather, countryName, countryAbout);
                cityInformationList.Add(city);

            }
            return cityInformationList;
        }

        public List<City> GetSearchedCountryInformation(string countryName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select City.Name, City.About, City.Dwellers, City.Location, City.Weather, Country.Name as countryName, Country.About as countryAbout from City inner join Country on City.CountryId = Country.Id and Country.Name = @countryName";

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Clear();
            command.Parameters.Add("@countryName", SqlDbType.VarChar);
            command.Parameters["@countryName"].Value = countryName;
            command.CommandText = query;
            command.Connection = connection;

            SqlDataReader reader = command.ExecuteReader();

            List<City> cityInformationList = new List<City>();

            while (reader.Read())
            {
                string name = reader["Name"].ToString();
                string about = reader["About"].ToString();
                long dwellers = Convert.ToInt64(reader["Dwellers"]);
                string location = reader["Location"].ToString();
                string weather = reader["Weather"].ToString();

                string country = reader["countryName"].ToString();
                string countryAbout = reader["countryAbout"].ToString();

                City city = new City(name, about, dwellers, location, weather, country, countryAbout);
                cityInformationList.Add(city);

            }
            return cityInformationList;
        } 
    }
}