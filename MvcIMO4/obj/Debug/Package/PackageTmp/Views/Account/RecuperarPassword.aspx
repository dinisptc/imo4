<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.LogOnModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	RecuperarPassword
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <h3><%= ViewRes.AccountStrings.recuperarpass%> </h3>
 <% using (Html.BeginForm()) { %>
        <div>
            <fieldset>
                <legend><%= ViewRes.AccountStrings.infodaconta%> </legend>
                
                <div class="editor-label">
                  <%= ViewRes.AccountStrings.username%>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.UserName)%>
                    <%= Html.ValidationMessageFor(m => m.UserName)%>
                </div>                 
                <p>
                    <input type="submit" value="<%= ViewRes.AccountStrings.send%>" />
                </p>
                 <p><strong><%= ViewData["sucesso"] %></strong></p>
                 <p><strong><%= ViewData["erromail"] %></strong></p>
                  <p><strong><%= ViewData["erro"] %></strong></p>
            </fieldset>
        </div>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
