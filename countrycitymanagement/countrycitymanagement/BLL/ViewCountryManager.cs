using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using countrycitymanagement.DAL;
using countrycitymanagement.Models;

namespace countrycitymanagement.BLL
{
    public class ViewCountryManager
    {
        ViewCountryGetWay viewCountryGateway = new ViewCountryGetWay();

        public List<Country> GetAllCountryInformation()
        {
            return viewCountryGateway.GetAllCountryInformation();
        }


        public List<Country> GetSearchedCountryInformation(string countryName)
        {
            return viewCountryGateway.GetSearchedCountryInformation(countryName);
        }

        
    }
}