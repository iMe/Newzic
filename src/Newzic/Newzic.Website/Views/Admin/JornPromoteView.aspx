<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Jornalista>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Promover Jornalista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tem a certeza que deseja promover este Jornalista a Moderador ?</h2>

    <fieldset>
        <legend>Dados do Jornalista</legend>
        
        <div class="display-label">Nome: <%: Model.Nome %></div>
        
        <div class="display-label">Email: <%: Model.Email %></div>
        
                
    </fieldset>
    <p>

        <%: Html.ActionLink("Promover Jornalista", "JornPromote", new { id=Model.JornalistaId }) %> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

