﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Queixa>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Gerir Queixas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gerir Queixas dos Utilizadores</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Queixoso
            </th>
            <%--<th>
                JornalistaId
            </th>
            <th>
                Acusado
            </th>
            <th>
                Texto
            </th>
            <th>
                Resolved
            </th>--%>
            <th>
                Assunto
            </th>
            <%--<th>
                Id
            </th>--%>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
               <%-- <%: Html.ActionLink("Edit", "Edit", new { id=item.QueixaId }) %> |--%>
               <%: Html.ActionLink("Ver queixa", "Details", "Admin", new { id = item.QueixaId }, null)%>
               <%-- <%: Html.ActionLink("Delete", "Delete", new { id=item.QueixaId })%>--%>
            </td>
            <td>
                <%: item.Jornalista.Email %> <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = item.Jornalista.Email }, null)%>
            </td>
            <%--<td>
                <%: item.JornalistaId %>
            </td>
            <td>
                <%: item.AcusadoId %>
            </td>
            <td>
                <%: item.Texto %>
            </td>
            <td>
                <%: item.Resolved %>
            </td>--%>
            <td>
                <%: item.Assunto %>
            </td>
            <%--<td>
                <%: item.QueixaId %>
            </td>--%>
        </tr>
    
    <% } %>

    </table>

    <p>
      <%--  <%: Html.ActionLink("Create New", "Create") %>--%>
    </p>

</asp:Content>

