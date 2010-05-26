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
    <%:Html.ActionLink("Apagar Noticia", "ApagarNoticia", "News", new { id = Model.noticia.NoticiaId, user = Page.User.Identity.Name}, null)%> | 
    <%:Html.ActionLink("Marcar Noticia", "MarcarNoticia", "Mod", new { id = Model.noticia.NoticiaId}, null)%> 
        <% if (Model.noticia.Jornalista.Email.Equals(User.Identity.Name)) {%>
        | <%:Html.ActionLink("Editar Noticia", "Edit", "News", new { id = Model.noticia.NoticiaId}, null)%>
    <% }}%>
    <%else
       {
           if(Model.noticia.Jornalista.Email.Equals(User.Identity.Name)){ %>
           <%:Html.ActionLink("Apagar Noticia", "ApagarNoticia", "News", new { id = Model.noticia.NoticiaId, user = Page.User.Identity.Name }, null)%>
           <%:Html.ActionLink("Editar Noticia", "Edit", "News", new { id = Model.noticia.NoticiaId}, null)%>
       <% }
       }
    }%>

    <%if (Model.noticia.Marked) {%>
        | <font face="Arial" color="#ff0000"> <strong>Esta Noticia está a violar as regras e pode ser apagada a qualquer momento</strong> </font>
    <% }%>
    <fieldset>
            <% var s = Model.noticia.Corpo.Split('\n'); foreach(var ss in s) {%>
                <%=Html.Encode(ss) %>
                <br />
            <% } %>
        <%--<%=Html.Encode(Model.noticia.Corpo) %>--%>
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
        <legend>Imagens</legend>
        <center>
        </center>
        </fieldset>

        <%if (Model.noticia.Videos.Count!=0) {%>
        <fieldset>
            <legend>Videos</legend>
            <table border="0" width="100%">
            <%int i=1;%>
            <%foreach (var c in Model.noticia.Videos) {%>
                <% if (i==1) {%>
                <tr style="width:100%;">
                <%}%>
                
                <td style="width:33%;">
                <center>
                <object width="280" height="225"><param name="movie" value="
                <%=Html.Encode(c.Url) %>
                "></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="
                <%=Html.Encode(c.Url) %>
                " type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="280" height="225"></embed></object>
                </center>
                </td>
            
                <% if (i==3) {%>
                </tr>
                <%i=1;}%>
                <%else i++; %>
            <%}%>

            <%if(i!=3) {%> </tr> <%}%>
            </table>
        </fieldset>
        <%}%>

        <fieldset>
        <legend>Mapa</legend>
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
                        <% var s2 = c.Texto.Split('\n'); foreach(var ss in s2) {%>
                            <%=Html.Encode(ss) %>
                            <br />
                            <% } %>
                        <%--<%=Html.Encode(c.Texto) %><br>--%>
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
