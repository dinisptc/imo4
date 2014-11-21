<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.ChangePasswordModel>" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Change Password
</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= ViewRes.AccountStrings.changepassword %></h2>
    <p>
        <%= ViewRes.AccountStrings.formbelow %>
    </p>
    <p>
        <%= ViewRes.AccountStrings.newpasswords %> <%: ViewData["PasswordLength"] %> <%= ViewRes.AccountStrings.caracteres %> 
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, ViewRes.AccountStrings.passsemsuccesso)%>
        <div>
            <fieldset>
                <legend> <%= ViewRes.AccountStrings.infodaconta %></legend>
                
                <div class="editor-label">
                   <%= ViewRes.AccountStrings.oldpassword %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.OldPassword) %>
                    <%: Html.ValidationMessageFor(m => m.OldPassword) %>
                </div>
                
                <div class="editor-label">
                     <%= ViewRes.AccountStrings.newpassword %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.NewPassword) %>
                    <%: Html.ValidationMessageFor(m => m.NewPassword) %>
                </div>
                
                <div class="editor-label">
                    <%= ViewRes.AccountStrings.confirmpassword %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                
                <p>
                    <input type="submit" value="<%= ViewRes.AccountStrings.changepassword %>" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
