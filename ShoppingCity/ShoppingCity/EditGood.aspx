<%@ Page Title="Hi Go商品修改" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="EditGood.aspx.cs" Inherits="ShoppingCity.EditGood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【修改商品】<br />
        --------------------------------------------------------------------------------------------------------------<br />
        商品ID ：&nbsp;
        <asp:Label ID="lblID" runat="server"></asp:Label>
        <br />
        商品类别：&nbsp;
        <asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource1" DataTextField="tName" DataValueField="tID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB%>" SelectCommand="SELECT * FROM GoodsType"></asp:SqlDataSource>
        <br />
        编&nbsp; 号 ：&nbsp;
        <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
        <br />
        名&nbsp; 称 ：&nbsp;
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        价&nbsp; 格 ：&nbsp;
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        <br />
        入库数量：&nbsp;
        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <br />
        销&nbsp; 量 ：&nbsp;
        <asp:Label ID="lblSaleQty" runat="server"></asp:Label>
        <br />
        供应商城市：<asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        <br />
        运&nbsp; 费 ：&nbsp;
        <asp:TextBox ID="txtFeight" runat="server"></asp:TextBox>
        <br />
        商品图片：&nbsp;
        <asp:FileUpload ID="fldImg" runat="server" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="img" runat="server" Width="143px" />
        <br />
        商品描述：&nbsp;
        <asp:TextBox ID="txtInfo" runat="server" CssClass="auto-style1" Height="98px" Width="258px"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_Edit" runat="server" Text="修改" OnClick="btn_Edit_Click" Height="30px" Width="100px" />
    </div>
</asp:Content>
