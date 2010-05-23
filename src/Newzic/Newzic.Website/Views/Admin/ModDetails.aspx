<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Moderador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ModDetais
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ModDetais</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ModeradorId</div>
        <div class="display-field"><%: Model.ModeradorId %></div>
        
    </fieldset>
    <p>

       <%-- <%: Html.ActionLink("Edit", "Edit", new { id=Model.ModeradorId }) %> |--%>
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>

</asp:Content>

