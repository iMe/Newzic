<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.GerirModsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Gerir Moderadores
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Moderadores | <%: Html.ActionLink("Ver Jornalistas", "GerirJorns", "Admin", null)%></h2>
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
                Nome Moderador   
            </th>
            <th>
                Email Moderador
            </th>
        </tr>

    <% foreach (var item in Model.Moderadores) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver Perfil", "VerPerfil", "Account"  ,new { email = item.Jornalista.Email }, "")%> |
                <%if (!item.isBanned()) {%>
                <%:Html.ActionLink("Banir", "ModBanView", new {id = item.ModeradorId})%> |
                <%}%>
                <%if (item.isBanned()) {%>
                <%: Html.ActionLink("Levantar Ban", "ModUnbanView", new { id = item.ModeradorId })%> |
                <%}%>
                <%: Html.ActionLink("Despromover", "JornUnPromoteView", new { id = item.Jornalista.JornalistaId })%>
               <%-- <%: Html.ActionLink("Promover", "ModPromoteView", new { id = item.ModeradorId})%> |
                <%: Html.ActionLink("Despromover", "ModUnPromoteView", new { id = item.ModeradorId})%> |--%>
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

