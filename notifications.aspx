<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="notifications.aspx.cs" Inherits="TripShip.notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h4>New Notifications
        </h4>
    </center>
    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-6 mt-5">
            <asp:Repeater ID="rNotifications" runat="server" OnItemDataBound="rNotifications_ItemDataBound">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblNotification" Text='<%# Eval("Action") %>' CssClass="form-control"></asp:Label>
                    <asp:HiddenField runat="server" ID="hdnAction" Value='<%# Eval("Action") %>' />
                    <br />
                    <hr />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
