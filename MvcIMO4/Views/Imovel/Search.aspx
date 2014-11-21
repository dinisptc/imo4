<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.ViewModel.ImovelViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Search
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm()) {%>
<% Html.EnableClientValidation(); %>
<%: Html.ValidationSummary(ViewRes.ImovelStrings.pleasecorrect) %>
  
   <% using (Html.BeginForm()) {%>

        <fieldset>
         
                        
             <div class="editor-label">
                <%=ViewRes.ImovelStrings.categoria%>
            </div>
            <div class="editor-field">
                <%= Html.DropDownListFor(model => model.imovel.classe_id, (SelectList)ViewData["Categorias"], "-- "+ViewRes.ImovelStrings.select+" --")%>
                <%= Html.ValidationMessageFor(model => model.imovel.classe_id)%>
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
                 <%= Html.DropDownListFor(model => model.imovel.estado_classe_id, (SelectList)ViewData["Estados"], "-- " + ViewRes.ImovelStrings.select + " --")%>
                <%= Html.ValidationMessageFor(model => model.imovel.estado_classe_id)%>
            </div>
            
            <div class="editor-label">
                <%=ViewRes.ImovelStrings.tipodenegocio%> 
            </div>
            <div class="editor-field">               
                <%= Html.DropDownListFor(model => model.imovel.objectivo_classe_id, (SelectList)ViewData["Objectivos"], "-- " + ViewRes.ImovelStrings.select + " --")%>                
                <%= Html.ValidationMessageFor(model => model.imovel.objectivo_classe_id)%>
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

            <p>
                <input type="submit" value="<%=ViewRes.ImovelStrings.pesquisa%>" />
            </p>
        </fieldset>

    <% } %>


    <% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
