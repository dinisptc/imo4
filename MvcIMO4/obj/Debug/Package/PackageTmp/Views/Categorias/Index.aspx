<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcIMO4.Models.Categoria>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<center>

<br />
<br />
<a href="http://www.tkqlhce.com/click-5292125-10607661" target="_top">
<img src="http://www.awltovhc.com/image-5292125-10607661" width="468" height="60" alt="Great Hotels For Less, Book Yours Now" border="0"/></a>

<br />
<br />

     <table>
          
        
      <% int conta = 0; %>   
      <% foreach (var image in Model) { %>
      <%                                             
         if (conta > 2)
         {
           conta = 0;                    
         }
         
         if (conta == 0)
         {
           %><tr><%                         
         }
             
         conta = conta + 1;

         int pagee = 1;
       %>
  
        <td>
          <div class="image"> 
              
               <a href="/Imovel/PorCategorias/<%=image.lcode_id %>/<%=image.classe %>/<%=pagee %>"><img src="/categorias/thumbnail/<%= image.foto %>" alt=""/></a>                                                                
          </div>
          <br />
          <span class="display-label" style="font-style:oblique; text-align:center">
          <%= Html.Encode(image.nome)%>
          </span> 
        </td>                                              

            
            <%                     
               if (conta==0)
               {                        
                 %></tr><%                           
               }             
             %>

    <% }%>                
         </table>

                 
<br />
<br />        
<a href="http://www.kqzyfj.com/click-5292125-10732257" target="_top">
<img src="http://www.lduhtrp.net/image-5292125-10732257" width="728" height="90" alt="get your site online with web hosting plans" border="0"/></a>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

