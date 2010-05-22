<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Moderador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GerirMods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>GerirMods</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ModeradorId</div>
        <div class="display-field"><%: Model.ModeradorId %></div>
        
        <div class="display-label">Nome</div>
        <div class="display-field"><%: Model.Nome %></div>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email %></div>
        
        <div class="display-label">Password</div>
        <div class="display-field"><%: Model.Password %></div>
        
        <div class="display-label">JornalistaId</div>
        <div class="display-field"><%: Model.JornalistaId %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ModeradorId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

