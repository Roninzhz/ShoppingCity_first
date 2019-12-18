<%@ Page Title="Hi Go商品列表" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="GoodsList.aspx.cs" Inherits="ShoppingCity.GoodsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery-3.4.1.min.js"></script>
        <link href="css/picstyle.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/search.css" type="text/css" />
    <style type="text/css">
        .tb{width:200px;height:300px;}
        a{text-decoration:none;}
        .img{width:200px;height:200px;border:0;}
        .tdl{width:110px;padding:5px;}
        .tdr{width:80px;padding:5px;}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="zySearch" id="zySearch"></div>
<script type="text/javascript" src="js/zySearch.js"></script>
<script type="text/javascript">
    $("#zySearch").zySearch({
        "width": "355",
        "height": "33",
        "parentClass": "pageTitle",
        "callback": function (keyword) {
            console.info("搜索的关键字");
            console.info(keyword);
        }
    });
</script>
     <p id="loading">loading...</p>
        <div id="images">
            <div class="lighten">
                <img src="images/lighten1.jpg" alt="" />
                <img src="images/lighten2.jpg" alt="" />
                <img src="images/lighten3.jpg" alt="" />
                <img src="images/lighten4.jpg" alt="" />
            </div>
            <div class="normal">
                <img src="images/normal1.jpg" alt="" />
                <img src="images/normal2.jpg" alt="" />
                <img src="images/normal3.jpg" alt="" />
                <img src="images/normal4.jpg" alt="" />
            </div>
            <nav>
                <ul>
                    <li class="pre"></li>
                    <li class="next"></li>
                </ul>
            </nav>
        </div>
     <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="留言" />
            <asp:Button ID="btnChu" runat="server" OnClick="btnChu_Click" Text="登出" />
            <br />
            【商品展示】<asp:Literal ID="ltCurUser" runat="server"></asp:Literal>
            <br />
            索条件：<br />
            ----------------------------------------------------------------------------------------------------------------------<br />
            关键字：<asp:TextBox ID="txtGName" runat="server"></asp:TextBox>
            <br />
            <br />
            类别：<asp:DropDownList ID="ddlGType" runat="server" DataSourceID="sqlGType" DataTextField="tName" DataValueField="tID" OnDataBound="ddlGType_DataBound">
            </asp:DropDownList>
            <br />
            <br />
            价格区间：<asp:TextBox ID="txtPriceLow" runat="server" Width="56px"></asp:TextBox>
            -<asp:TextBox ID="txtPriceHigh" runat="server" Width="56px"></asp:TextBox>
            <br />
            <br />
            销售量： 
            <asp:RadioButtonList ID="rdltSaleQty" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                <asp:ListItem>显示全部</asp:ListItem>
                <asp:ListItem Value="19">20以下</asp:ListItem>
                <asp:ListItem Value="49">20-49</asp:ListItem>
                <asp:ListItem Value="50">50件以上</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="搜索" />
            <br />
            <br />
                  <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" DataSourceID="sqlGoods" DataKeyField="gdID" OnItemCommand="dlstGoods_ItemCommand" Visible="False">
                <ItemTemplate>
                    <table class="tb">
                        <tr>
                            <td colspan="2"><a href="#"><asp:Image ID="Image1" runat="server" ToolTip='<%#Eval("gdName") %>' CssClass="img" ImageUrl='<%#Eval("gdImage","images/goods/{0}") %>' /></a></td>
                        </tr>
                        <tr><td>
                            <a href="#">
                                <asp:Label ID="lbl1" runat="server" Text='<%#Eval("gdName") %>' />
                            </a>
                            </td></tr>
                        <tr><td class="tdl">价格：
                            <asp:Literal ID="lbl2" runat="server" Text='<%#Eval("gdPrice","{0:C}") %>' />
                            <td class="tdr">运费：
                            <asp:Literal ID="lt1" runat="server" Text='<%#Eval("gdFeight","{0:C}") %>' /></td>
                            </td></tr>
                        <tr><td class="tdl">已售：
                            <asp:Literal ID="lt2" runat="server" Text='<%#Eval("gdSaleQty","{0}件") %>' />
                            </td><td class="tdr">评价数：
                                 <asp:Literal ID="lt3" runat="server" Text='<%#Eval("gdEvNum") %>' />
                                 </td></tr>
                        <td class="tdaddshop">
                                <asp:ImageButton CommandName="addShop" runat="server" AlternateText="加入到购物车" ImageUrl="images/add.png"/>
                                 </td>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            ----------------------------------------------------------------------------------
         <asp:DataList ID="dlstGoods" runat="server" RepeatColumns="3" DataSourceID="sqlGood0" DataKeyField="gdID" OnItemCommand="dlstGoods_ItemCommand">
                <ItemTemplate>
                    <table class="tb">
                        <tr>
                            <td colspan="2"><a href="#"><asp:Image ID="Image1" runat="server" ToolTip='<%#Eval("gdName") %>' CssClass="img" ImageUrl='<%#Eval("gdImage","images/goods/{0}") %>' /></a></td>
                        </tr>
                        <tr><td>
                            <a href="#">
                                <asp:Label ID="lbl1" runat="server" Text='<%#Eval("gdName") %>' />
                            </a>
                            </td></tr>
                        <tr><td class="tdl">价格：
                            <asp:Literal ID="lbl2" runat="server" Text='<%#Eval("gdPrice","{0:C}") %>' />
                            <td class="tdr">运费：
                            <asp:Literal ID="lt1" runat="server" Text='<%#Eval("gdFeight","{0:C}") %>' /></td>
                            </td></tr>
                        <tr><td class="tdl">已售：
                            <asp:Literal ID="lt2" runat="server" Text='<%#Eval("gdSaleQty","{0}件") %>' />
                            </td><td class="tdr">评价数：
                                 <asp:Literal ID="lt3" runat="server" Text='<%#Eval("gdEvNum") %>' />
                                 </td></tr>
                        <td class="tdaddshop">
                                <asp:ImageButton CommandName="addShop" runat="server" AlternateText="加入到购物车" ImageUrl="images/add.png"/>
                                 </td>
                    </table>
                </ItemTemplate>
                <FooterTemplate>
                            <a href="ShoppingCarManage.aspx">购物车</a>
                </FooterTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="sqlGoods" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB%>" ProviderName="System.Data.SqlClient" SelectCommand="select * from [Goods]" />
            <asp:SqlDataSource ID="sqlGType" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB%>" SelectCommand="SELECT * FROM [GoodsType]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlGoods0" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB%>" SelectCommand="SELECT Goods.*,GoodsType.tName from [Goods]
            inner join [GoodsType] on Goods.tID=GoodsType.tID"></asp:SqlDataSource>
            <asp:Label ID="lblCurPage" runat="server" Text="" />
            <asp:Label ID="lblTotalPage" runat="server" Text="" />
            <asp:LinkButton ID="lbtnPre" runat="server" OnCommand="LinkBtnClick" CommandName="Pre">上一页</asp:LinkButton>
             <asp:LinkButton ID="lbtnNext" runat="server" OnCommand="LinkBtnClick" CommandName="Next">下一页</asp:LinkButton>
                </div>
</asp:Content>
