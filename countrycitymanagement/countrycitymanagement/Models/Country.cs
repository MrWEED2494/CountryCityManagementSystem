using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;

namespace countrycitymanagement.Models
{
    public class Country
    {

        public string Name { set; get; }
        public string About { set; get; }
        public int TotalCity { set; get; }
        public long TotalDwellers { set; get; }
        

        public Country(string name, string about)
        {
            this.Name = name;
            this.About = about;
        }

        public Country() { }

        public Country(string name, string about, int totalCity, long totalDwellers)
        {
            this.Name = name;
            this.About = about;
            this.TotalCity = totalCity;
            this.TotalDwellers = totalDwellers;
        }
    }
}