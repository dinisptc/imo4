<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.OrdemdeCompra>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Invoice
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="/Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="/Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

          <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend></legend>
                                     
            <div class="editor-label">
                <%:ViewRes.CheckoutStrings.FirstName %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FirstName) %>
                <%: Html.ValidationMessageFor(model => model.FirstName) %>
            </div>
            
            <div class="editor-label">
                <%:ViewRes.CheckoutStrings.LastName %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.LastName) %>
                <%: Html.ValidationMessageFor(model => model.LastName) %>
            </div>
            
            <div class="editor-label">
                <%:ViewRes.CheckoutStrings.InvoiceInfo%>
            </div>
            <div class="editor-field">
                <%= Html.TextAreaFor(model => model.InvoiceInfo, new { id = "editor1", @class = "ckeditor", cols = "80", rows = "10", name = "editor1" })%>          
                <%: Html.ValidationMessageFor(model => model.InvoiceInfo) %>
            </div>
            
            <div class="editor-label">
                <%:ViewRes.CheckoutStrings.Phone%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Phone) %>
                <%: Html.ValidationMessageFor(model => model.Phone) %>
            </div>
            
            <div class="editor-label">
                <%:ViewRes.CheckoutStrings.Email%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>

            
            <p>
                <input type="submit" value="<%:ViewRes.CheckoutStrings.create%>" />
            </p>
        </fieldset>

    <% } %>

    <div>
      <p>
        <a href="javascript:history.go(-1)"><%:ViewRes.CheckoutStrings.Back%></a>
    </p>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
  <script type="text/javascript" src="../../Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>

