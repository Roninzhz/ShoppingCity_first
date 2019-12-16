<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingCity.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Hi Go用户登录</title>
    <link rel="Shortcut Icon" href="ico/Hi_Go.ico" />
    <link rel="Bookmark" href="ico/Hi_Go.ico" />
    <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
    <link href="css/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="login-form">
        <h1>Hi Go</h1>

            <div class="txtb">
                <asp:TextBox ID="txtUName" runat="server"></asp:TextBox>
                <span data-placeholder="Username"></span>
            </div>
        <asp:RequiredFieldValidator ID="reqtxtName" runat="server" ControlToValidate="txtUName" ErrorMessage="必须填写用户名">*</asp:RequiredFieldValidator>
            <div class="txtb">
               <asp:TextBox ID="txtUPwd" runat="server" TextMode="Password"></asp:TextBox>
                <span data-placeholder="Password"></span>
            </div>
         <asp:RequiredFieldValidator ID="reqtxtPwd" runat="server" ControlToValidate="txtUPwd" ErrorMessage="必须填写密码">*</asp:RequiredFieldValidator>
         <br />
         <asp:ValidationSummary ID="Vs" runat="server" />
         <asp:Button ID="submit" runat="server" Text="submit"  CssClass="logbtn" OnClick="submit_Click"/>
          <asp:CheckBox ID="chkState" runat="server" Text="两周内不用登录" />
            &nbsp;<div class="bottom-text">
                Don't have account?<a href="Register.aspx">Sign up</a>
            </div>
        <script type="text/javascript">
        $(".txtb input").on("focus",function(){
            $(this).addClass("focus");
        });

        $(".txtb input").on("blur",function(){
            if($(this).val=="")
            $(this).removeClass("focus");
        });
        </script>
    </form>
</body>
</html>
