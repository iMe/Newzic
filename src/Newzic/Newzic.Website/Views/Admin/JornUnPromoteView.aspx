<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Jornalista>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Despromover Moderador
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tem a certeza que deseja Despromover este Moderador ?</h2>

    <fieldset>
        <legend>Dados do Moderador:</legend>
        
        <div class="display-label">Nome: <%: Model.Nome %></div>
        
        <div class="display-label">Email: <%: Model.Email %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Despromover Moderador", "JornUnPromote", new { id=Model.JornalistaId }) %> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

