<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCitiesUI.aspx.cs" Inherits="countrycitymanagement.UI.ViewCitiesUI" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Cities</title>
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
        <div style="padding-left: 100px; padding-right: 400px; margin-bottom:50px">
            <fieldset >
                <legend>Search Criteria</legend>

                <div style="padding-left:30px; width: 15%; float:left;">
                    <asp:RadioButtonList ID="RadioButtonList" runat="server" Height="78px" AutoPostBack="True" OnSelectedIndexChanged="radioButtons_CheckedChanged" >
                        <asp:ListItem Selected="True" >City Name</asp:ListItem>
                        <asp:ListItem>Country</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div style="width: 80%; float:right;">
                    <asp:TextBox ID="cityTextBox" runat="server" Width="245px" placeholder="City Name"  Height="25px"  ></asp:TextBox>
                    <br />
                    <br />
                    <div>
                        <asp:DropDownList ID="countryDropDownList" runat="server" Height="27px" Width="245px"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="searchButton" runat="server" Text="Search" Width="90px" OnClick="searchButton_Click"/>
                    </div>
                
                </div>
            

            </fieldset>
        </div>
        
        <div style="padding-left: 200px; padding-bottom: 20px">
            <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
        </div>
        

        <div style="padding-bottom:100px; margin-left:50px;" >
           <asp:GridView ID="cityGridView" runat="server" AllowPaging="True" OnPageIndexChanging="cityGridView_OnPageIndexChanging"  AutoGenerateColumns="false" Width="1033px" PageSize="5">
                 
            

                <Columns>

                     <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="City Name">
                        <ItemTemplate><%#Eval("Name") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="About">
                        <ItemTemplate><%#Eval("About") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="No. of Dwellers">
                        <ItemTemplate><%#Eval("Dwellers") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate><%#Eval("Location") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Weather">
                        <ItemTemplate><%#Eval("Weather") %></ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Country">
                        <ItemTemplate><%#Eval("countryName") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="About Country">
                        <ItemTemplate><%#Eval("countryAbout") %></ItemTemplate>
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
