<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.tabelapreco>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.precomeses) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.precomeses, String.Format("{0:F}", Model.precomeses)) %>
                <%: Html.ValidationMessageFor(model => model.precomeses) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.precoanuncios) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.precoanuncios, String.Format("{0:F}", Model.precoanuncios)) %>
                <%: Html.ValidationMessageFor(model => model.precoanuncios) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

