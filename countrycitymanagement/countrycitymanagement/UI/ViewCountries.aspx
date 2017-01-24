<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountries.aspx.cs" Inherits="countrycitymanagement.UI.ViewCountries" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Countries</title>
    <link href="ui.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:100px; margin-right:400px; margin-bottom:50px">
            <fieldset style="height: 70px"  >
                <legend>Search Criteria</legend>

                    <div style="padding-left:50px; padding-top:20px">
                        <asp:Label ID="Label1" runat="server" Text="Name" style="vertical-align:top"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" Width="245px" Height="20" style="vertical-align:middle"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Button" Width="90px" />
                    </div>

            </fieldset>
        </div>
        
        
        <div>
            <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <asp:GridView ID="GridView" runat="server" AllowPaging="True" PageSize="5">
                
               
                
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
            
            </asp:GridView>
        </div>
        

    </form>
</body>
</html>
