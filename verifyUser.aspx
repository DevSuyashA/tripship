<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="verifyUser.aspx.cs" Inherits="TripShip.services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" />
   
    Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    Email:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>


    <center>
        <asp:Button class="btn-dark mb-3 p-2" ID="LinkButton1" name="LinkButton1" Text="Add New Parcel" runat="server" OnClick="LinkButton1_Click"></asp:Button>
    </center>
</asp:Content>
