<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcIMO4.Models.OrdemdeCompra>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	IndexOrdens
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>IndexOrdens</h2>

    <table>
        <tr>
            <th></th>
            <th>
                OrderId
            </th>
            <th>
                OrderDate
            </th>
            <th>
                Username
            </th>          
            <th>
                Phone
            </th>
            <th>
                Email
            </th>
     
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>      
                <%: Html.ActionLink(ViewRes.ImovelStrings.detalhes, "Detalhes", new { id=item.OrderId })%> |
                <%: Html.ActionLink(ViewRes.ImovelStrings.apagar, "Delete", new { id = item.OrderId })%>
            </td>
            <td>
                <%: item.OrderId %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.OrderDate) %>
            </td>
            <td>
                <%: item.Username %>
            </td>

            <td>
                <%: item.Phone %>
            </td>
            <td>
                <%: item.Email %>
            </td>

        </tr>
    
    <% } %>

    </table>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

