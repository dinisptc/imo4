<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.OrdemdeCompra>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalhes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2> <%:ViewRes.CheckoutStrings.detalhes %> </h2>

    <fieldset>
            
        <div class="display-label"><%:ViewRes.CheckoutStrings.ordemid %></div>
        <div class="display-field"><%: Model.OrderId %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.OrderDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.OrderDate) %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.Username %></div>
        <div class="display-field"><%: Model.Username %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.FirstName %></div>
        <div class="display-field"><%: Model.FirstName %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.LastName %></div>
        <div class="display-field"><%: Model.LastName %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.InvoiceInfo%></div>
        <div class="display-field"> <%= HttpContext.Current.Server.HtmlDecode(Model.InvoiceInfo)%></div>
       
        <div class="display-label"><%:ViewRes.CheckoutStrings.Phone%></div>
        <div class="display-field"><%: Model.Phone %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.Email%></div>
        <div class="display-field"><%: Model.Email %></div>       
        
    </fieldset>
    <p>
        <a href="javascript:history.go(-1)"><%:ViewRes.CheckoutStrings.Back%></a>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

