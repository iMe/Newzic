<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Jornalista>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Banir Jornalista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tem a certeza que deseja banir este Jornalista ?</h2>

    <fieldset>
        <legend>Dados do Jornalista</legend>
        
        <div class="display-label">Nome: 
            <div class="display-field"><%= Html.Encode(Model.Nome) %></div>
        </div>
        <div class="display-label">Email:
            <div class="display-field"><%= Html.Encode(Model.Email) %></div>
        </div>
                        
    </fieldset>
    <p>

        <%=Html.ActionLink("Confirmar", "ConfirmaBanir", new { id=Model.JornalistaId, email = Page.User.Identity.Name }) %> |
        <%=Html.ActionLink("Voltar", "GerirJornalistas", new { email = Page.User.Identity.Name}) %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

