<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addjourney.aspx.cs" Inherits="Library_Management_New.addjourney" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     //for Selecting Source Dist
    <div class="form-group">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="petName" DataValueField="pet_ID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [pet_ID], [petName] FROM [Pet] WHERE ([customerID] = @customerID)">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    //for Selecting source Date and Time
    <div class="form-group">
        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="DOB" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDate" ControlToValidate="TextBox2" runat="server" ForeColor="Red" ErrorMessage="Date is required!"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvStart" ForeColor="Red" ControlToValidate="TextBox9" runat="server" ErrorMessage="Start time is required"></asp:RequiredFieldValidator>
    </div>
    
    //for Selecting Destination Dist
    <div class="form-group">
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="petName" DataValueField="pet_ID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [pet_ID], [petName] FROM [Pet] WHERE ([customerID] = @customerID)">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
    //for Selecting Destination Date and Time
    <div class="form-group">
        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="DOB" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox2" runat="server" ForeColor="Red" ErrorMessage="Date is required!"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="TextBox9" runat="server" ErrorMessage="Start time is required"></asp:RequiredFieldValidator>
    </div>

    <asp:TextBox ID="TextBox4" runat="server" placeholder="Acceptable Weight"></asp:TextBox>
    <asp:TextBox ID="TextBox5" runat="server" placeholder="Acceptable Volume"></asp:TextBox>

</asp:Content>
