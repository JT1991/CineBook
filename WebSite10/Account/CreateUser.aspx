<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <h2>Create New User</h2>

  <asp:Label id="Msg" ForeColor="maroon" runat="server" /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource2"
        GridLines="None" CssClass="mGrid" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" SortExpression="LastLoginDate" />
            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString %>" SelectCommand="SELECT aspnet_Membership.UserId, aspnet_Users.UserName, aspnet_Membership.Email, aspnet_Membership.LastLoginDate, aspnet_Membership.CreateDate FROM aspnet_Membership INNER JOIN aspnet_Users ON aspnet_Membership.UserId = aspnet_Users.UserId"></asp:SqlDataSource>
    <table cellpadding="3" border="0">

    <tr>
      <td>Username:</td>
      <td><asp:Textbox id="UsernameTextbox" runat="server" /></td>
      <td><asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                                      ControlToValidate="UserNameTextbox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" /></td>
    </tr>
    <tr>
      <td>Password:</td>
      <td><asp:Textbox id="PasswordTextbox" runat="server" TextMode="Password" /></td>
      <td><asp:RequiredFieldValidator id="PasswordRequiredValidator" runat="server"
                                      ControlToValidate="PasswordTextbox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" /></td>
    </tr>
    <tr>
      <td>Confirm Password:</td>
      <td><asp:Textbox id="PasswordConfirmTextbox" runat="server" TextMode="Password" /></td>
      <td><asp:RequiredFieldValidator id="PasswordConfirmRequiredValidator" runat="server"
                                      ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" />
          <asp:CompareValidator id="PasswordConfirmCompareValidator" runat="server"
                                      ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                                      Display="Static" ControlToCompare="PasswordTextBox"
                                      ErrorMessage="Confirm password must match password." />
      </td>
    </tr>
    <tr>
      <td>Email Address:</td>
      <td><asp:Textbox id="EmailTextbox" runat="server" /></td>
      <td><asp:RequiredFieldValidator id="EmailRequiredValidator" runat="server"
                                      ControlToValidate="EmailTextbox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" /></td>
    </tr>


<% if (Membership.RequiresQuestionAndAnswer) { %>

    <tr>
      <td>Password Question:</td>
      <td><asp:Textbox id="PasswordQuestionTextbox" runat="server" /></td>
      <td><asp:RequiredFieldValidator id="PasswordQuestionRequiredValidator" runat="server"
                                      ControlToValidate="PasswordQuestionTextbox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" /></td>
    </tr>
    <tr>
      <td>Password Answer:</td>
      <td><asp:Textbox id="PasswordAnswerTextbox" runat="server" /></td>
      <td><asp:RequiredFieldValidator id="PasswordAnswerRequiredValidator" runat="server"
                                      ControlToValidate="PasswordAnswerTextbox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" /></td>
    </tr>

<% } %>


    <tr>
      <td></td>
      <td><asp:Button id="CreateUserButton" Text="Create User" OnClick="CreateUser_OnClick" runat="server" /></td>
    </tr>
  </table>

</asp:Content>

