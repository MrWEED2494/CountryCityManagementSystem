using System.Security.Cryptography.X509Certificates;
using countrycitymanagement.DAL;
using countrycitymanagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace countrycitymanagement.BLL
{


    public class CityManager
    {
        CityGateway cityGateway = new CityGateway();

        public string InsertCity(City city)
        {
            string message = "Insert Faield";
            bool cityUniq = cityGateway.IsUnique(city);
            if (cityUniq)
            {
                message = "City is Alredy Exist";
            }
            else
            {
                long isCitysaved = cityGateway.InsertCity(city);

                if (isCitysaved > 0)
                {
                    message = "Saved Successfully";
                    return message;
                }

            }
            return message;
        }

        public List<City> GetAllCityInformation()
        {
            return cityGateway.GetAllCityInformation();
        }


        public List<String> GetAllCountryName()
        {
            List<String> countryNameList = cityGateway.GetAllCountryName();
            return countryNameList;
        }


        public int GetSelectedCountryID(string selectedCountry)
        {
            return cityGateway.GetSelectedCountryID(selectedCountry);
        }
    }
}