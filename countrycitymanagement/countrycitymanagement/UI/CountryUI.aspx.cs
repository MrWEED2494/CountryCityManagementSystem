using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using countrycitymanagement.BLL;
using countrycitymanagement.Models;

namespace countrycitymanagement.UI
{
    public partial class CountryUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();

        protected void Page_Load(object sender, EventArgs e)
        {

            List<Country> allCountries = countryManager.GetAllCountry();
            CountryEntryGridView.DataSource = allCountries;
            CountryEntryGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {



            string message = "";  

            if (nameTextBox.Text != "" && aboutTextBox.Text != "")
            {
                Country country = new Country(nameTextBox.Text, aboutTextBox.Text);
                message = countryManager.InsertCountry(country);

                List<Country> allCountries = countryManager.GetAllCountry();
                CountryEntryGridView.DataSource = allCountries;
                CountryEntryGridView.DataBind();
                
            }
            else
            {
                message = "Please enter all information first!!";
            }
           // Response.Write(message);
            messageLabel.Text = message;

        }


        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeUI.aspx");
            

        }


        protected void CountryEntryGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CountryEntryGridView.PageIndex = e.NewPageIndex;
            CountryEntryGridView.DataBind();
        }
    }
}