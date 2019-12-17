<%@ Page Title="Hi Go留言回复功能" Language="C#" MasterPageFile="~/ShoppingCity.Master" AutoEventWireup="true" CodeBehind="MessageReply.aspx.cs" Inherits="ShoppingCity.MessageReply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="position:relative; left:30%;">
            <asp:Repeater ID="repBBSNote" runat="server" DataSourceID="linqNote" >
            <ItemTemplate>
               <p style="text-align:left; font-size:14px"><asp:Label ID="Label5" runat="server" Text='<%# Eval("bnSubject") %>' /></p>              
                <table class="ba_table">
            <tr>
                <td><div class="ba_title">
                    <asp:Label ID="lbluName" runat="server" Text='<%# Eval("Users.uName") %>' style="font-weight: 700" />&nbsp;
                    于<asp:Label ID="Label1" runat="server" Text='<%# Eval("bnAddTime") %>' />&nbsp;
                    发表</div></td>
            </tr>
            <tr>
                <td><div class="ba_content">
                    <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("bnContent") %>' />
                </td>
            </tr>            
        </table>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="repBBSAnswer" runat="server" DataSourceID="linqAnswer" >
          
        <ItemTemplate>
        <table class="ba_table">
            <tr>
                <td><div class="ba_title">
                    <asp:Label ID="lbluName" runat="server" Text='<%# Eval("Users.uName")%>' style="font-weight: 700" />&nbsp;
                    于<asp:Label ID="timeLabel" runat="server" Text='<%# Eval("baAddTime") %>' />&nbsp;进行回复：</div></td>
            </tr>
            <tr>
                <td><div class="ba_content">
                    <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("baContent") %>' />
                </td>
            </tr>            
        </table>
        </ItemTemplate>
    </asp:Repeater>
           <asp:LinqDataSource ID="linqAnswer" runat="server" ContextTypeName="ShoppingCity.BBSDataContext" TableName="BBSAnswer" EntityTypeName="" Where="bnID == @bnID">
             <WhereParameters>
                 <asp:QueryStringParameter Name="bnID" QueryStringField="id" Type="Int16" />
             </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="linqNote" runat="server" ContextTypeName="ShoppingCity.BBSDataContext" TableName="BBSNote" EntityTypeName="" Where="bnID == @bnID">
             <WhereParameters>
                 <asp:QueryStringParameter Name="bnID" QueryStringField="id" Type="Int16" />
             </WhereParameters>
         </asp:LinqDataSource> 
            <br />
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="回复主题" />
            <br />
            <br />
            <asp:TextBox ID="txtbaContent" runat="server" Height="82px" Width="385px"></asp:TextBox>
        </div>
</asp:Content>
