<%@Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ViewRes.AccountStrings.changepassword %>
</asp:Content>

<asp:Content ID="changePasswordSuccessContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= ViewRes.AccountStrings.changepassword %></h2>
    <p>
        <%= ViewRes.AccountStrings.passalterada %>
    </p>
</asp:Content>
