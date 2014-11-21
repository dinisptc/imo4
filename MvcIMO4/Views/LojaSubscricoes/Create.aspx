<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.subscrico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend><%: ViewRes.LojaSubscricoesStrings.TituloDaViewCreate %></legend>
                     
            <p>       
                <%: ViewRes.LojaSubscricoesStrings.Explicaads %>
            </p>
            
            <p>

            <%
                //get preço mes
                MvcIMO4.Models.PricesRepositorio.PricesRepositorio precos = new MvcIMO4.Models.PricesRepositorio.PricesRepositorio();
                MvcIMO4.Models.tabelapreco tp=precos.GetTabPrecos();
                          
            %>
            
            <%: ViewRes.LojaSubscricoesStrings.precopormes %>  <%: Html.Label(tp.precomeses.ToLocalCurrency())%> <%: ViewRes.LojaSubscricoesStrings.precopormes2 %>  <%: Html.Label(tp.precoanuncios.ToLocalCurrency())%> <%: ViewRes.LojaSubscricoesStrings.precopormes3 %>
            </p>

                        
            <div class="editor-label">
                <%: Html.Label(ViewRes.LojaSubscricoesStrings.NumeroMeses)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.numeromeses) %>
                <%: Html.ValidationMessageFor(model => model.numeromeses) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label(ViewRes.LojaSubscricoesStrings.NumerodeAnuncios)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.numeroanuncios) %>
                <%: Html.ValidationMessageFor(model => model.numeroanuncios) %>
            </div>                      
            
            <p>
                <input type="submit" value="<%=ViewRes.LojaSubscricoesStrings.criar%>" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.voltaparalista, "Index","", new { @class = "button" })%>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

