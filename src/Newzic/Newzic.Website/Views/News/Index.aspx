<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Titulo
            </th>
            <th>
                Corpo
            </th>
            <th>
                Pontuacao
            </th>
            <th>
                Data
            </th>
            <th>
                Tags
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.NoticiaId }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.NoticiaId })%>
            </td>
           
            <td>
                <%= Html.Encode(item.Titulo) %>
            </td>
            <td>
                <%= Html.Encode(item.Corpo) %>
            </td>
            <td>
                <%= Html.Encode(item.Pontuacao) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.Data)) %>
            </td>
            <td>
                <%= Html.Encode(item.Tags) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

