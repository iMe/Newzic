<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Moderador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UnBanView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Desbanir moderador</h2>

    <fieldset>
        <legend>Moderador</legend>
        
        <div class="display-label">ModeradorId</div>
        <div class="display-field"><%: Model.ModeradorId %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Desbanir Moderador", "ModUnBan", new { id=Model.ModeradorId }) %> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>

</asp:Content>

