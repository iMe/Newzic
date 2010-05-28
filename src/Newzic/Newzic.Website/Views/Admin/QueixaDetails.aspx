 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Queixa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Gerir Queixas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalhes de uma Queixa</h2>

    <fieldset>
        <legend>Assunto: <%: Model.Assunto %></legend>
        
        <div class="display-field"><%: Model.Texto %></div>
               
    </fieldset>
    <p>

        <%: Html.ActionLink("Marcar como resolvida", "resolv", new { id=Model.QueixaId.ToString() }) %> |
        <%: Html.ActionLink("Voltar", "Queixas") %>
    </p>

</asp:Content>

