<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= ViewRes.AccountStrings.useradmin%></h2>

    <fieldset>    
    
        <legend>Loja de Anuncios</legend>    
                <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.lojadeanuncios, "Index", "LojaSubscricoes")%>    
                <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.anunciarimovel, "Index", "LojaSubscricoes")%> 
                <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.ComprarAnuncios, "Index", "LojaSubscricoes")%>   
     </fieldset>
         <fieldset>    
    
        <legend><%= ViewRes.UserSharedStrings.meuanuncios%></legend>    
               <%= Html.ActionLink(ViewRes.ImovelStrings.managemyads, "MeusImoveis", "Imovel")%>
    
     </fieldset>

    <fieldset>
    <legend>Gestão da Conta</legend>
           <%= Html.ActionLink(ViewRes.AccountStrings.changepassword, "ChangePassword", "Account")%>         
           <%= Html.ActionLink(ViewRes.AccountStrings.apagaconta, "Apaga", "ApagaConta")%>
    </fieldset>
           

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
