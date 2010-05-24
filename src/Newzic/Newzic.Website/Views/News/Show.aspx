<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.NewsDetailsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Show
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode(Model.noticia.Titulo) %></h2>
    <fieldset>
        <%=Html.Encode(Model.noticia.Corpo) %>
        <p></p>
        <p align="right">
            <small>escrito por </small>
            <%=Html.Encode(Model.noticia.Jornalista.Nome) %>
        </p>
    </fieldset>

    <fieldset>
        <%if(Model.comments==null){ %>
        <center><b>Nao há comentarios para este noticia</b></center>
        <%}%>
    </fieldset>

    <% if (Request.IsAuthenticated) {%>
    <fieldset>
    <%using (Html.BeginForm("Comentario", "News")) { %>
        <legend>Fields</legend>
        <div class="editor-field">
            <%= Html.TextAreaFor(model => model.comentario, 5,30,null) %>
        </div>
        <p>
            <input type="submit" value="Comentar" />
        </p>
    <% } %>
    <% }%>

    </fieldset>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
