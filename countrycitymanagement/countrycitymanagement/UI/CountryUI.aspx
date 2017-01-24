<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryUI.aspx.cs" Inherits="countrycitymanagement.UI.CountryUI" ValidateRequest="false"  %>

<html xmlns="http://www.w3.org/1999/xhtml">


    


<head runat="server">
    <title>Country Entry</title>
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
        <div id ="div">
            <asp:Label ID="Label1" runat="server" Text="Name" style="vertical-align:top"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="nameTextBox" runat="server"  Width="245px" placeholder="Country Name" Font-Size="Medium" ></asp:TextBox>
        </div>
    

        <div style="width: 6%; float:left;">
            <asp:Label ID="Label2" runat="server" Text="About" style="vertical-align:top"></asp:Label>
        </div>

        <div style="width: 94%; float:right; margin-bottom:20px">
            <asp:TextBox ID="aboutTextBox" runat="server" Width="185px" TextMode="MultiLine">
            </asp:TextBox>
            
            <div style="padding-top: 5px">
                <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
            </div>


            <div id="divbutton">
                <asp:Button  ID="saveButton" runat="server" Text="Save" Width="90px" OnClick="saveButton_Click"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button   ID="cancelButton" runat="server" Text="Cancel" Width="90px" OnClick="cancelButton_Click" />
            </div>
            
           

        </div >

       
         
       

        <div style="padding-bottom:100px; margin-left:150px;">
           <asp:GridView ID="CountryEntryGridView" runat="server" OnPageIndexChanging="CountryEntryGridView_OnPageIndexChanging"  AutoGenerateColumns="False" Width="732px" AllowPaging="True" PageSize="5">
                 
            

                <Columns>

                     <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate><%#Eval("Name") %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CountryAbout">
                        <ItemTemplate><%#Eval("About") %></ItemTemplate>
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
