<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="CreateABooking.aspx.cs" Inherits="Default5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="Scripts/jquery-2.1.4.min.js"></script>
        <style type="text/css">
        .hideGridColumn
        {
            display: none;
        }
    </style>
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Book a Ticket</h2>
    <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" /> 
    <div class="container">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Choose Cinema"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="venue_name" DataValueField="venue_ID" Height="18px" Width="122px" AppendDataBoundItems="true">
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>" SelectCommand="SELECT [venue_ID], [venue_name] FROM [venue]"></asp:SqlDataSource>
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Choose Film"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="movie_Name" DataValueField="movie_ID" Height="16px" AppendDataBoundItems="true">
            <asp:ListItem>---Choose Film----</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [movie_ID], [movie_Name] FROM [movie]
               WHERE
        movie.movie_Closing >= DATEADD(day,0,getdate()) and movie.movie_Opening <= getdate()">
        </asp:SqlDataSource>
         
    </div>
    <div>
        <asp:Label ID="Label3" runat="server" Text="Choose Date"></asp:Label>
        <asp:DropDownList ID="DropDownListDate" runat="server" OnSelectedIndexChanged="DropDownListDate_SelectedIndexChanged" EnableTheming="True" DataTextFormatString="{0:d}">
            <asp:ListItem> -- Pick a date --</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Check Booking" OnClick="Button1_Click" /> </div>
    <div>

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False"  
           GridLines="None" CssClass="mGrid" AlternatingRowStyle-CssClass="alt" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="venue_ID" HeaderText="venue_ID" SortExpression="venue_ID" InsertVisible="False" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
                <asp:BoundField DataField="venue_name" HeaderText="venue_name" SortExpression="venue_name" />
                <asp:BoundField DataField="showing_ID" HeaderText="showing_ID" SortExpression="showing_ID" InsertVisible="False" ReadOnly="True" DataFormatString="{0:d}" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
                <asp:BoundField DataField="movie_ID" HeaderText="movie_ID" SortExpression="movie_ID" InsertVisible="False" ReadOnly="True" DataFormatString="{0:d}" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn" >
<HeaderStyle CssClass="hideGridColumn"></HeaderStyle>

<ItemStyle CssClass="hideGridColumn"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="movie_Name" HeaderText="movie_Name" SortExpression="movie_Name" />
                <asp:BoundField DataField="movie_certification" HeaderText="movie_certification" SortExpression="movie_certification" />
                <asp:BoundField DataField="showing_From_Date" HeaderText="showing_From_Date" SortExpression="showing_From_Date" />
                <asp:BoundField DataField="showing_To_Date" HeaderText="showing_To_Date" SortExpression="showing_To_Date" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>"
             SelectCommand="SELECT movie.movie_ID, movie.movie_Name, movie.movie_certification, movie_showing.showing_ID, 
            movie_showing.showing_From_Date, venue.venue_ID, venue.venue_name, movie_showing.showing_To_Date, aspnet_Users.UserId,
             aspnet_Users.UserName FROM movie INNER JOIN movie_showing ON movie.movie_ID = movie_showing.movie_ID
             INNER JOIN venue ON movie_showing.venue_ID = venue.venue_ID CROSS JOIN aspnet_Users
            WHERE (movie_showing.showing_To_Date &gt;= DATEADD(day, 0, GETDATE())) AND 
            (movie_showing.showing_From_Date &lt;= GETDATE()) AND (venue.venue_ID = @venue_ID) 
            AND (movie.movie_ID = @movie_ID)
            AND (aspnet_Users.UserName=@UserName)
            "
             >
        <SelectParameters>
            <asp:ControlParameter ControlId="DropDownList1" Name="venue_ID" PropertyName="SelectedValue"/>
            <asp:ControlParameter ControlId="DropDownList2" Name="movie_ID" PropertyName="SelectedValue"/>
             <asp:ControlParameter ControlId="DropDownListDate" Name="Date" PropertyName="SelectedValue"/>
            <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />

        </SelectParameters>
        </asp:SqlDataSource>
        <div> 
            <asp:RadioButtonList ID="rbseat_cat" runat="server" 
                RepeatDirection="Horizontal" RepeatLayout="Table">
                <asp:ListItem value="Luxury" Text="Luxury"></asp:ListItem>
                <asp:ListItem  value="Standard" Text="Standard"></asp:ListItem>
               </asp:RadioButtonList>
        </div>
        <div>
            
            <asp:RadioButtonList ID="rb1" runat="server" 
                RepeatDirection="Horizontal" RepeatLayout="Table">
                <asp:ListItem value="10:00" Text="10:00"></asp:ListItem>
                <asp:ListItem  value="14:00" Text="14:00"></asp:ListItem>
                <asp:ListItem value="17:00" Text="17:00"></asp:ListItem>
                <asp:ListItem value="20:00" Text="20:00"></asp:ListItem>
                <asp:ListItem value="23:00" Text="23:00"></asp:ListItem>
               </asp:RadioButtonList>
        </div>
        <asp:Button ID="Book" runat="server" OnClick="Button2_Click1" Text="Book Ticket" />

    </div>
</div>
</asp:Content>
