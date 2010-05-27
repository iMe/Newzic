<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.GerirJornsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Promover Jornalistas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Jornalistas | <%: Html.ActionLink("Ver Moderadores", "GerirMods", "Admin", null)%></h2>
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
               
            </th>
            <th>
                Nome Jornalista
            </th>
            <th>
                Email Jornalista
            </th>
        </tr>

    <% foreach (var item in Model.Jornalistas) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver Perfil", "VerPerfil", "Account", new { email = item.Email }, "")%> |
                <%if (!item.isModerador())
                {%>
                    <%:Html.ActionLink("Promover", "JornPromoteView", new {id = item.JornalistaId})%>
                <%}%>
                <%--<%if (item.isModerador())
                {%>
                <%: Html.ActionLink("Despromover", "JornUnPromoteView", new { id = item.JornalistaId })%>
                <%}%>--%>
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

