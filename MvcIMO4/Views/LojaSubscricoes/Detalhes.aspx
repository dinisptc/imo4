<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.subscrico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalhes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:ViewRes.LojaSubscricoesStrings.detalhessubs %></h2>

    <fieldset>
        <legend></legend>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.id %></div>
        <div class="display-field"><%: Model.id %></div>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.NumeroMeses %></div>
        <div class="display-field"><%: Model.numeromeses %></div>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.NumerodeAnuncios %></div>
        <div class="display-field"><%: Model.numeroanuncios %></div>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.identidade %></div>
        <div class="display-field"><%: Model.identidade %></div>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.data_da_subscricao %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.data_criacao_subscricao) %></div>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.preco %></div>
        <div class="display-field"><%: String.Format("{0:F}", Model.price) %></div>
        
        <div class="display-label"><%:ViewRes.LojaSubscricoesStrings.pago %></div>
        <div class="display-field"><%: Model.pago %></div>
        
    </fieldset>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

