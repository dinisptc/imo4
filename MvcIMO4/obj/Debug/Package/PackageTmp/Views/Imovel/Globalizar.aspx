<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.ViewModel.ImovelViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Globalizar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <% using (Html.BeginForm()) {%>
<% Html.EnableClientValidation(); %>
<%: Html.ValidationSummary(ViewRes.ImovelStrings.pleasecorrect) %>
  
   <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%=ViewRes.ImovelStrings.globalizardesc%></legend>
                        
         
             <div class="editor-label">             
                <%=ViewRes.ImovelStrings.lingescolha%>
            </div>
            <div class="editor-global">
               <ul>
                <li> 
                    <a href="/Account/ChangeCulture?lang=pt&returnUrl=<%= this.Request.RawUrl %>" class="pt" title="<%=ViewRes.SharedStrings.pt%>">pt</a>
                </li> 
                
                <li> 
                    <a href="/Account/ChangeCulture?lang=en&returnUrl=<%= this.Request.RawUrl %>" class="uk" title="<%=ViewRes.SharedStrings.en%>">pt</a>
                </li> 
                
                <li> 
                    <a href="/Account/ChangeCulture?lang=fr&returnUrl=<%= this.Request.RawUrl %>" class="fr" title="<%=ViewRes.SharedStrings.fr%>">pt</a>
                </li> 
                
                <li> 
                    <a href="/Account/ChangeCulture?lang=es&returnUrl=<%= this.Request.RawUrl %>" class="es" title="<%=ViewRes.SharedStrings.es%>">pt</a>
                </li>
                
                <li> 
                    <a href="/Account/ChangeCulture?lang=de&returnUrl=<%= this.Request.RawUrl %>" class="de" title="<%=ViewRes.SharedStrings.de%>">pt</a>
                </li>                                                                                                                     
             </ul>  
            </div>     

            <br /><br /><br /><br />
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

