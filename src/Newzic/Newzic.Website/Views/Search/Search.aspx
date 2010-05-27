<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Pesquisar noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Pesquisar</h2>

    <table>
        <tr>
            <th></th>
            <th>
                NoticiaId
            </th>
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
                FlagCount
            </th>
            <th>
                Deleted
            </th>
            <th>
                Marked
            </th>
            <th>
                JornalistaId
            </th>
            <th>
                Tags
            </th>
            <th>
                MapaId
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Editar", "Edit", new { id=item.NoticiaId }) %> |
                <%= Html.ActionLink("Ver detalhes", "Details", new { id=item.NoticiaId })%>
            </td>
            <td>
                <%= Html.Encode(item.NoticiaId) %>
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
                <%= Html.Encode(item.FlagCount) %>
            </td>
            <td>
                <%= Html.Encode(item.Deleted) %>
            </td>
            <td>
                <%= Html.Encode(item.Marked) %>
            </td>
            <td>
                <%= Html.Encode(item.JornalistaId) %>
            </td>
            <td>
                <%= Html.Encode(item.Tags) %>
            </td>
            <td>
                <%= Html.Encode(item.MapaId) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <%--<p>
        <%= Html.ActionLink("Criar nova", "Create") %>
    </p>--%>

</asp:Content>

