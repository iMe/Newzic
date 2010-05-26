<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirNoticiasFlagged
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gerir Noticias Reportadas</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Noticia - Titulo
            </th>
            <th>
                Ultima Data em que foi reportada
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Consultar Noticia", "Details","News", new { id=item.NoticiaId },null) %> |
                <%= Html.ActionLink("Apagar", "ApagarNoticia","News", new { id=item.NoticiaId },null)%> |
                <%= Html.ActionLink("Resolvido", "ReportResolvido", "Mod", new {id = item.NoticiaId },null)%> |
            </td>
            <td>
                <%= Html.Encode(item.Titulo) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.NoticiaFlaggeds.Single().Data)) %>
            </td>
        </tr>
    
    <% } %>

    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

