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
    public class ViewCountryGetWay
    {
        //string connectionString = @"Data Source=ShahinAhmed;Initial Catalog=CCManagement; Uid=sa; Password=132188";
        string connectionString = @"Server=.\SQLEXPRESS; Database=CountryCityManagement; Integrated Security=true";
        public List<Country> GetAllCountryInformation()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT Country.Name as countryName, Country.About as countryAbout, COUNT(City.Name) as totalCity, COALESCE(SUM(City.Dwellers),0) as totalDwellers FROM City Right outer JOIN Country ON City.CountryId=Country.Id GROUP BY Country.About, Country.Name";

            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            List<Country> countryInformationList = new List<Country>();

            while (reader.Read())
            {
                string name = reader["countryName"].ToString();
                string about = reader["countryAbout"].ToString();
                int totalCity = Convert.ToInt32(reader["totalCity"]);
                long totalDwellers = Convert.ToInt64(reader["totalDwellers"]);

                Country country = new Country(name, about, totalCity, totalDwellers);
                countryInformationList.Add(country);

            }

            return countryInformationList;
        }


        public List<Country> GetSearchedCountryInformation(string countryName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT name, about, totalCity, totalDwellers FROM CountryInfo where name = @countryName";

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Clear();
            command.Parameters.Add("@countryName", SqlDbType.VarChar);
            command.Parameters["@countryName"].Value = countryName;
            command.CommandText = query;
            command.Connection = connection;

            SqlDataReader reader = command.ExecuteReader();

            List<Country> countryInformationList = new List<Country>();

            while (reader.Read())
            {
                string name = reader["name"].ToString();
                string about = reader["about"].ToString();
                int totalCity = Convert.ToInt32(reader["totalCity"]);
                long totalDwellers = Convert.ToInt64(reader["totalDwellers"]);



                Country country = new Country(name, about, totalCity, totalDwellers);
                countryInformationList.Add(country);

            }

            return countryInformationList;
        } 
    }
}