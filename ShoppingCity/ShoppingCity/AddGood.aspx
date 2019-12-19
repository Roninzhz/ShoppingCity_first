<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="AddGood.aspx.cs" Inherits="ShoppingCity.AddGood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="position: relative; left: 30%;">
        【添加商品】<br />
        --------------------------------------------------------------------------------------------------------------<br />
        商品类别：<asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource1" DataTextField="tName" DataValueField="tID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB%>" SelectCommand="SELECT * FROM GoodsType"></asp:SqlDataSource>
        <br />
        编号：<asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
        <br />
        名称：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        价格：<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        <br />
        入库数量：<asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <br />
        供应商城市：<asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        <br />
        运费：<asp:TextBox ID="txtFeight" runat="server"></asp:TextBox>
        <br />
        商品图片：<asp:FileUpload ID="fldImg" runat="server" />
        <br />
        商品描述：<asp:TextBox ID="txtInfo" runat="server" CssClass="auto-style1" Height="98px" Width="258px"></asp:TextBox>
        <br />
        <asp:Button ID="btn_Add" runat="server" Text="添加" OnClick="btn_Add_Click" />
    </div>
</asp:Content>
