<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcIMO4.Models.Categoria>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	IndexAdmin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>IndexAdmin</h2>

    <table>
        <tr>
            <th></th>
            <th>
                id
            </th>
            <th>
                lcode_id
            </th>
            <th>
                nome
            </th>
            <th>
                foto
            </th>
            <th>
                classe
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Editar", new { id=item.id }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.id })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.id })%> |
                <%: Html.ActionLink("Insere Fotos", "InsereFotos", new { id=item.id })%>
            </td>
            <td>
                <%: item.id %>
            </td>
            <td>
                <%: item.lcode_id %>
            </td>
            <td>
                <%: item.nome %>
            </td>
            <td>
                <%: item.foto %>
            </td>
            <td>
                <%: item.classe %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

