<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.GerirJornsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirJorns
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Jornalistas | <%: Html.ActionLink("Ver Moderadores", "GerirMods", "Admin", new { email = Page.User.Identity.Name }, null)%></h2>
    <table>

     <% using (Html.BeginForm()) {%>
     <%: Html.ValidationSummary(true, "") %>
    <fieldset>
    <div>
        <div class="editor-label">
        <%: Html.LabelFor(m => m.searchQuery) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(m => m.searchQuery) %>
            <input type="submit" value="Pesquisar" />
        </div>
    </div>
    </fieldset>

    <% } %>
        

    <table>
        <tr>
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

    <% foreach (var item in Model.Jornalistas) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver Jornalista", "ModDetais", new { id = item.JornalistaId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Banir", "JornBanView", new { id = item.JornalistaId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Desbanir", "JornUnbanView", new { id = item.JornalistaId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Promover", "JornPromoteView", new { id = item.JornalistaId, email = Page.User.Identity.Name })%> |
                 <%: Html.ActionLink("Despromover", "JornUnPromoteView", new { id = item.JornalistaId, email = Page.User.Identity.Name })%> |
            </td>
            <td>
                <%: item.Nome %>
            </td>
            <td>
                <%: item.Email%>
            </td>
        </tr>
    
    <% } %>

    </table>

</asp:Content>

