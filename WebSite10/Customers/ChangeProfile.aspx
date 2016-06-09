<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ChangeProfile.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style6 {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Create User Profile</h2>
    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
<asp:Panel ID="pnlDisplay" runat="server">
    <table class="auto-style6">
        <tr>
            <td>
                <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
                <asp:TextBox ID="txtFName" runat="server" style="margin-left: 41px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblLName" runat="server" Text="Last Name"></asp:Label>
                <asp:TextBox ID="txtLName" runat="server" style="margin-left: 45px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth"></asp:Label>
                <asp:TextBox ID="txtDOB" runat="server" style="margin-left: 44px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click1" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>
<br />
</asp:Content>

