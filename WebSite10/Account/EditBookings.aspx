<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="EditBookings.aspx.cs" Inherits="Default7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Edit Bookings</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="booking_ID" DataSourceID="SqlDataSource1"
        GridLines="None" CssClass="mGrid" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="booking_ID" HeaderText="Booking ID" InsertVisible="False" ReadOnly="True" SortExpression="booking_ID" />
            <asp:BoundField DataField="venue_ID" HeaderText="VenueID" ReadOnly="True" SortExpression="venue_ID" />
            <asp:BoundField DataField="movie_ID" HeaderText="Movie ID" ReadOnly="True" SortExpression="movie_ID" />
            <asp:BoundField DataField="showing_ID" HeaderText="Show ID" ReadOnly="True" SortExpression="showing_ID" />
            <asp:BoundField DataField="user_ID" HeaderText="User ID" ReadOnly="True" SortExpression="user_ID" />
            <asp:BoundField DataField="user_name" HeaderText="Username" ReadOnly="True" SortExpression="user_name" />
            <asp:BoundField DataField="movie_name" HeaderText="Movie Name" ReadOnly="True" SortExpression="movie_name" />
            <asp:BoundField DataField="movie_cert" HeaderText="Movie Cert" ReadOnly="True" SortExpression="movie_cert" />
            <asp:BoundField DataField="venue_name" HeaderText="Venue Name" ReadOnly="True" SortExpression="venue_name" />
            <asp:BoundField DataField="booking_date" HeaderText="Booking Date" ReadOnly="True" SortExpression="booking_date" />
            <asp:BoundField DataField="performance_date" HeaderText="Show Date" SortExpression="performance_date" />
            <asp:BoundField DataField="performance_start" HeaderText="Show Time" SortExpression="performance_start" />
            <asp:BoundField DataField="seat_cat" HeaderText="Seat Cat" SortExpression="seat_cat" />
            <asp:CheckBoxField DataField="status" HeaderText="Booked" SortExpression="status" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [booking] WHERE [booking_ID] = @booking_ID" InsertCommand="INSERT INTO [booking] ([venue_ID], [movie_ID], [Lounge_ID], [showing_ID], [user_ID], [user_name], [movie_name], [movie_cert], [venue_name], [booking_date], [performance_date], [performance_time], [seat_cat], [status]) VALUES (@venue_ID, @movie_ID, @Lounge_ID, @showing_ID, @user_ID, @user_name, @movie_name, @movie_cert, @venue_name, @booking_date, @performance_date, @performance_time, @seat_cat, @status)" SelectCommand="SELECT * FROM [booking]" UpdateCommand="UPDATE [booking] SET [venue_ID] = @venue_ID, [movie_ID] = @movie_ID, [Lounge_ID] = @Lounge_ID, [showing_ID] = @showing_ID, [user_ID] = @user_ID, [user_name] = @user_name, [movie_name] = @movie_name, [movie_cert] = @movie_cert, [venue_name] = @venue_name, [booking_date] = @booking_date, [performance_date] = @performance_date, [performance_time] = @performance_time, [seat_cat] = @seat_cat, [status] = @status WHERE [booking_ID] = @booking_ID">
        <DeleteParameters>
            <asp:Parameter Name="booking_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="venue_ID" Type="Int32" />
            <asp:Parameter Name="movie_ID" Type="Int32" />
            <asp:Parameter Name="showing_ID" Type="Int32" />
            <asp:Parameter Name="user_ID" Type="String" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="movie_name" Type="String" />
            <asp:Parameter Name="movie_cert" Type="String" />
            <asp:Parameter Name="venue_name" Type="String" />
            <asp:Parameter DbType="Date" Name="booking_date" />
            <asp:Parameter DbType="Date" Name="performance_date" />
            <asp:Parameter DbType="Time" Name="performance_time" />
            <asp:Parameter Name="seat_cat" Type="String" />
            <asp:Parameter Name="status" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="venue_ID" Type="Int32" />
            <asp:Parameter Name="movie_ID" Type="Int32" />
            <asp:Parameter Name="showing_ID" Type="Int32" />
            <asp:Parameter Name="user_ID" Type="String" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="movie_name" Type="String" />
            <asp:Parameter Name="movie_cert" Type="String" />
            <asp:Parameter Name="venue_name" Type="String" />
            <asp:Parameter DbType="Date" Name="booking_date" />
            <asp:Parameter DbType="Date" Name="performance_date" />
            <asp:Parameter DbType="Time" Name="performance_time" />
            <asp:Parameter Name="seat_cat" Type="String" />
            <asp:Parameter Name="status" Type="Boolean" />
            <asp:Parameter Name="booking_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

