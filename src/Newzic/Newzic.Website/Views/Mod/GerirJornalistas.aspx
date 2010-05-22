<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Jornalista>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirJornalistas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>GerirJornalistas</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Nome
            </th>
            <th>
                Email
            </th>
            <th>
                Password
            </th>
            <th>
                JornalistaId
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.JornalistaId }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.JornalistaId })%>
            </td>
            <td>
                <%= Html.Encode(item.Nome) %>
            </td>
            <td>
                <%= Html.Encode(item.Email) %>
            </td>
            <td>
                <%= Html.Encode(item.Password) %>
            </td>
            <td>
                <%= Html.Encode(item.JornalistaId) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

