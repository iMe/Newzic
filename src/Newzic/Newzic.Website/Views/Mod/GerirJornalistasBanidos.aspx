<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Banido>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirJornalistasBanidos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gerir Jornalistas Banidos</h2>

    <table>
        <tr>
            <th></th>
            <%--<th>
                BanidoId
            </th>--%>
            <th>
                Jornalista
            </th>
            <th>
                Data de Fim de Ban
            </th>
            <th>
                Ban Permanente
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%--<%= Html.ActionLink("Edit", "Edit", new { id=item.BanidoId }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.BanidoId })%>--%>
                <%=Html.ActionLink("Levantar Ban", "Unban", new {Id = item.BanidoId, email = Page.User.Identity.Name })%>
            </td>
           <%-- <td>
                <%= Html.Encode(item.BanidoId) %>
            </td>--%>
            <td>
                <%= Html.Encode(item.Jornalista.Nome) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.DataFim)) %>
            </td>
            <td>
                <%= Html.Encode(item.Permanente) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <%=Html.ActionLink("", "Unban", new {Id = item.BanidoId, email = Page.User.Identity.Name })%>

</asp:Content>

