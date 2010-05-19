<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Newzic.Core.Queixa>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Queixas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Queixas</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id da Queixa
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
            <th>
                Id
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
               <%-- <%: Html.ActionLink("Edit", "Edit", new { id=item.QueixaId }) %> |--%>
               <%: Html.ActionLink("Ver queixa", "Details", "Admin", new { id = item.Id }, null)%>
               <%-- <%: Html.ActionLink("Delete", "Delete", new { id=item.QueixaId })%>--%>
            </td>
            <td>
                <%: item.QueixaId %>
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
            <td>
                <%: item.Id %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
      <%--  <%: Html.ActionLink("Create New", "Create") %>--%>
    </p>

</asp:Content>

