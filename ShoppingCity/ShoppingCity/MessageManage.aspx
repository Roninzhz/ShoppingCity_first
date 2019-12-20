<%@ Page Title="Hi Go留言板管理" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="MessageManage.aspx.cs" Inherits="ShoppingCity.MessageManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="text-align: left">
            留言板
        </div>
        <hr />
        <asp:Repeater ID="repBBSNote" runat="server" DataSourceID="linqBBS">
            <HeaderTemplate>
                <table class="table">
                    <tr>
                        <th>标题</th>
                        <th>发表人</th>
                        <th>发表时间</th>
                    </tr>
                </table>
            </HeaderTemplate>
            <AlternatingItemTemplate>
                <tr class="title">
                    <td>
                        <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("bnSubject") %>' Width="100px"/>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Users.uName") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("bnAddTime") %>'/>
                    </td>
                    <td><a href='MessageReply.aspx?id=<%# Eval("bnID") %>'>查看</a></td>
                    <br />
                    <br />
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:LinqDataSource ID="linqBBS" runat="server" ContextTypeName="ShoppingCity.BBSDataContext" EntityTypeName="" TableName="BBSNote">
        </asp:LinqDataSource>
        <div style="text-align: left;">
            主题：<asp:TextBox ID="txtbnSubject" runat="server"></asp:TextBox>
            <br />
            内容：<asp:TextBox ID="txtbnContent" runat="server" Height="85px" TextMode="MultiLine" Width="460px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="留言" Height="30px" Width="100px" />
        </div>
    </div>
</asp:Content>
