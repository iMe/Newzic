<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Queixas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Queixas</h2>

    <fieldset>
         <%foreach (var queixa in Model)
          { %>
            <li>
               <%:Html.ActionLink("Ver qeixa", "Details", new { id=queixa.Id}) %>
                <%--<%:Html.Encode(queixa.Texto)%>--%>
                <%:Html.Encode("Acusado: " + queixa.IdAcusado)%>
                <%:Html.Encode("Qeuixoso: " + queixa.IdQueixoso)%>
                <%:Html.Encode(queixa.)%>

                <%:Html.Encode("Resolvido:"+ queixa.Resolvido.ToString())%>
            </li>
        <% } %>
    </fieldset>
    <p>

        <%--<%: Html.ActionLink("Edit", "Edit", new { id=Model.IdQueixoso }) %> |--%>
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

