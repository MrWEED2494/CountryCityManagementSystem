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
    public partial class ViewCitiesUI : System.Web.UI.Page
    {

        ViewCityManager viewCityManager = new ViewCityManager();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                countryDropDownList.Enabled = false;
                cityTextBox.Enabled = true;

                List<string> allCountryNameList = viewCityManager.GetAllCountryName();
                countryDropDownList.DataSource = allCountryNameList;
                countryDropDownList.DataBind();
            }

            

            List<City> cityinfo = viewCityManager.GetAllCityInformation();
            cityGridView.DataSource = cityinfo;
            cityGridView.DataBind();

        }

        


        protected void searchButton_Click(object sender, EventArgs e)
        {

            string message = "";
            if (RadioButtonList.SelectedValue == "City Name")
            {
                if (cityTextBox.Text != "")
                {
                    string cityName = cityTextBox.Text;

                    List<City> cityinfo = viewCityManager.GetSearchedCityInformation(cityName);
                    if (cityinfo != null)
                    {
                        cityGridView.Visible = true;
                        cityGridView.DataSource = cityinfo;
                        cityGridView.DataBind();
                    }
                    else
                    {
                        cityGridView.Visible = false;
                    }
                }
                else
                {
                    message = "Please enter the city name first";
                }

            }
            else
            {
                string countryName = countryDropDownList.SelectedValue;

                List<City> cityinfo = viewCityManager.GetSearchedCountryInformation(countryName);
                if (cityinfo != null)
                {
                    cityGridView.Visible = true;
                    cityGridView.DataSource = cityinfo;
                    cityGridView.DataBind();
                }
                else
                {
                    cityGridView.Visible = false;
                }
            }

            messageLabel.Text = message;

        }

        

        protected void radioButtons_CheckedChanged(object sender, EventArgs e)
        {
            
            if (RadioButtonList.SelectedValue == "City Name")
            {
                countryDropDownList.Enabled = false;
                cityTextBox.Enabled = true;

            }
            else
            {
                countryDropDownList.Enabled = true;
                cityTextBox.Enabled = false;
                messageLabel.Text = "";

            }
          
        }


        protected void cityGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityGridView.PageIndex = e.NewPageIndex;
            cityGridView.DataBind();
        }
    }
}