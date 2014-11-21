<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%: Html.ActionLink(ViewRes.SharedStrings.cart + "(" + ViewData["CartCount"] + ")", "Index", "ShoppingCart", new { id = "cart-status" })%>