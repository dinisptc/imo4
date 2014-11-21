<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<int>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Recibo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Recibo</h2>
     
            <%: Model %>
           <%: Html.ActionLink("Back to List", "Index", "LojaSubscricoes","","")%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
