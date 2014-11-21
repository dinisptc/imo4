<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Site Admin</h2>

    <fieldset>    
    <legend>Tarefas da Administração</legend>
    
            <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.GerirPrecosAnuncios, "Edit", "Prices")%>
            <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.confirmapagamento, "ListarPorPagar", "LojaSubscricoes")%>
            <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.listarexpiradas, "ListarExpiradas", "LojaSubscricoes")%>
           <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.ordens, "ListarOrdensdeCopmpra", "Checkout")%>    
     </fieldset>
    
    <fieldset>    
    <legend>Editar Conteudos do Site</legend>    
            <%: Html.ActionLink(ViewRes.CategoriasSharedStrings.cat, "IndexAdmin", "Categorias")%> 
            <%: Html.ActionLink(ViewRes.EstadoSharedStrings.indexestado, "Index", "Estado")%>  
            <%: Html.ActionLink(ViewRes.TipoNegocioSharedStrings.index, "Index", "TipoNegocio")%> 
            <%: Html.ActionLink(ViewRes.ImovelStrings.aprovacoes, "PorAprovar", "Imovel")%>       
     </fieldset>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
