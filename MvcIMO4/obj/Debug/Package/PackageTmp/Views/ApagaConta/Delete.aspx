<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Security.MembershipUser>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2>
        <%: ViewRes.ApagaContaStrings.confirmacao %>
    </h2>

    <div>
        <p><%: ViewRes.ApagaContaStrings.confutilizador %> :
           <i> <%= HttpContext.Current.Server.HtmlDecode(Model.UserName) %>? </i> 
        </p>
    </div>
    
    <% using (Html.BeginForm()) {  %>
        <input name="confirmButton" type="submit" value="<%: ViewRes.ApagaContaStrings.apagar %>" />        
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

