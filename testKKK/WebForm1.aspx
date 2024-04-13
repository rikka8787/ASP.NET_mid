<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="testKKK.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
            color: #66FF66;
            background-color: #FFFF99;
        }
        .新增樣式1 {
            font-family: 微軟正黑體;
        }
        .新增樣式2 {
            font-family: 微軟正黑體;
        }
        .新增樣式3 {
            font-family: 微軟正黑體;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style10 {
            font-family: 微軟正黑體;
            font-size: large;
        }
        .auto-style11 {
            font-family: 微軟正黑體;
            margin-left: 0px;
            margin-bottom: 0px;
        }
        .auto-style12 {
            height: 39px;
            text-align: center;
        }
        .auto-style13 {
            text-align: center;
        }
        .auto-style14 {
            font-size: large;
            margin-left: 15px;
        }
        .auto-style15 {
            height: 39px;
        }
        .新增樣式4 {
            font-family: 微軟正黑體;
        }
    </style>
</head>
<body style="background-position: center center;background-size: cover; background-image: url('desktop-wallpaper-カナヘイの家-kanahei.jpg'); background-repeat: no-repeat; background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <span class="新增樣式4"><strong>歡迎來到茶水間</strong></span></div>
        <table class="auto-style3" style="position: relative">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style12"><strong>
                    <asp:Label ID="Label3" runat="server" CssClass="auto-style10" Text="帳號"></asp:Label>
                    </strong>
                    <asp:TextBox ID="accountBT" runat="server" CssClass="auto-style14"></asp:TextBox>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style12"><strong>
                    <asp:Label ID="Label2" runat="server" CssClass="auto-style10" Text="密碼"></asp:Label>
                    </strong>
                    <asp:TextBox ID="passwordBT" runat="server" CssClass="auto-style14" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">
                    <asp:Button ID="entryButton" runat="server" CssClass="auto-style11" Height="35px" Text="登入" Width="83px" OnClick="Button2_Click" />
                    <strong>
                    <asp:LinkButton ID="entry0" runat="server" CssClass="auto-style10" Visible="False" PostBackUrl="~/Store.aspx">進入商店</asp:LinkButton>
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:DetailsView ID="clientDetailView" runat="server" AutoGenerateRows="False" DataSourceID="clientDetail" EmptyDataText="帳號密碼錯誤" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                <asp:BoundField DataField="userMoney" HeaderText="userMoney" SortExpression="userMoney" />
                <asp:BoundField DataField="userPhone" HeaderText="userPhone" SortExpression="userPhone" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="clientDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT userName, userMoney, userPhone FROM userData WHERE (userName = @userName) AND (userPassword = @userPassword)">
            <SelectParameters>
                <asp:ControlParameter ControlID="accountBT" Name="userName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordBT" Name="userPassword" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>