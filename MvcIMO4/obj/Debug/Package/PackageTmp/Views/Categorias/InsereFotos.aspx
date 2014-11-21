<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.Categoria>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	InsereFotos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> 
  <table>                 
        <tr>  
        <td>
               
            <%                   
                if (Model.foto != null)
                {                                                                                                       
             %>

               <img src="/Categorias/Thumbnail/<%= Model.foto %>" alt=""/>                                                             
    
        </td>

        <%
                }
                else
                {
       
                 %><img src="/Categorias/Thumbnail/no.gif" alt=""/> <%
             
                }
         %>
                 <td>                  

             </tr>
         </table>


  
             <form method="post" action="<%= Url.Action("InsereFotos/"+ViewData["idi"]+"/") %>" enctype="multipart/form-data"> 
                <input type="file" name="file" /> 
                <input type="submit" value="submit" /> <br />
                <input type="text" name="description" /> 
            </form>
             

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
