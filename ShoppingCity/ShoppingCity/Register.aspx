<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShoppingCity.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hi Go用户注册</title>
    <link rel="Shortcut Icon" href="ico/Hi_Go.ico" />
    <link rel="Bookmark" href="ico/Hi_Go.ico" />
    <script src="js/jquery-3.4.1.min.js"></script>
    <link href="css/login.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 388px;
            background: #f1f1f1;
            height: 778px;
            padding: 80px 40px;
            border-radius: 10px;
            position: absolute;
            left: 38%;
            top: 45%;
            transform: translate(-50%,-50%);
            margin-left: 87px;
        }
    </style>
</head>
<body>
    <form id="form" runat="server" class="auto-style1">
        <h1>Register</h1>
        <div class="txtb">
            <asp:TextBox ID="txtuName" runat="server"></asp:TextBox>
            <span data-placeholder="Username"></span>
        </div>
        <asp:RequiredFieldValidator ID="Reusername" runat="server" ControlToValidate="txtuName" ErrorMessage="用户名不能为空" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <div class="txtb">
            <asp:TextBox ID="txtuPwd" runat="server" TextMode="Password"></asp:TextBox>
            <span data-placeholder="Password"></span>
        </div>
        <asp:RequiredFieldValidator ID="Repassword" runat="server" ControlToValidate="txtuPwd" ErrorMessage="密码不能为空" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <div class="txtb">
            <asp:TextBox ID="txtuPwd1" runat="server" TextMode="Password"></asp:TextBox>
            <span data-placeholder="Repasseord"></span>
        </div>
        <asp:RequiredFieldValidator ID="Repassword1" runat="server" ControlToValidate="txtuPwd1" ErrorMessage="确认密码不能为空" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="Com" runat="server" ControlToCompare="txtuPwd" ControlToValidate="txtuPwd1" ErrorMessage="两次密码不一致" ForeColor="#FF3300"></asp:CompareValidator>
        <div class="txtb">
            <asp:TextBox ID="txtuPhone" runat="server" TextMode="Phone"></asp:TextBox>
            <span data-placeholder="Phone"></span>
        </div>
        <asp:RequiredFieldValidator ID="Rephone" runat="server" ControlToValidate="txtuPhone" ErrorMessage="手机号不能为空" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="Regphone1" runat="server" ControlToValidate="txtuPhone" Display="Dynamic" ErrorMessage="请输入正确的手机号码" ForeColor="Red" ValidationExpression="(\(\d{3}\)|\d{3})?\d{8}"></asp:RegularExpressionValidator>
        <div class="txtb">
            <asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox>
            <span data-placeholder="验证码"></span>
        </div>
        <asp:Image ID="Image" runat="server" ImageUrl="~/CheckCode.aspx" />
        <asp:RequiredFieldValidator ID="Rechekcode" runat="server" ControlToValidate="txtCheckCode" ErrorMessage="验证码不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button ID="submit" runat="server" Text="register" CssClass="logbtn" OnClick="btnAdd_Click" />
    </form>
    <script type="text/javascript">
        $(".txtb input").on("focus", function () {
            $(this).addClass("focus");
        });

        $(".txtb input").on("blur", function () {
            if ($(this).val == "")
                $(this).removeClass("focus");
        });
    </script>
</body>
</html>
