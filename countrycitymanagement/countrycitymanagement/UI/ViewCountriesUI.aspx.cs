using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using countrycitymanagement.BLL;
using countrycitymanagement.DAL;
using countrycitymanagement.Models;

namespace countrycitymanagement.UI
{
    public partial class ViewCountries : System.Web.UI.Page
    {
        ViewCountryManager viewCountryManager = new ViewCountryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            

            List<Country> countryInfo = viewCountryManager.GetAllCountryInformation();
            countryGridView.DataSource = countryInfo;
            countryGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            
            string message = "";
            if (nameTextBox.Text != "")
            {
                string countryName = nameTextBox.Text;


                List<Country> countryInfo = viewCountryManager.GetSearchedCountryInformation(countryName);
                if (countryInfo != null)
                {
                    countryGridView.Visible = true;
                    countryGridView.DataSource = countryInfo;
                    countryGridView.DataBind();
                    
                }
                else
                {
                    countryGridView.Visible = false;
                    
                }

            }
            else
            {
                
                message = "Please enter Country name first !! ";
            }

            messagelabel.Text = message;


        }

        protected void countryGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryGridView.PageIndex = e.NewPageIndex;
            countryGridView.DataBind();
        }
    }
}