<%@ Page Title="Hi Go商品列表" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="GoodsList.aspx.cs" Inherits="ShoppingCity.GoodsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tb{width:200px;height:300px;}
        a{text-decoration:none;}
        .img{width:200px;height:200px;border:0;}
        .tdl{width:110px;padding:5px;}
        .tdr{width:80px;padding:5px;}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="position:relative; left:30%;">
            <br />
            【商品展示】<asp:Literal ID="ltCurUser" runat="server"></asp:Literal>
            <br />
            ----------------------------------------------------------------------------------
         <asp:DataList ID="dlstGoods" runat="server" RepeatColumns="3" DataSourceID="sqlGoods" DataKeyField="gdID" OnItemCommand="dlstGoods_ItemCommand">
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
            <asp:SqlDataSource ID="sqlGoods" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DataBase\SMDB.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="select * from [Goods]" />
            <asp:Label ID="lblCurPage" runat="server" Text="" />
            <asp:Label ID="lblTotalPage" runat="server" Text="" />
            <asp:LinkButton ID="lbtnPre" runat="server" OnCommand="LinkBtnClick" CommandName="Pre">上一页</asp:LinkButton>
             <asp:LinkButton ID="lbtnNext" runat="server" OnCommand="LinkBtnClick" CommandName="Next">下一页</asp:LinkButton>
                </div>
</asp:Content>
