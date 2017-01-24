using countrycitymanagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace countrycitymanagement.DAL
{
    public class CountryGetway
    {
        //string connectionString = @"Data Source=ShahinAhmed;Initial Catalog=CCManagement; Uid=sa; Password=132188";
        string connectionString = @"Server=.\SQLEXPRESS; Database=CountryCityManagement; Integrated Security=true";
        public int InsertCountry(Country country)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            string query = @"INSERT INTO Country (NAME,ABOUT)VALUES (@name,@about)";
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.Clear();
            command.Parameters.Add("name", SqlDbType.VarChar);
            command.Parameters["name"].Value = country.Name;

            command.Parameters.Add("about", SqlDbType.VarChar);
            command.Parameters["about"].Value = country.About;

            command.CommandText = query;
            command.Connection = connection;

            int rowAffected = command.ExecuteNonQuery();
            return rowAffected;

        }

        public bool IsUnique(Country country)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select * from Country where Name=(@name)";

            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.Add("name", SqlDbType.VarChar);
            command.Parameters["name"].Value = country.Name;
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


        public List<Country> GetALLCountry()
        {

            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select * from Country";
            
            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            List<Country> countryList = new List<Country>();

            while (reader.Read())
            {
                string name = reader["Name"].ToString();
                string about = reader["About"].ToString();
                
                Country country = new Country(name, about);
                countryList.Add(country);

            }

            return countryList;

        }


        
        
    }
}