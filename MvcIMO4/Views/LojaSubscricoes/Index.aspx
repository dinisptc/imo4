<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcIMO4.Models.subscrico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <h2>  <%:ViewRes.LojaSubscricoesStrings.lojadeanuncios %></h2>


    <p>
        <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.TituloDaViewCreate, "Create", "", new { @class = "button" })%>
    </p>
     <br />
    <br />
    <table>
        <tr>
             <th> 
                        
            </th> 
            <th> 
                        
            </th>                                   
            <th>
             <%:ViewRes.LojaSubscricoesStrings.NumeroMeses %> 
            </th>
            <th>
             <%:ViewRes.LojaSubscricoesStrings.NumerodeAnuncios %> 
            </th>
            <th>
             <%:ViewRes.LojaSubscricoesStrings.data_da_subscricao %>             
            </th>
            <th>
             <%:ViewRes.LojaSubscricoesStrings.data_expira %>             
            </th>
            <th>
              <%:ViewRes.LojaSubscricoesStrings.preco %>               
            </th>
            <th>
              <%:ViewRes.LojaSubscricoesStrings.pago %>
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>

                <%   if ((item.pago == true) && (DateTime.Now < item.data_criacao_subscricao.AddMonths(item.numeromeses)))
                
                {%>

                <%: Html.ActionLink(ViewRes.SharedStrings.anunciar, "Create", "Imovel", new { subsid = item.id }, null)%>                                                         
                
                <%} else 
                     { %>
                         <% if (DateTime.Now > item.data_criacao_subscricao.AddMonths(item.numeromeses))
                            { 
                               %>
                               
                                   <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.renovar, "Renovar", "LojaSubscricoes", new { id = item.id }, "")%>       
                                 
                               <%
                             }
                            else
                            { %>
                                  <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.AddtoCart, "AddToCart", "ShoppingCart", new { id = item.id }, "")%> 
                            <%
                            }
                          %>



                    
  <%} %>


            </td>
             <td>
                       <% if (Roles.IsUserInRole("admin")) 
                           {%>                       
                            <%: Html.ActionLink("Confirmar Pagamento", "Pagotrue", "LojaSubscricoes", new { id = item.id }, "")%>

                        <% }%>

                        </td>
            <td>
                <%: item.numeromeses %>
            </td>
            <td>
                <%: item.numeroanuncios %>
            </td>
  
            <td>
                <%: String.Format("{0:g}", item.data_criacao_subscricao) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.data_criacao_subscricao.AddMonths(item.numeromeses)) %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.price) %>
            </td>
            <td>
                <%: item.pago %>
            </td>
             <td>          
                <%: Html.ActionLink(ViewRes.SharedStrings.details, "Detalhes", new { id = item.id })%> |
                <%: Html.ActionLink(ViewRes.SharedStrings.Delete, "Delete", new { id = item.id })%> 
            </td>
        </tr>
    
    <% } %>

    </table>
    <br />
    <br />
    <p>
        <%: Html.ActionLink(ViewRes.LojaSubscricoesStrings.TituloDaViewCreate, "Create", "", new { @class = "button" })%>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

