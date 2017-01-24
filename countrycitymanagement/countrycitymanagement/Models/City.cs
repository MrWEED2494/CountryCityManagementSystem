using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace countrycitymanagement.Models
{
    public class City
    {
        public string Name { get; set; }

        public string About { get; set; }

        public long Dwellers { get; set; }

        public string Location { get; set; }

        public string Weather { get; set; }

        public int CountryId { get; set; }
        public string CountryName { get; set; }

        public string CountryAbout { get; set; }


        public City(string name, string about, long dwellers, string location, string wether, int countryId)
        {
            this.Name = name;
            this.About = about;
            this.Dwellers = dwellers;
            this.Location = location;
            this.Weather = wether;
            this.CountryId = countryId;
        }

        public City() { }

        public City(string name, long dwellers, string countryName)
        {
            this.Name = name;

            this.Dwellers = dwellers;

            this.CountryName = countryName;
        }

        public City(string name, string about, long dwellers, string location, string weather, string country, string countryAbout)
        {
            this.Name = name;
            this.About = about;
            this.Dwellers = dwellers;
            this.Location = location;
            this.Weather = weather;
            this.CountryName = country;
            this.CountryAbout = countryAbout;
        }

    }
}