<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ViewMoviesByVenue.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Search A Cinema For Current Showings</h2>
    <div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [venue_ID], [venue_name] FROM [venue]" EnableViewState="False"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="venue_name" DataValueField="venue_ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ViewStateMode="Enabled">
    <asp:ListItem Text="-Select Venue-" Value="" />
    </asp:DropDownList>
        <div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>"
         SelectCommand="SELECT venue.venue_ID, venue.venue_name, movie_Showing.showing_ID, movie.movie_ID, movie.movie_Name, 
        movie_Showing.showing_From_Date, movie_Showing.showing_To_Date, movie.movie_certification FROM venue INNER JOIN movie_Showing ON venue.venue_ID = movie_Showing.venue_ID 
        INNER JOIN movie ON movie_Showing.movie_ID = movie.movie_ID
        WHERE
        movie_Showing.showing_To_Date >= DATEADD(day,0,getdate()) and movie_Showing.showing_From_Date <= getdate()
        and venue.venue_ID=@venue_ID
         "
        >
        <SelectParameters>
            <asp:ControlParameter ControlId="DropDownList2" Name="venue_ID" PropertyName="SelectedValue"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="venue_ID,showing_ID,movie_ID" DataSourceID="SqlDataSource2"
        GridLines="None" CssClass="mGrid" AlternatingRowStyle-CssClass="alt">
        
        <Columns>
            <asp:BoundField DataField="venue_name" HeaderText="Venue Name" SortExpression="venue_name" />
            <asp:BoundField DataField="movie_Name" HeaderText="Movie Name" SortExpression="movie_Name" />
            <asp:BoundField DataField="showing_From_Date" HeaderText="Opening Date" SortExpression="showing_From_Date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="showing_To_Date" HeaderText="Closing Date" SortExpression="showing_To_Date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="movie_certification" HeaderText="Movie Certification" SortExpression="movie_certification" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
            </div>
    </asp:Content>

