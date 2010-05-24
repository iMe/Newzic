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
    <center>
        <big><b><%:Html.ActionLink("⇧","","")%></b></big>
        <h3><%=Html.Encode(Model.noticia.Pontuacao)%></h3>
        <big><b><%:Html.ActionLink("⇩", "", "")%></b></big>
    </center>

    <%--<fieldset>--%>
        <%if(Model.comments==null){ %>
        <center><b>Nao há comentarios para este noticia</b></center>
        <%}%>
        <%else {%>
            <legend>Comentarios</legend>
            <table style="width:50%;">
            <tr></tr>
            <%foreach(var c in Model.comments) {%>
                <tr>
                    <td>
                    <fieldset>
                        <%=Html.Encode(c.Texto) %><br>
                        <p align="right">
                            <small><%=Html.Encode(c.Jornalista.Nome) %></small>
                        </p>
                    </fieldset>
                    </td>
                </tr>
            <%} %>
            </table>
        <%}%>
    <%--</fieldset>--%>

    <% if (Request.IsAuthenticated) {%>
    <fieldset>
    <%using (Html.BeginForm("Comentario", "News"))
    {
    
    }%>
    <%using (Html.BeginForm("Comentario", "News")) { %>
        <legend>Comentar</legend>
        <div class="editor-field">
            <%= Html.TextAreaFor(model => model.comentario, 5,50,null) %>
        </div>
        <div>
            <%=Html.TextBoxFor(model => model.guid, new { @readonly = "readonly" })%>
        </div>
        <p>
            <input type="submit" value="Comentar" />
        </p>
    <% }%>
    <% }%>

    </fieldset>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
