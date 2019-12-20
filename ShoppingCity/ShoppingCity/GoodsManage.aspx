<%@ Page Title="Hi Go商品信息管理" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="GoodsManage.aspx.cs" Inherits="ShoppingCity.GoodsManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【商品管理】<br />
        ----------------------------------------------------------------------------------------------------------------------<br />
        <asp:Button ID="btnAdd" runat="server" Text="添加商品" OnClick="btnAdd_Click" />
        <asp:Button ID="btnEdit" runat="server" Text="修改商品类型" OnClick="btnEdit_Click" />
        <asp:Button ID="btnChu" runat="server" OnClick="btnChu_Click" Text="登出" />
    </div>
    <br />
    <br />
    <div>
        <asp:GridView ID="grdGoods" runat="server" AutoGenerateColumns="false" DataKeyNames="gdID" BorderWidth="1px" AllowPaging="true" DataSourceID="sqlGoods" PageSize="5">
            <HeaderStyle CssClass="hstyle" />
            <Columns>
                <asp:BoundField DataField="gdCode" ItemStyle-CssClass="center" HeaderText="编号" />
                <asp:BoundField DataField="tName" ItemStyle-CssClass="center" HeaderText="类别" />
                <asp:HyperLinkField DataNavigateUrlFields="gdID" ItemStyle-CssClass="name" HeaderText="名称" DataTextField="gdName"
                    DataNavigateUrlFormatString="" />
                <asp:BoundField DataField="gdPrice" ItemStyle-CssClass="center" HeaderText="价格" DataFormatString="{0:C}" />
                <asp:BoundField DataField="gdQuantity" ItemStyle-CssClass="center" HeaderText="库存量" />
                <asp:BoundField DataField="gdAddTime" ItemStyle-CssClass="center" HeaderText="上架时间" DataFormatString="{0:d}" />
                <asp:TemplateField HeaderText="编辑" ItemStyle-CssClass="center">
                    <ItemTemplate>
                        <a href='EditGood.aspx?gdid=<%#Eval("gdID")%>'>
                            <asp:Image ID="Image1" runat="server" CssClass="noborder" ToolTip="编辑商品" ImageUrl="images/edit.png" />
                        </a>&nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" ToolTip="删除商品" ImageUrl="images/delect.png" CommandName="delete" OnClientClick="return confirm('确定要删除该商品？');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqlGoods" runat="server" ConnectionString="<%$ConnectionStrings:SMDB%>" SelectCommand="select Goods.*,tName from Goods join GoodsType on Goods.tID=GoodsType.tID order by gdAddTime" DeleteCommand="delete from Goods where gdID=@gdID">
            <DeleteParameters>
                <asp:Parameter Name="gdID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
