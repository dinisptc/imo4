<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcIMO4.Models.Foto>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Fotos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <table>
          
        
      <% int conta = 0; %>   
      <% foreach (var image in Model)
         { %>
      <%                                             
         if (conta > 1)
         {
           conta = 0;                    
         }
         
         if (conta == 0)
         {
           %><tr><%                         
         }
             
         conta = conta + 1;
       %>
  
        <td>
          <span class="image"> 
            
            <%
             
             try
             {
             
    
             

             %>
               <a href="/Imovel/Detalhes/<%= image.id %>"><img src="/Imovel/ThumbImoveis/<%= image.image_file_name %>" alt=""/></a>                                                                
          </span>
        </td>
        <%
                     }catch
             {
       
                 %><a href="/Imovel/Detalhes/<%= image.id %>"><img src="/Imovel/ThumbImoveis/no.gif" alt=""/></a> <%
              
             }
             
             
                   
             
              %>
                 <td>                  
                   <!--Apagar Foto-->
                   <%= Html.ActionLink(ViewRes.ImovelStrings.apagarfoto, "ApagarFoto", new { id = image.id })%>                             
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




             <form method="post" action="<%= Url.Action("InsereFotos/"+ViewData["idi"]+"/")%>"  enctype="multipart/form-data"> 
                <input type="file" name="file" /> 
                <input type="submit" value="submit" /> <br />               
            </form> 

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
