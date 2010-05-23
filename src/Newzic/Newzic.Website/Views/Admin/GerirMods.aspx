<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Moderador>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirMods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Moderadores</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Nome Moderador
            </th>
            <th>
                Email Moderador
            </th>
            <th>
                Estado Moderador
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver Moderador", "ModDetais", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Banir", "BanModView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Desbanir", "UnbanView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Promover", "PromoteView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                 <%: Html.ActionLink("Despromover", "UnPromoteView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
            </td>
            <td>
                <%: item.Jornalista.Nome %>
            </td>
            <td>
                <%: item.Jornalista.Email%>
            </td>
        </tr>
    
    <% } %>

    </table>

</asp:Content>

