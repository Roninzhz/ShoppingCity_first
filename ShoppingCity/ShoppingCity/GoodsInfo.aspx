<%@ Page Title="Hi Go商品明细" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="GoodsInfo.aspx.cs" Inherits="ShoppingCity.GoodsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 300px; height: 100px">
        <tr>
            <td colspan="2" style="height: 22px">
                <asp:Image ID="ImgGood" runat="server" />
            </td>
            <td style="height: 22px">货物号:
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>商品名：<asp:Label ID="lblgdName" runat="server"></asp:Label>
            </td>
            <td>运费：<asp:Label ID="lblFeight" runat="server"></asp:Label></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">供货商：<asp:Label ID="lblgdCity" runat="server"></asp:Label>

            </td>
            <td>销量：<asp:Label ID="lblSaleQty" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">单价：<asp:Label ID="lblPrice" runat="server"></asp:Label>

            </td>
            <td>上架时间：<asp:Label ID="lblAddTime" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/send.png" OnClick="ImageButton1_Click" />
            </td>
            <td> <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" DataKeyNames="gdID">
                <Columns>
                    <asp:BoundField DataField="geContent" HeaderText="评价" SortExpression="geContent" />
                    <asp:BoundField DataField="geAddTime" HeaderText="评价时间" SortExpression="geAddTime" />
                </Columns>
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShoppingCity.pingjiaDataContext" TableName="GoodEvaluate" Where="gdID == @gdID" EntityTypeName="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="gdID" QueryStringField="gdid" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
                <br />
                <asp:TextBox ID="txtbnContent" runat="server" Height="85px" TextMode="MultiLine" Width="460px"></asp:TextBox>
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="评价" />
        </div></td>
        </tr>
    </table>
</asp:Content>
