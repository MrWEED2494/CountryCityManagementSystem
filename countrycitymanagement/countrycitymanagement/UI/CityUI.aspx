<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityUI.aspx.cs" Inherits="countrycitymanagement.UI.CityUI" ValidateRequest="false"  %>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>City Entry</title>

    <script src="../Scripts/tinymce/tinymce.min.js"></script>
    <script src="../Scripts/tinymce/tinymceExample.js"></script>
    <link href="ui.css" rel="stylesheet" />
    <link href="../Content/css/style.css" rel="stylesheet" />

    <script src="../Scripts/tinymce/tinymce.min.js"></script>
    <script src="../Scripts/tinymce/tinymceExample.js"></script>
    
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

        <div id="div">
            <div style="width: 10%; float:left">
                <asp:Label ID="Label1" runat="server" Text="Name" style="vertical-align:top"></asp:Label>
            </div>

            <div style="width: 90%; float:right; ">
                <asp:TextBox ID="nameTextBox" runat="server"  Width="245px" placeholder="City Name" Font-Size="Medium" ></asp:TextBox>
            </div>

        </div>
    
        <div>
            <div style="width: 6%; float:left;">
                <asp:Label ID="Label2" runat="server" Text="About" style="vertical-align:top"></asp:Label>
            </div>

            <div style="width: 90%; float:right; margin-bottom:20px">
                <asp:TextBox ID="aboutTextBox" runat="server" Width="185px" TextMode="MultiLine">
                </asp:TextBox>
            </div>
            <div style="width: 100%; float:left;"></div>

        </div>

        <div >

            <div style="width: 10%; float:left; padding-bottom:16px; margin-right:0; ">
                <asp:Label ID="Label3" runat="server" Text="No. of dwellers" style="vertical-align:top"></asp:Label>
            </div>

            <div style="width: 90%; float:right;  padding-bottom:10px ">
                <asp:TextBox ID="dwellersTextBox" runat="server"  Width="245px" placeholder="No. of dwellers" Font-Size="Medium" ></asp:TextBox>
            </div>
            <div style="width: 100%; float:left;"></div>

        </div>

        <div >

            <div style="width: 10%; float:left; padding-bottom:16px ">
                <asp:Label ID="Label4" runat="server" Text="Location" style="vertical-align:top"></asp:Label>
            </div>

            <div style="width: 90%; float:right; padding-bottom:10px ">
                <asp:TextBox ID="locationTextBox" runat="server"  Width="245px" placeholder="Location" Font-Size="Medium" ></asp:TextBox>
            </div>
            <div style="width: 100%; float:left;"></div>

        </div>

        <div >

            <div style="width: 10%; float:left; padding-bottom:16px">
                <asp:Label ID="Label5" runat="server" Text="Weather" style="vertical-align:top"></asp:Label>
            </div>

            <div style="width: 90%; float:right; padding-bottom:10px ">
                <asp:TextBox ID="weatherTextBox" runat="server"  Width="245px" placeholder="Weather" Font-Size="Medium" ></asp:TextBox>
            </div>
            <div style="width: 100%; float:left;"></div>

        </div>

       <div id="div">

            <div style="width: 60%; float:left; padding-bottom:10px">
                <div style="width: 10%; float:left; padding-bottom:16px">
                    <asp:Label ID="Label6" runat="server" Text="Country" style="vertical-align:top"></asp:Label>
                </div>
                <div style="width: 83%; float:right; padding-bottom:10px; ">
                    <asp:DropDownList ID="countryDropDownList" runat="server" Height="27px" Width="245px" AppendDataBoundItems="false"></asp:DropDownList>
                </div>
            </div>

            <div style="width: 40%; float:right; padding-bottom:10px ">
                <div  style="width: 70%; float:right; padding-bottom:10px; margin-left: 3px;">
                    <asp:Button  ID="saveButton" runat="server" Text="Save" Width="90px" OnClick="saveButton_Click"   />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button   ID="cancelButton" runat="server" Text="Cancel" Width="90px" OnClick="cancelButton_Click"  />
                </div>
            </div>
            
        </div>
        
        <div>
            <div style=" width: 90%; float:right; padding-bottom: 20px">
                <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
        


        <div  style="padding-bottom:100px; padding-top: 20px; margin-left:150px">
           <asp:GridView ID="cityGridView" runat="server" OnPageIndexChanging="cityGridView_OnPageIndexChanging"  AutoGenerateColumns="false" Width="732px" AllowPaging="True" PageSize="5">
                 
            

                <Columns>

                     <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate><%#Eval("Name") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="No. of Dwellers">
                        <ItemTemplate><%#Eval("Dwellers") %></ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Country">
                        <ItemTemplate><%#Eval("countryName") %></ItemTemplate>
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
