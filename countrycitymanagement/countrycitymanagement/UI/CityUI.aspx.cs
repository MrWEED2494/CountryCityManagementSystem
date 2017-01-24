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
    public partial class CityUI : System.Web.UI.Page
    {
        CityManager cityManager = new CityManager();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<string> allCountryNameList = cityManager.GetAllCountryName();
                countryDropDownList.DataSource = allCountryNameList;
                countryDropDownList.DataBind();
            }

            List<City> cityinfo = cityManager.GetAllCityInformation();
            cityGridView.DataSource = cityinfo;
            cityGridView.DataBind();

           
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string message = "";

            if (nameTextBox.Text != "" && aboutTextBox.Text != "" && dwellersTextBox.Text != "" &&
                locationTextBox.Text != "" && weatherTextBox.Text != "")
            {
                string name = nameTextBox.Text;
                string about = aboutTextBox.Text;
                string location = locationTextBox.Text;
                string weather = weatherTextBox.Text;

                string selectedCountry = countryDropDownList.SelectedValue;
                int countryId = cityManager.GetSelectedCountryID(selectedCountry);
                message = countryId.ToString();

                bool digitsOnly = dwellersTextBox.Text.All(char.IsDigit);
                if (digitsOnly)
                {
                    int dwellers = Convert.ToInt32(dwellersTextBox.Text);

                    City city = new City(name, about, dwellers, location, weather, countryId);
                    message = cityManager.InsertCity(city);


                    List<City> cityinfo = cityManager.GetAllCityInformation();
                    cityGridView.DataSource = cityinfo;
                    cityGridView.DataBind();



                }
                else
                {
                    message = "Enter valid dwellers number";
                }

            }
            else
            {
                message = "Please enter all information first!!";
            }

            messageLabel.Text = message;
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeUI.aspx");
        }

        protected void cityGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityGridView.PageIndex = e.NewPageIndex;
            cityGridView.DataBind();
        }
    }
}