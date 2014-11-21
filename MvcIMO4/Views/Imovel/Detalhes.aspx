<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.ViewModel.ImovelViewModel>" %>
<%@ Import Namespace="NerdDinner.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Imovel em Imo4 <%=Model.imovel.Categoria.nome %> no distrito <%=Model.imovel.distrito%> no concelho <%=Model.imovel.concelho%> por <%=Model.imovel.preco%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <br />
 <br />
<a href="http://www.tkqlhce.com/click-5292125-8151385" target="_top">
<img src="http://www.lduhtrp.net/image-5292125-8151385" width="120" height="90" alt="Save on Windows 7 Practice Exams at Transcender!" border="0"/></a>

<a href="http://www.dpbolvw.net/click-5292125-10528019" target="_top">
<img src="http://www.lduhtrp.net/image-5292125-10528019" width="120" height="60" alt="" border="0"/></a>

<a href="http://www.anrdoezrs.net/click-5292125-10609075" target="_top">
<img src="http://www.awltovhc.com/image-5292125-10609075" width="120" height="90" alt="" border="0"/></a>

<a href="http://www.kqzyfj.com/click-5292125-10732248" target="_top">
<img src="http://www.tqlkg.com/image-5292125-10732248" width="120" height="60" alt="myhosting.com" border="0"/></a>

<a href="http://www.tkqlhce.com/click-5292125-10787356" target="_top">
<img src="http://www.awltovhc.com/image-5292125-10787356" width="120" height="60" alt="" border="0"/></a>

<a href="http://www.tkqlhce.com/click-5292125-10536423" target="_top">
<img src="http://www.awltovhc.com/image-5292125-10536423" width="120" height="60" alt="Auto Parts Warehouse" border="0"/></a>

 <br />
 <br />
     <p>
        <%: Html.ActionLink(ViewRes.ImovelStrings.editar, "Editar", new { id = Model.imovel.id })%> |
        <%: Html.ActionLink(ViewRes.ImovelStrings.globalize, "Globalizar", new { id = Model.imovel.id })%> |
       <%= Html.ActionLink(ViewRes.SharedStrings.maisrecentes, "Ultimos", "Imovel")%> |

    </p>
    
    <br />

    <fieldset>
        <legend><%= ViewRes.ImovelStrings.detalhes%></legend>
        
        <%= Html.ActionLink( ViewRes.ImovelStrings.entraremcontacto, "Contacto", new { id = Model.imovel.id })%>


       <div class="display-label"><%= ViewRes.ImovelStrings.categoria%></div>        
       <div class="display-field"><%= Html.Encode(Model.imovel.Categoria.nome)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.pais%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.pais)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.distrito%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.distrito)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.concelho%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.concelho)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.freguesia%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.freguesia)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.data%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.data_criacao)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.areautil%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.area_util)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.areabruta%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.area_bruta)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.areadoterreno%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.area_terreno)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.preco%></div>        
        <div class="display-field"><%= Html.Encode(Model.imovel.preco)%></div>

        <div class="display-label"><%= ViewRes.ImovelStrings.descricao%></div>        
        <div class="display-field"><%= HttpContext.Current.Server.HtmlDecode(Model.descricao)%></div>
        
         <%
             
             try
             {

                 var img = (from a in Model.imovel.Fotos
                            where a.imovel_id == Model.imovel.id
                         select a);
             
              

             %>
             <% foreach (var imt in img)
                { 
             %>
               <a href="/images/imoveis/<%= imt.image_file_name %>"><img src="/Imovel/ThumbImoveis/<%= imt.image_file_name %>" alt=""/></a>                                                                
          
            
        

        <%} %>
        <%
                     }catch
             {
             
             }
             
             
                   
             
              %>
              <br />
              <br />
              <br />
          <%= Html.ActionLink(ViewRes.ImovelStrings.entraremcontacto, "Contacto", new { id = Model.imovel.id })%>

            
    </fieldset>

    <br />



    <p>
        <%: Html.ActionLink(ViewRes.ImovelStrings.editar, "Editar", new { id = Model.imovel.id })%> |
        <%: Html.ActionLink(ViewRes.ImovelStrings.globalize, "Globalizar", new { id = Model.imovel.id })%> |
       <%= Html.ActionLink(ViewRes.SharedStrings.maisrecentes, "Ultimos", "Imovel")%>|
   
    </p>
    <br />
    <br />
    
    <center>
    <a href="http://www.jdoqocy.com/click-5292125-10784310" target="_top">
<img src="http://www.tqlkg.com/image-5292125-10784310" width="468" height="60" alt="Up to 50% off Printing" border="0"/></a>

</center>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">

        <title>Imovel em Imo4 <%=Model.imovel.Categoria.nome%> no pais <%=Model.imovel.pais%> no distrito <%=Model.imovel.distrito%> no concelho <%=Model.imovel.concelho%> por <%=Model.imovel.preco%></title>  
        <meta name="keywords" content="imoveis, portugal, armazens, lojas, apartamentos, quartos, arrendar, vender, terrenos, lotes, loteamentos, empreendimentos, lisboa, porto, coimbra, cantanhede, informação,agencias imobiliárias, agencias imobiliarias, agências imobiliárias, alugar casa, andar, apartamento, arrendamento, arrendar, arrendar casa, casa, classificados imóveis, compra de casa, compra imoveis, comprar casa, condomínio, condominio, decoracao, decoração, domicilio, domicílio, electrodomésticos, empreendimento, empreendimentos, escritorio, escritório, escritorios, escritórios, habitação, habitação arrendamento, habitacoes, habitações, imobiliaria, imobiliária, imobiliarias, imobiliárias, imobiliárias Portugal, imobiliario, imobiliário, imoveis, imóveis, imovel, imóvel, loja, mercado imobiliário, moradia, moradias, terreno, terreno vende, terrenos, casas usadas" />
        <meta name="description" content="Imovel em Imo4 <%=Model.imovel.Categoria.nome %> no distrito <%=Model.imovel.distrito %> no concelho <%=Model.imovel.concelho %> por <%=Model.imovel.preco %>" />



</asp:Content>


