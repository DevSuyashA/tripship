<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="createServiceRequest.aspx.cs" Inherits="TripShip.createIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Raise a service Request</h4>
    <div class="row">
        <div class="col-md-4">
            <label>Select Parcel</label>
            <div class="form-group">
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataTextField="petName" DataValueField="pet_ID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [travellers]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your Query"></asp:TextBox>
    <asp:Button ID="Button1" class="active" runat="server" Text="Submit" />
</asp:Content>
