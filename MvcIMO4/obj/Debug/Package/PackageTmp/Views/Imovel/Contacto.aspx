<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.imovel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contacto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <% using (Html.BeginForm()) {%>

    <p><%=ViewRes.ImovelStrings.contactarsemcompromisso%></p>

    <fieldset>
      <legend><%=ViewRes.ImovelStrings.mensagem%></legend>
       
      <div class=" editor-field">
          <label for="name"><%=ViewRes.ImovelStrings.oseunome%></label>
      </div>

      <div class=" editor-field">           
        <%=Html.TextBox("name", ViewData["name"] ?? "")%>
        <%=Html.ValidationMessage("name")%>
      </div>


      <div class=" editor-field">
          <label for="name"><%=ViewRes.ImovelStrings.oseuemail%></label>
      </div>

      <div class=" editor-field">           
        <%=Html.TextBox("email", ViewData["email"] ?? "")%>
        <%=Html.ValidationMessage("email")%>
      </div>
      
      <div class=" editor-field">
          <label for="name"><%=ViewRes.ImovelStrings.asuamensagem%></label>
      </div>

      <div class=" editor-field">           
        <%=Html.TextArea("comments", ViewData["comments"] != null ? ViewData["comments"].ToString() : "", new{cols="60", rows="8"})%>
        <%=Html.ValidationMessage("comments")%>
      </div>


      <div class="row">
        <span class="label">&nbsp;
          </span>
          
        <input type="submit" value="<%=ViewRes.ImovelStrings.enviar%>" />
      </div>
    </fieldset>
     <% } %>
    <!--</form>-->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
