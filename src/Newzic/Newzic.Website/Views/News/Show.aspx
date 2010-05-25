<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.NewsDetailsModel>" %>
<%@ Import Namespace="Newzic.Website.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Show
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
    
<%--    <script type="text/javascript" src="../../Scripts/pics.js"></script>
     <%
        var array = Model.noticia.Imagems.Select(i => "\"" +i.ImagemId.ToString()+"\"").ToArray();
        var s = "var imageIds = {" + string.Join(",", array) + "};"; %>
    <script type="text/javascript">
    <%= s %>
    </script>--%>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode(Model.noticia.Titulo) %></h2> 
    <% //AdminController ad = new AdminController();
    if (Request.IsAuthenticated){
       if (AdminController.getRole(User.Identity.Name).Equals("Administrador") || (AdminController.getRole(User.Identity.Name).Equals("Moderador") && (AdminController.getRole(Model.noticia.JornalistaId).Equals("Jornalista")))) {
    %>
    <%:Html.ActionLink("Apagar Noticia", "ApagarNoticia", "Mod", new { email = Model.noticia.Jornalista.Email}, null)%> | 
    <%:Html.ActionLink("Marcar Noticia", "MarcarNoticia", "Mod", new { email = Model.noticia.Jornalista.Email}, null)%>

    <% }%>
    <%else
       {
           if(Model.noticia.Jornalista.Email.Equals(User.Identity.Name)){ %>
           <%:Html.ActionLink("Apagar Noticia", "ApagarNoticia", "Mod", new { email = Model.noticia.Jornalista.Email}, null)%>
           <%:Html.ActionLink("Editar Noticia", "EditarNoticia", "News", new { email = Model.noticia.Jornalista.Email}, null)%>
       <% }
       }
    }%>
    <fieldset>
        <%=Html.Encode(Model.noticia.Corpo) %>
        <p></p>
        <p align="right">
            <small>escrito por </small>
            <%=Html.Encode(Model.noticia.Jornalista.Nome) %>
            <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = Model.noticia.Jornalista.Email}, null)%>
        </p>

        <center>
        <table style="width:30%;">
        <tr></tr>
        <tr><td>
            <fieldset>
            <legend>Tags</legend>
            <center><p><%= Html.Encode(Model.noticia.Tags)%></p></center>
            </fieldset>
        </td></tr>
        </table>
        </center>

        <fieldset>
        <center>
        </center>
        </fieldset>

    </fieldset>
    <center>
        <big><b><%:Html.ActionLink("⇧","UpVote","News",new { id = Model.noticia.NoticiaId.ToString()}, null)%></b></big>
        <h3><%=Html.Encode(Model.noticia.Pontuacao)%></h3>
        <big><b><%:Html.ActionLink("⇩", "DownVote", "News",new { id = Model.noticia.NoticiaId.ToString()}, null)%></b></big>
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
                            <small><%=Html.Encode(c.Jornalista.Nome) %> <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = c.Jornalista.Email}, null)%></small>
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
            <%=Html.HiddenFor(model => model.guid, new { @readonly = "readonly" })%>
        </div>
        <p>
            <input type="submit" value="Comentar" />
        </p>
    <% }%>
    <% }%>

    </fieldset>

</asp:Content>
