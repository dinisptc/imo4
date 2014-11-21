<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcIMO4.Models.imovel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	SearchIndex
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <p><%= ViewRes.ImovelStrings.TotaldeRegistos %><strong><%= ViewData["totalUsers"] %></strong></p>

   <% 
      if ((int)ViewData["totalUsers"] == 0)
      { 
    %>
      <p><%= ViewRes.ImovelStrings.naoharesultado %></p>
    <% 
       }
       else
       {
     %> 

    <table>

      <% int conta = 0; %>   
      <% foreach (var item in Model)
         
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
          
            
            <%
             
             try
             {

                 var img = (from a in item.Fotos
                            where a.imovel_id == item.id
                         select a).First();
             

             %>
             <div class="image">
               <a href="/Imovel/Detalhes/<%= item.id %>"><img src="/Imovel/ThumbImoveis/<%= img.image_file_name %>" alt=""/></a>                                                                
        </div>
        </td><%
                
             }catch
             {
       
                 %>
                  <div class="image">
                 
                 <a href="/Imovel/Detalhes/<%= item.id %>"><img src="/Imovel/ThumbImoveis/no.gif" alt=""/></a>
                 </div>
                 
                  <%
              
             }
             
             
                   
             
              %>
                               
                                                      
            <td>
            <%= ViewRes.ImovelStrings.valor %> : <%= Html.Encode(item.preco)%> €
            <br />

            <%
                MvcIMO4.Models.ImovelEstadoRepositorio.ImovelEstadoRepositorio imoestadorepo = new MvcIMO4.Models.ImovelEstadoRepositorio.ImovelEstadoRepositorio();
               string LangCode = System.Globalization.CultureInfo.CurrentCulture.TwoLetterISOLanguageName;

               int lacode = imoestadorepo.GetIdioma_ID(LangCode);
               MvcIMO4.Models.imo4Entities db = new MvcIMO4.Models.imo4Entities();
             
                //ir a tabela de ligaçao verificar imoid,catid,langcode

                var cati=(from c in db.Categorias
                         where (c.classe==item.classe_id)&&(c.lcode_id==lacode)
                         select c).SingleOrDefault();

                var idi = (from c in db.Categorias
                            where (c.classe == item.classe_id) 
                            select c).FirstOrDefault(); 
             
             
                if (cati==null)
                {
                    
                    //procurar idiomas existentes
                    
                   cati=(from c in db.Categorias                       //primeiro existente
                         where (c.classe == item.classe_id) && (c.lcode_id == idi.lcode_id)
                         select c).SingleOrDefault();                
                }
                      
                 
            %>
            <%= ViewRes.ImovelStrings.categoria%> : <%= Html.Encode(cati.nome)%>
            
           

            <br />
            <%= ViewRes.ImovelStrings.distrito %> : <%= Html.Encode(item.distrito)%>
            <br />

            <%
               
                var estati = (from c in db.estadoes
                            where (c.classe == item.estado_classe_id) && (c.lcode_id == lacode)
                            select c).SingleOrDefault();

                var tati = (from c in db.estadoes
                            where (c.classe == item.estado_classe_id)
                           select c).FirstOrDefault();


                if (estati == null)
                {

                    //procurar idiomas existentes

                    estati = (from c in db.estadoes                       //primeiro existente
                              where (c.classe == item.estado_classe_id) && (c.lcode_id == idi.lcode_id)
                            select c).SingleOrDefault();
                }


                if (estati != null)
            {%>

            <%= ViewRes.ImovelStrings.estado %> : <%= Html.Encode(estati.estado1)%>
            
            <%} %>
            
            <br />
            <%   
             
                var objecti = (from c in db.objectivoes
                               where (c.classe == item.objectivo_classe_id) && (c.lcode_id == lacode)
                               select c).FirstOrDefault();

                var onti = (from c in db.objectivoes
                            where (c.classe == item.objectivo_classe_id)
                            select c).FirstOrDefault();


                if (objecti == null)
                {

                    //procurar idiomas existentes

                    objecti = (from c in db.objectivoes                       //primeiro existente
                              where (c.classe == item.estado_classe_id) && (c.lcode_id == idi.lcode_id)
                              select c).SingleOrDefault();
                }

                if (objecti != null)
             {
             %>
                                  
              <%= ViewRes.ImovelStrings.tipodenegocio %>  :<%= Html.Encode(objecti.tipo_negocio)%>


             <%} %>


            <br />
               <%if (item.area_util != null)
               {%>
               <%= ViewRes.ImovelStrings.areautil %>  :<%= Html.Encode(item.area_util)%> m2
             <%} %>
            
   
        </td>
       
     

            <%                     
               if (conta==0)
               {                        
                 %></tr><%                           
               }             
             %>

    <% }%>                
         </table>

       
    <% } %>
    <br />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
