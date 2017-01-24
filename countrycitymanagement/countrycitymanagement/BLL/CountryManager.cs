using countrycitymanagement.DAL;
using countrycitymanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;


namespace countrycitymanagement.BLL
{
    public class CountryManager
    {
        private CountryGetway countryGetway = new CountryGetway();

        public string InsertCountry(Country country)
        {
             
            string message = "Insertion Faield";
             
                bool isCountry = countryGetway.IsUnique(country);
                if (isCountry)
                {
                    message = "Country Name is Already Exists";
                    return message;
                }
                else
                {
                    int isSaved = countryGetway.InsertCountry(country);
                    if (isSaved > 0)
                    {
                        message = "Save Successfully";
                    }
                    return message;
                }

            }

        public List<Country> GetAllCountry()
        {
            List<Country> allCountry = countryGetway.GetALLCountry();
            return allCountry;
        }

        
       

    }

}


