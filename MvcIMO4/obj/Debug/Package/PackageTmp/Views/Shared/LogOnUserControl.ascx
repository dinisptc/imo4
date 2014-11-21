<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%: Page.User.Identity.Name %></b>!
        [ <%: Html.ActionLink(ViewRes.SharedStrings.logoff, "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink(ViewRes.SharedStrings.logon, "LogOn", "Account")%> ]
<%
    }
%>
