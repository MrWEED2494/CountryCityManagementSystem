using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using countrycitymanagement.DAL;
using countrycitymanagement.Models;

namespace countrycitymanagement.BLL
{
    public class ViewCityManager
    {
        ViewCityGetway viewCityGateway = new ViewCityGetway();

        

        public List<City> GetAllCityInformation()
        {
            return viewCityGateway.GetAllCityInformation();
        }


        public List<String> GetAllCountryName()
        {
            List<String> countryNameList = viewCityGateway.GetAllCountryName();
            return countryNameList;
        }


        public List<City> GetSearchedCityInformation(string cityName)
        {
            return viewCityGateway.GetSearchedCityInformation(cityName);
        }

        public List<City> GetSearchedCountryInformation(string countryName)
        {
            return viewCityGateway.GetSearchedCountryInformation(countryName);
        } 
    }
}