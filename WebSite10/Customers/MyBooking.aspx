<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="MyBooking.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Show my Bookings</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="booking_ID" 
        DataSourceID="SqlDataSource1" CssClass="mGrid"  
    PagerStyle-CssClass="pgr"  
    AlternatingRowStyle-CssClass="alt">  
        
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="booking_ID" HeaderText="booking_ID" InsertVisible="False" ReadOnly="True" SortExpression="booking_ID" />
            <asp:BoundField DataField="venue_ID" HeaderText="venue_ID" SortExpression="venue_ID" ReadOnly="True" />
            <asp:BoundField DataField="movie_ID" HeaderText="movie_ID" SortExpression="movie_ID" ReadOnly="True" />
            <asp:BoundField DataField="Lounge_ID" HeaderText="Lounge_ID" SortExpression="Lounge_ID" ReadOnly="True" />
            <asp:BoundField DataField="showing_ID" HeaderText="showing_ID" SortExpression="showing_ID" ReadOnly="True" />
            <asp:BoundField DataField="user_ID" HeaderText="user_ID" SortExpression="user_ID" ReadOnly="True" />
            <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" ReadOnly="True" />
            <asp:BoundField DataField="movie_name" HeaderText="movie_name" SortExpression="movie_name" ReadOnly="True" />
            <asp:BoundField DataField="movie_cert" HeaderText="movie_cert" SortExpression="movie_cert" ReadOnly="True" />
            <asp:BoundField DataField="venue_name" HeaderText="venue_name" SortExpression="venue_name" ReadOnly="True" />
            <asp:BoundField DataField="booking_date" HeaderText="booking_date" SortExpression="booking_date" ReadOnly="True" DataFormatString="{0:d}" />
            <asp:BoundField DataField="performance_date" HeaderText="performance_date" SortExpression="performance_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="performance_start" HeaderText="performance_start" SortExpression="performance_start" />
            <asp:BoundField DataField="seat_cat" HeaderText="seat_cat" SortExpression="seat_cat" />
            <asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>"
        SelectCommand="SELECT booking.* FROM booking WHERE user_name=@UserName"
        UpdateCommand="UPDATE booking SET performance_date = @Param1, performance_start = @Param2, seat_cat = @Param3 WHERE (UserID = @Param4)"
        >
          <SelectParameters>
        <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

