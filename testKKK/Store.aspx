<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="testKKK.Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #66FF66;
            text-align: center;
            font-size: xx-large;
            background-color: #FFFF99;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            font-size: x-large;
        }
        .auto-style4 {
            font-size: medium;
            background-color: #FF99FF;
        }
        .新增樣式1 {
            font-family: 微軟正黑體;
        }
        .新增樣式2 {
            font-family: 微軟正黑體;
            background-color: #FF99FF;
        }
        .新增樣式3 {
            font-family: 微軟正黑體;
            background-color: #FF99FF;
        }
        .auto-style5 {
            height: 30px;
        }
        .新增樣式4 {
            font-family: 微軟正黑體;
        }
        col {
            font-family: 微軟正黑體;
        }
        .新增樣式5 {
            font-family: 微軟正黑體;
        }
        .auto-style6 {
            height: 24px;
        }
        .新增樣式6 {
            font-family: 微軟正黑體;
        }
        .auto-style7 {
            font-family: 微軟正黑體;
            font-size: large;
        }
        .auto-style8 {
            color: #149DC9;
            margin-left: 0px;
            background-color: #FFFF99;
        }
        .auto-style9 {
            height: 24px;
            width: 732px;
        }
        .auto-style10 {
            width: 732px;
        }
        .auto-style11 {
            font-size: x-large;
            background-color: #00FF00;
        }
        .auto-style12 {
            background-color: #FFFF66;
        }
        .auto-style13 {
            margin-right: 0px;
        }
    </style>
</head>
<body style="background-position: center center;background-size: cover; background-image: url('desktop-wallpaper-カナヘイの家-kanahei.jpg'); background-repeat: no-repeat; background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <span class="新增樣式1"><strong>歡迎來到茶水間</strong></span></div>
        <table class="auto-style2">
            <tr>
                <td>
                    <asp:Label ID="userLable" runat="server" Text="將顯示使用者資訊" CssClass="auto-style3" style="font-family: 微軟正黑體; background-color: #FF99FF;"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="orderBT" runat="server" CssClass="新增樣式5" style="font-size: large; font-weight: 700" Text="前往訂購" OnClick="orderBT_Click" />
                    <asp:Button ID="resetBT" runat="server" CssClass="新增樣式4" style="font-size: large; font-weight: 700" Text="重建表單" OnClick="resetBT_Click" />
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="drinkDropDown" runat="server" AutoPostBack="True" CssClass="auto-style4" DataSourceID="drinkData" DataTextField="drinkName" DataValueField="drinkId" OnSelectedIndexChanged="drinkDropDown_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="drinkPriceLable" runat="server" CssClass="新增樣式2" Text="X元"></asp:Label>
                    <asp:Label ID="drinkNLable" runat="server" CssClass="新增樣式3" Text="庫存: X個"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style2">
            <tr>
                <td class="auto-style9">
                    <asp:DropDownList ID="cupList" runat="server" CssClass="auto-style7" Visible="False">
                    </asp:DropDownList>
                    <asp:Label ID="cupLB" runat="server" CssClass="auto-style7" Text="杯" Visible="False"></asp:Label>
                    <asp:DropDownList ID="sweetList" runat="server" CssClass="auto-style7" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>半糖</asp:ListItem>
                        <asp:ListItem>少糖</asp:ListItem>
                        <asp:ListItem>微糖</asp:ListItem>
                        <asp:ListItem>無糖</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="iceList" runat="server" CssClass="auto-style7" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>少冰</asp:ListItem>
                        <asp:ListItem>去冰</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="addItemBT" runat="server" CssClass="auto-style7" Text="添加" Enabled="False" OnClick="addItemBT_Click" Visible="False" />
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Image ID="drinkImage" runat="server" />
                </td>
                <td>
                    <asp:GridView ID="orderItemGridView" runat="server" AutoGenerateColumns="False" CssClass="auto-style8" DataKeyNames="orderItem_id" DataSourceID="orderItemDataSource" Visible="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowDataBound="orderItemGridView_RowDataBound" OnRowDeleted="orderItemGridView_RowDeleted">
                        <Columns>
                            <asp:TemplateField HeaderText="orderItem_id" InsertVisible="False" SortExpression="orderItem_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderItem_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderItem_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="飲品" SortExpression="drinkName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editDrinkNameList" runat="server" DataSourceID="editSqlDataSource" DataTextField="drinkName" DataValueField="drinkId" SelectedValue='<%# Bind("drinkId", "{0}") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="editSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drinkId], [drinkName] FROM [drinkTable] WHERE ([drinkId] &gt; @drinkId)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="drinkId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("drinkName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="數量" SortExpression="num">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editCupTB" runat="server" Height="16px" Text='<%# Bind("num") %>' Width="34px" OnTextChanged="editCupTB_TextChanged"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="itemCupLB" runat="server" Text='<%# Bind("num") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="甜度" SortExpression="sweet">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("sweet") %>'>
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>半糖</asp:ListItem>
                                        <asp:ListItem>少糖</asp:ListItem>
                                        <asp:ListItem>微糖</asp:ListItem>
                                        <asp:ListItem>無糖</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("sweet") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="冰度" SortExpression="ice">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("ice") %>'>
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>少冰</asp:ListItem>
                                        <asp:ListItem>去冰</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="小計" SortExpression="subtotal">
                                <EditItemTemplate>
                                    <asp:Label ID="subTotalLB" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="subTotalLB" runat="server" Text='<%# Bind("subtotal") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="drinkId" SortExpression="drinkId" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("drinkId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("drinkId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <asp:Label ID="totalLB" runat="server" CssClass="auto-style11" Text="總價" Visible="False"></asp:Label>
                    <br />
                    <asp:Button ID="cheakBT" runat="server" CssClass="auto-style3" OnClick="cheakBT_Click" Text="確認訂購" Visible="False" />
                    <asp:Button ID="cancelBT" runat="server" CssClass="auto-style3" OnClick="cancelBT_Click" Text="取消訂購" Visible="False" />
                    <br />
                    <asp:Label ID="errorLB" runat="server" CssClass="auto-style12" ForeColor="Red" Text="錯誤提示" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="drinkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drinkName], [drinkId] FROM [drinkTable]" OnSelecting="drinkData_Selecting"></asp:SqlDataSource>
        <asp:SqlDataSource ID="drinkDataSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drinkPrice], [drinkN] FROM [drinkTable] WHERE ([drinkId] = @drinkId)" InsertCommand="INSERT INTO orderTable(order_time, order_phone) VALUES (GETDATE(), @order_phone)" DeleteCommand="DELETE FROM orderTable WHERE (order_Id = @order_Id)">
            <DeleteParameters>
                <asp:SessionParameter Name="order_Id" SessionField="order_id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="order_phone" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drinkDropDown" Name="drinkId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="cancelOrderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM orderItemTable WHERE (order_id = @order_id)" SelectCommand="SELECT order_id FROM orderItemTable">
            <DeleteParameters>
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="drinkDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="drinkDataSelect" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="drinkPrice" HeaderText="drinkPrice" SortExpression="drinkPrice" />
                <asp:BoundField DataField="drinkN" HeaderText="drinkN" SortExpression="drinkN" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="orderItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO orderItemTable(drinkId, order_id, num, sweet, ice) VALUES (@drinkId, @order_id, @num, @sweet, @ice)" SelectCommand="SELECT orderItemTable.orderItem_id, drinkTable.drinkName, orderItemTable.num, orderItemTable.sweet, orderItemTable.ice, orderItemTable.num * drinkTable.drinkPrice AS subtotal, orderItemTable.drinkId FROM orderItemTable INNER JOIN drinkTable ON orderItemTable.drinkId = drinkTable.drinkId WHERE (orderItemTable.order_id = @order_id)" DeleteCommand="DELETE FROM orderItemTable WHERE (orderItem_id = @orderItem_id)" UpdateCommand="UPDATE orderItemTable SET num = @num, sweet = @sweet, ice = @ice, drinkId = @drinkId WHERE (orderItem_id = @orderItem_id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="orderItemGridView" Name="orderItem_id" PropertyName="SelectedDataKey" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="drinkDropDown" Name="drinkId" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
                <asp:ControlParameter ControlID="cupList" Name="num" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="sweetList" Name="sweet" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="iceList" Name="ice" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="orderItemGridView" Name="num" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="orderItemGridView" Name="sweet" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="orderItemGridView" Name="ice" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="orderItemGridView" Name="orderItem_id" PropertyName="SelectedDataKey" />
                <asp:ControlParameter ControlID="orderItemGridView" Name="drinkId" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="clientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT userName FROM userData" UpdateCommand="UPDATE userData SET userMoney = @userMoney WHERE (userName = @userName)">
            <UpdateParameters>
                <asp:SessionParameter Name="userMoney" SessionField="money" />
                <asp:SessionParameter Name="userName" SessionField="name" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="drinkQtDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT orderItemTable.drinkId, SUM(orderItemTable.num) AS totalNum, drinkTable.drinkName, drinkTable.drinkN FROM orderItemTable INNER JOIN drinkTable ON orderItemTable.drinkId = drinkTable.drinkId WHERE (orderItemTable.order_id = @order_id) GROUP BY orderItemTable.drinkId, drinkTable.drinkName, drinkTable.drinkN" UpdateCommand="UPDATE drinkTable SET drinkN = @drinkN WHERE (drinkId = @drinkId)">
            <SelectParameters>
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="drinkN" SessionField="updateQtNum" />
                <asp:SessionParameter Name="drinkId" SessionField="updateQtId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="qtCheakGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style13" DataSourceID="drinkQtDataSource" ForeColor="#333333" GridLines="None" UseAccessibleHeader="False" Visible="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="drinkId" SortExpression="drinkId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("drinkId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="qtIdLB" runat="server" Text='<%# Bind("drinkId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="drinkName" SortExpression="drinkName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("drinkName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="qtNameLB" runat="server" Text='<%# Bind("drinkName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="totalNum" SortExpression="totalNum">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("totalNum") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="totalNumLB" runat="server" Text='<%# Bind("totalNum") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="drinkN" SortExpression="drinkN">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("drinkN") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="cheakQtLB" runat="server" Text='<%# Bind("drinkN") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </form>
</body>
</html>
