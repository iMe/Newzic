<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
    <h2>Index - Pagina Principal para Moderadores</h2>

    <%if (Request.IsAuthenticated) { %>
        <li><%: Html.ActionLink("Gerir Jornalistas", "GerirJornalistas", "Mod", new {email = Page.User.Identity.Name}, null)%></li>   
        <li><%:Html.ActionLink("Gerir Noticias Reportadas", "GerirNoticiasFlagged","Mod",new {email = Page.User.Identity.Name}) %></li>
    <%} %>
    
    </form>

</asp:Content>
