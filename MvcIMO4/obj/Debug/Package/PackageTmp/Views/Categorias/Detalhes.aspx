<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.Categoria>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalhes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalhes</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">id</div>
        <div class="display-field"><%: Model.id %></div>
        
        <div class="display-label">lcode_id</div>
        <div class="display-field"><%: Model.lcode_id %></div>
        
        <div class="display-label">nome</div>
        <div class="display-field"><%: Model.nome %></div>
        
        <div class="display-label">foto</div>
        <div class="display-field"><%: Model.foto %></div>
        
        <div class="display-label">classe</div>
        <div class="display-field"><%: Model.classe %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Editar", new { id=Model.id }) %> |
        <%: Html.ActionLink("Back to List", "IndexAdmin") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

