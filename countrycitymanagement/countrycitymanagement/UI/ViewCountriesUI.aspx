<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountriesUI.aspx.cs" Inherits="countrycitymanagement.UI.ViewCountries" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Countries</title>
    <link href="ui.css" rel="stylesheet" />
     <link href="../Content/css/style.css" rel="stylesheet" />
</head>
<body>

     <header>
			<section class="wrapper header">
				<div class="header_left">
                    <img src="../Content/images/tanvir3.png" />
				</div>
				<div class="nav">
					<ul>
						<li><a class="active" href="HomeUI.aspx">Home</a></li>
                        <li><a href="CountryUI.aspx">Add country</a></li>                      						
						<li><a href="CityUI.aspx">Add city</a></li>
                        <li><a href="ViewCitiesUI.aspx">View city</a></li>
						<li><a href="ViewCountriesUI.aspx">View country</a></li>
						
					</ul>
				</div>
			</section>
		</header>
    <form id="form1" runat="server">
        <div style="margin-left:100px; margin-right:400px; margin-bottom:50px">
            <fieldset style="height: 70px"  >
                <legend>Search Criteria</legend>

                    <div style="padding-left:50px; padding-top:20px">
                        <asp:Label ID="Label1" runat="server" Text="Name" style="vertical-align:top"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="nameTextBox" runat="server"  Width="245px" placeholder="Country Name" Height="20" style="vertical-align:middle"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="searchButton" runat="server" Text="Search" Width="90px" OnClick="searchButton_Click" />
                    </div>

            </fieldset>
        </div>
        
        <div style="padding-left: 200px; padding-bottom: 20px">
            <asp:Label ID="messagelabel" runat="server" Text=""></asp:Label>
        </div>

        <div style="padding-bottom:100px; margin-left:50px;" >
           <asp:GridView ID="countryGridView" runat="server" AllowPaging="True" OnPageIndexChanging="countryGridView_OnPageIndexChanging"  AutoGenerateColumns="false" Width="1033px" PageSize="5">
                 
            

                <Columns>

                     <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Country Name">
                        <ItemTemplate><%#Eval("name") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="About">
                        <ItemTemplate><%#Eval("about") %></ItemTemplate>
                    </asp:TemplateField>
                    
                   <asp:TemplateField HeaderText="No. of cities">
                        <ItemTemplate><%#Eval("totalCity") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="No. of city Dwellers">
                        <ItemTemplate><%#Eval("totalDwellers") %></ItemTemplate>
                    </asp:TemplateField>
                    

                </Columns>

                
            </asp:GridView>
            
        </div>
        

    </form>

     <section class="full_wrapper cr_full">
			<section class="wrapper cr">
				<p><br/>&copy Lazy.pngCoder All Rights Reserved.</p>
			</section>
		</section>
</body>
</html>
