<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.imovel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.id %></div>
        <div class="display-field"><%: Model.id %></div>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.categoria %></div>
        <div class="display-field"><%: Model.categoria_id %></div>
        <div class="display-field"><%: Model.Categoria.nome %></div>
        

        
        <div class="display-label"><%: ViewRes.ImovelStrings.estado %></div>
        <div class="display-field"><%: Model.estado_id %></div>
        <div class="display-field"><%: Model.estado.estado1 %></div>



        
        <div class="display-label"><%: ViewRes.ImovelStrings.tipologia %></div>
        <div class="display-field"><%: Model.tipologia_id %></div>
         <div class="display-field"><%: Model.tipologia.nome %></div>


        <div class="display-label"><%: ViewRes.ImovelStrings.subscricao %></div>
        <div class="display-field"><%: Model.subscricao_id %></div>
        

        
        <div class="display-label"><%: ViewRes.ImovelStrings.tipodenegocio %></div>
        <div class="display-field"><%: Model.objectivo_id %></div>
         <div class="display-field"><%: Model.objectivo.tipo_negocio %></div>


        <div class="display-label"><%: ViewRes.ImovelStrings.areautil %></div>
        <div class="display-field"><%: Model.area_util %></div>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.pais %></div>
        <div class="display-field"><%: Model.pais %></div>

        <div class="display-label"><%: ViewRes.ImovelStrings.distrito %></div>
        <div class="display-field"><%: Model.distrito %></div>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.concelho %></div>
        <div class="display-field"><%: Model.concelho %></div>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.freguesia %></div>
        <div class="display-field"><%: Model.freguesia %></div>     
        
        <div class="display-label"><%: ViewRes.ImovelStrings.preco %></div>
        <div class="display-field"><%: Model.preco %></div>
        

        
        <div class="display-label"><%: ViewRes.ImovelStrings.identidade %></div>
        <div class="display-field"><%: Model.identidade %></div>
        

        
        <div class="display-label"><%: ViewRes.ImovelStrings.datacriacao %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.data_criacao) %></div>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.dataaprovacao %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.data_aprovacao) %></div>
        
        <div class="display-label"><%: ViewRes.ImovelStrings.dataexpira %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.data_expira) %></div>

        

        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="<%: ViewRes.ImovelStrings.apagar %>" /> |
		    <%: Html.ActionLink( ViewRes.SharedStrings.voltaparaalista , "Index") %>
        </p>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

