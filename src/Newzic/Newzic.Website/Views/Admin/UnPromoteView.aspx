<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Moderador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UnPromoteView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UnPromoteView</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ModeradorId</div>
        <div class="display-field"><%: Model.ModeradorId %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Despromover Moderador", "UnPromoteMod", new { id=Model.ModeradorId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

