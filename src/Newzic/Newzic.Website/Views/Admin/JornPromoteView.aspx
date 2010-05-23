<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Jornalista>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	JornPromoteView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>JornPromoteView</h2>

    <fieldset>
        <legend>Fields</legend>
        
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

        <%: Html.ActionLink("Promover Jornalista", "JornPromote", new { id=Model.JornalistaId }) %> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

