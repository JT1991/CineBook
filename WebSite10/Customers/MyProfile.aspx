<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Profile Page</h2>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" ReadOnly="True" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>" 
    DeleteCommand="DELETE FROM [UserProfile] WHERE [UserID] = @UserID"
     InsertCommand="INSERT INTO [UserProfile] ([UserID], [UserName], [FirstName], [LastName], [Postcode]) VALUES (@UserID, @UserName, @FirstName, @LastName, @Postcode)"
     SelectCommand="SELECT * FROM [UserProfile] WHERE ([UserName] = @UserName)"
     UpdateCommand="UPDATE UserProfile SET FirstName = @Param1, LastName = @Param2, Postcode = @Param3 WHERE (UserID = @Param4)">
    <DeleteParameters>
        <asp:Parameter Name="UserID" Type="Object" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="UserID" Type="Object" />
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Postcode" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Postcode" Type="String" />
        <asp:Parameter Name="UserID" Type="Object" />
        <asp:Parameter Name="UserName" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

