<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="UsersWithoutProfiles.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Users without Profiles</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationId,LoweredUserName" DataSourceID="SqlDataSource1"
        GridLines="None" CssClass="mGrid" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" ReadOnly="True" SortExpression="ApplicationId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="MobileAlias" HeaderText="MobileAlias" SortExpression="MobileAlias" />
            <asp:BoundField DataField="LoweredUserName" HeaderText="LoweredUserName" ReadOnly="True" SortExpression="LoweredUserName" />
            <asp:CheckBoxField DataField="IsAnonymous" HeaderText="IsAnonymous" SortExpression="IsAnonymous" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>" SelectCommand="SELECT aspnet_Users.ApplicationId, aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Users.MobileAlias, aspnet_Users.LoweredUserName, aspnet_Users.IsAnonymous, aspnet_Users.LastActivityDate FROM aspnet_Users LEFT OUTER JOIN UserProfile ON aspnet_Users.UserName = UserProfile.UserName WHERE (UserProfile.UserName IS NULL)"></asp:SqlDataSource>
</asp:Content>

