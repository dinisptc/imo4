<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= ViewRes.AccountStrings.createnewaccount %></h2>
    <p>
          <%: ViewRes.AccountStrings.useformcreate %>    
    </p>
    <p>
         <%: ViewRes.AccountStrings.passrequired %> <%: ViewData["PasswordLength"] %>   <%: ViewRes.AccountStrings.caracteres%> 
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, ViewRes.AccountStrings.account)%>
        <div>
            <fieldset>
                <legend> <%: ViewRes.AccountStrings.infodaconta %></legend>
                
                <div class="editor-label">
                   <%: ViewRes.AccountStrings.username %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                     <%: ViewRes.AccountStrings.email %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-label">
                     <%: ViewRes.AccountStrings.password %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                   <%: ViewRes.AccountStrings.confirmpassword %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
               
                <p>
                    <input type="submit" value="<%: ViewRes.AccountStrings.register %>" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
