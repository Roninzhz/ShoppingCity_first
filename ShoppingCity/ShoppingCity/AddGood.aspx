<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="AddGood.aspx.cs" Inherits="ShoppingCity.AddGood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="position: relative; left: 30%;">
        【添加商品】<br />
        --------------------------------------------------------------------------------------------------------------<br />
        商品类别 ：<asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource1" DataTextField="tName" DataValueField="tID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB%>" SelectCommand="SELECT * FROM GoodsType"></asp:SqlDataSource>
        <br />
        编&nbsp;&nbsp; 号 ： <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCode" ErrorMessage="请输入正确数字" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        名&nbsp;&nbsp; 称 ： <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="名称不能为空" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        价&nbsp;&nbsp; 格 ： <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="请输入正确价格" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        入库 数量 ： <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQuantity" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtQuantity" ErrorMessage="请输入正确数量" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        供应商城市： <asp:TextBox ID="txtCity" runat="server" Width="121px"></asp:TextBox>
        <br />
        运&nbsp;&nbsp; 费 ： <asp:TextBox ID="txtFeight" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFeight" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtFeight" ErrorMessage="请输入正确价格" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        商品 图片 ： <asp:FileUpload ID="fldImg" runat="server" />
        <br />
        商品 描述 ： <asp:TextBox ID="txtInfo" runat="server" CssClass="auto-style1" Height="98px" Width="258px"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_Add" runat="server" Text="添加" OnClick="btn_Add_Click" Height="30px" Width="100px" />
    </div>
</asp:Content>
