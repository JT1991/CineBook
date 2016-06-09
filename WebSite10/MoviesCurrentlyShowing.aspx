<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="MoviesCurrentlyShowing.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>Current Movies </h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="movie_ID"
         DataSourceID="SqlDataSource1" GridLines="None" CssClass="mGrid" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:BoundField DataField="movie_ID" HeaderText="Movie ID" InsertVisible="False" ReadOnly="True" SortExpression="movie_ID" />
            <asp:BoundField DataField="movie_Name" HeaderText="Novie Name" SortExpression="movie_Name" />
            <asp:BoundField DataField="movie_certification" HeaderText="Movie Certification" SortExpression="movie_certification" />
            <asp:BoundField DataField="movie_Opening" HeaderText="Movie Opening" SortExpression="movie_Opening" />
            <asp:BoundField DataField="movie_Closing" HeaderText="Movie Closing" SortExpression="movie_Closing" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>"
         SelectCommand="SELECT movie_ID, movie_Name, movie_certification, movie_Opening, movie_Closing FROM movie
        WHERE  movie_Closing >= DATEADD(day,0,getdate()) and movie_Opening <= getdate()"
        
        >

    </asp:SqlDataSource>
</asp:Content>

