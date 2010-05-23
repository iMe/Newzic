<%@ Page Title="Moderador - Gerir Jornalistas" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Jornalista>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gerir Jornalistas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Jornalistas do Newzic:</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Nome
            </th>
            <th>
                Email
            </th>
            
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver Jornalista", "VerJornalista", new { id = item.JornalistaId, email = Page.User.Identity.Name })%> |
                <% if (item.isBanned()) %>
                       <%:Html.ActionLink("Levantar Ban", "Unban", new { Id = item.JornalistaId, email = Page.User.Identity.Name })%>
                <% if (!item.isBanned())%>
                       <%: Html.ActionLink("Banir", "BanirJornalista", new {id = item.JornalistaId, email = Page.User.Identity.Name})%>
            </td>
            <td>
                <%= Html.Encode(item.Nome) %>
            </td>
            <td>
                <%= Html.Encode(item.Email) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

