﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.GerirModsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirMods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Moderadores | <%: Html.ActionLink("Ver Jornalistas", "GerirJorns", "Admin", new { email = Page.User.Identity.Name }, null)%></h2>
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

    <% foreach (var item in Model.Moderadores) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Ver Moderador", "ModDetais", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Banir", "ModBanView", new { id = item.ModeradorId, email = item.Jornalista.Email })%> |
                <%: Html.ActionLink("Desbanir", "ModUnbanView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                <%: Html.ActionLink("Promover", "ModPromoteView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
                 <%: Html.ActionLink("Despromover", "ModUnPromoteView", new { id = item.ModeradorId, email = Page.User.Identity.Name })%> |
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

