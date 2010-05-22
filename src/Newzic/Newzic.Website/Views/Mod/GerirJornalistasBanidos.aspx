<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Banido>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirJornalistasBanidos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gerir Jornalistas Banidos</h2>

    <table>
        <tr>
            <th></th>
            <th>
                BanidoId
            </th>
            <th>
                JornalistaId
            </th>
            <th>
                DataFim
            </th>
            <th>
                Permanente
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.BanidoId }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.BanidoId })%>
            </td>
            <td>
                <%= Html.Encode(item.BanidoId) %>
            </td>
            <td>
                <%= Html.Encode(item.JornalistaId) %>
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

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

