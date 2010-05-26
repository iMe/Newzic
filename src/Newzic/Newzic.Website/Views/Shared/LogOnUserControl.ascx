<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
       <%-- <b><%: Page.User.Identity.Name %></b>!--%>
        [ <%: Html.ActionLink("Log Off", "LogOff", "Account")%> ]
        [ <%: Html.ActionLink(Page.User.Identity.Name, "VerPerfil", "Account", new { email = Page.User.Identity.Name }, null)%> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Log On", "LoginForm", "Account") %> ]
<%
    }
%>

