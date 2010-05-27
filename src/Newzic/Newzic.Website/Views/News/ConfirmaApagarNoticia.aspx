<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Moderar - Apagar Noticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tem a certeza que deseja apagar esta notícia ?</h2>

    <fieldset>
        <legend>Dados da Noticia:</legend>
                
        <div class="display-label">Titulo: <%= Html.Encode(Model.Titulo) %></div>
                    
        <div class="display-label">Jornalista: <%= Html.Encode(Model.Jornalista.Email) %></div>
        
    </fieldset>
    <p>

        <%=Html.ActionLink("Confirmar Apagar Notícia", "ConfirmaApagarNoticia", new { id=Model.NoticiaId, user = Page.User.Identity.Name }) %> |
        <%=Html.ActionLink("Voltar", "Index", "Home") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

