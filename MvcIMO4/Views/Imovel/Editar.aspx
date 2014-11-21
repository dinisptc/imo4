<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.ViewModel.ImovelViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <% using (Html.BeginForm()) {%>
<% Html.EnableClientValidation(); %>
<%: Html.ValidationSummary(ViewRes.ImovelStrings.pleasecorrect) %>
  
   <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%=ViewRes.ImovelStrings.inseririmovel%></legend>
                        
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.categoria%>
            </div>
            <div class="editor-field">
                <%= Html.DropDownListFor(model => model.imovel.categoria_id, (SelectList)ViewData["Categorias"], "-- " + ViewRes.ImovelStrings.select + " --")%>
                <%= Html.ValidationMessageFor(model => model.imovel.categoria_id)%>
            </div>
            
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.bedroomsnumber%> 
            </div>
            <div class="editor-field">
              
                <%= Html.DropDownListFor(model => model.imovel.tipologia_id, (SelectList)ViewData["Tipologias"], "-- " + ViewRes.ImovelStrings.select + " --")%>
                <%= Html.ValidationMessageFor(model => model.imovel.tipologia_id)%>
            </div>
            
            <div class="editor-label">
                 <%=ViewRes.ImovelStrings.estado%> 
            </div>
            <div class="editor-field">
                 <%= Html.DropDownListFor(model => model.imovel.estado_id, (SelectList)ViewData["Estados"], "-- " + ViewRes.ImovelStrings.select + " --")%>
                <%= Html.ValidationMessageFor(model => model.imovel.estado_id)%>
            </div>
            
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.tipodenegocio%> 
            </div>
            <div class="editor-field">               
                <%= Html.DropDownListFor(model => model.imovel.objectivo_id, (SelectList)ViewData["Objectivos"], "-- " + ViewRes.ImovelStrings.select + " --")%>                
                <%= Html.ValidationMessageFor(model => model.imovel.objectivo_id)%>
            </div> 
            
            <div class="editor-label">
                 <%=ViewRes.ImovelStrings.pais%> 
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.pais)%>
                <%= Html.ValidationMessageFor(model => model.imovel.pais)%>
            </div>           
            
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.distrito%> 
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.distrito)%>
                <%= Html.ValidationMessageFor(model => model.imovel.distrito)%>
            </div>
            
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.concelho%> 
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.concelho)%>
                <%= Html.ValidationMessageFor(model => model.imovel.concelho)%>
            </div>
            
            <div class="editor-label">
                  <%=ViewRes.ImovelStrings.freguesia%> 
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.freguesia)%>
                <%= Html.ValidationMessageFor(model => model.imovel.freguesia)%>
            </div>           
            
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.valor%> 
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.preco)%>
                <%= Html.ValidationMessageFor(model => model.imovel.preco)%>
            </div>            

            <div class="editor-label">
               <%=ViewRes.ImovelStrings.areautil%>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.area_util)%>
                <%= Html.ValidationMessageFor(model => model.imovel.area_util)%>
            </div>
     
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.areabruta%>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.area_bruta) %>
                <%= Html.ValidationMessageFor(model => model.imovel.area_bruta) %>
            </div>
            
            <div class="editor-label">
                   <%=ViewRes.ImovelStrings.areadoterreno%>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.imovel.area_terreno)%>
                <%= Html.ValidationMessageFor(model => model.imovel.area_terreno)%>
            </div>

            <div class="editor-label">
                 <%=ViewRes.ImovelStrings.descricao%>
            </div>

       
            <div class="editor-field">              
                <%= Html.TextAreaFor(model => model.descricao, new { id = "editor1", @class = "ckeditor", cols = "80", rows = "10", name = "editor1" })%>
                <%= Html.ValidationMessageFor(model => model.descricao) %>
            </div>         
            <p>
                <input type="submit" value="<%=ViewRes.ImovelStrings.gravar%>" />
            </p>
        </fieldset>

    <% } %>


    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">

<script type="text/javascript" src="../../Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>

