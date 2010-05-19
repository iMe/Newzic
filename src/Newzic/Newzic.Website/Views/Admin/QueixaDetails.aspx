<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Queixa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	QueixaDetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>QueixaDetails</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">QueixaId</div>
        <div class="display-field"><%: Model.QueixaId %></div>
        
        <div class="display-label">JornalistaId</div>
        <div class="display-field"><%: Model.JornalistaId %></div>
        
        <div class="display-label">AcusadoId</div>
        <div class="display-field"><%: Model.AcusadoId %></div>
        
        <div class="display-label">Texto</div>
        <div class="display-field"><%: Model.Texto %></div>
        
        <div class="display-label">Resolved</div>
        <div class="display-field"><%: Model.Resolved %></div>
        
        <div class="display-label">Assunto</div>
        <div class="display-field"><%: Model.Assunto %></div>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%: Model.Id %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.QueixaId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

