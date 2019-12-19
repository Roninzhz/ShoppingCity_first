<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pingjia.aspx.cs" Inherits="ShoppingCity.pingjia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" DataKeyNames="geID">
                <Columns>
                    <asp:BoundField DataField="geID" HeaderText="geID" InsertVisible="False" ReadOnly="True" SortExpression="geID" />
                    <asp:BoundField DataField="uID" HeaderText="uID" SortExpression="uID" />
                    <asp:BoundField DataField="gdID" HeaderText="gdID" SortExpression="gdID" />
                    <asp:BoundField DataField="geContent" HeaderText="geContent" SortExpression="geContent" />
                    <asp:BoundField DataField="geAddTime" HeaderText="geAddTime" SortExpression="geAddTime" />
                </Columns>
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShoppingCity.pingjiaDataContext" TableName="GoodEvaluate" Where="gdID == @gdID &amp;&amp; gdID == @gdID1" EntityTypeName="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="gdID" QueryStringField="gdid" Type="Int32" />
                    <asp:QueryStringParameter Name="gdID1" QueryStringField="id" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </div>
    </form>
</body>
</html>
