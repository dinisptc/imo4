<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.Categoria>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            

            
            <div class="editor-label">
                Idioma
            </div>

            <div class="editor-field">
                <%= Html.DropDownListFor(model => model.lcode_id, (SelectList)ViewData["Idiomas"], "--Selecciona um--")%>
                <%= Html.ValidationMessageFor(model => model.lcode_id) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.nome) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nome) %>
                <%: Html.ValidationMessageFor(model => model.nome) %>
            </div>
                     
            <div class="editor-label">
                <%: Html.LabelFor(model => model.classe) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.classe) %>
                <%: Html.ValidationMessageFor(model => model.classe) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "IndexAdmin") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

