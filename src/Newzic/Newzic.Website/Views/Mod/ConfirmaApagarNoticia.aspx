<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ConfirmaApagarNoticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ConfirmaApagarNoticia</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">NoticiaId</div>
        <div class="display-field"><%= Html.Encode(Model.NoticiaId) %></div>
        
        <div class="display-label">Titulo</div>
        <div class="display-field"><%= Html.Encode(Model.Titulo) %></div>
        
        <div class="display-label">Corpo</div>
        <div class="display-field"><%= Html.Encode(Model.Corpo) %></div>
        
        <div class="display-label">Pontuacao</div>
        <div class="display-field"><%= Html.Encode(Model.Pontuacao) %></div>
        
        <div class="display-label">Data</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.Data)) %></div>
        
        <div class="display-label">FlagCount</div>
        <div class="display-field"><%= Html.Encode(Model.FlagCount) %></div>
        
        <div class="display-label">Deleted</div>
        <div class="display-field"><%= Html.Encode(Model.Deleted) %></div>
        
        <div class="display-label">Marked</div>
        <div class="display-field"><%= Html.Encode(Model.Marked) %></div>
        
        <div class="display-label">JornalistaId</div>
        <div class="display-field"><%= Html.Encode(Model.JornalistaId) %></div>
        
        <div class="display-label">Tags</div>
        <div class="display-field"><%= Html.Encode(Model.Tags) %></div>
        
        <div class="display-label">MapaId</div>
        <div class="display-field"><%= Html.Encode(Model.MapaId) %></div>
        
        <div class="display-label">rank</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:F}", Model.rank)) %></div>
        
    </fieldset>
    <p>

        <%=Html.ActionLink("Confirmar Apagar Notícia", "ConfirmaApagarNoticia", new { id=Model.NoticiaId }) %> |
        <%=Html.ActionLink("Voltar", "GerirNoticiasFlagged", new {id = Model.NoticiaId}) %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

