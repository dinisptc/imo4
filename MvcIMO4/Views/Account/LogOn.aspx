<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ViewRes.AccountStrings.logon %>
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= ViewRes.AccountStrings.logon %></h2>
    <p>
        <%= ViewRes.AccountStrings.enterlogpass %> <%: Html.ActionLink(ViewRes.AccountStrings.register, "Register")%>  <%= ViewRes.AccountStrings.naotemconta %>
    </p>
    <br />
    <p>    
     <%= ViewRes.AccountStrings.forgetpass%> <%= Html.ActionLink(ViewRes.AccountStrings.recuperarpass, "Recuperar")%>     
    </p>
    

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, ViewRes.AccountStrings.loginsemsucesso)%>
        <div>
            <fieldset>
                <legend> <%= ViewRes.AccountStrings.infodaconta %></legend>
                
                <div class="editor-label">
                    <%= ViewRes.AccountStrings.username %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%= ViewRes.AccountStrings.password %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe) %>
                </div>
                
                <p>
                    <input type="submit" value="<%: ViewRes.AccountStrings.logon %>" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
