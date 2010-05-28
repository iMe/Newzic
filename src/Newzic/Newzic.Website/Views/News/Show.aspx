<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.NewsDetailsModel>" %>
<%@ Import Namespace="Newzic.Website.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Newzic - <%=Html.Encode(Model.noticia.Titulo) %>
</asp:Content>

<%--<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
    
    <%if (Model.hasMap)
          {%>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script type="text/javascript"><%= ViewData["MapPoints"] %></script>
    <script src="../../Scripts/viewmap.js" type="text/javascript"></script>
    <% }%>

    <%if (Model.noticia.Imagems.Count!=0) {%>
    <script type="text/javascript"><%= ViewData["PicIds"] %></script>
    <script type="text/javascript" src="../../Scripts/pics.js"></script>
    <% }%>
</asp:Content>--%>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode(Model.noticia.Titulo) %></h2>
    <%
    if (Request.IsAuthenticated){
       if (AdminController.getRole(User.Identity.Name).Equals("Administrador") || (AdminController.getRole(User.Identity.Name).Equals("Moderador") && (AdminController.getRole(Model.noticia.JornalistaId).Equals("Jornalista")))) {
        %>
    
            <%:Html.ActionLink("Apagar Noticia", "ApagarNoticia", "News", new { id = Model.noticia.NoticiaId, user = Page.User.Identity.Name}, null)%>  
            <%if(!Model.noticia.Marked) {%>
                | <%:Html.ActionLink("Marcar Noticia", "MarcarNoticia", "Mod", new { id = Model.noticia.NoticiaId}, null)%> 
            <% }%>
            <% if (Model.noticia.Jornalista.Email.Equals(User.Identity.Name)) {%>
                | <%:Html.ActionLink("Editar Noticia", "Edit", "News", new { id = Model.noticia.NoticiaId}, null)%>
            <% }%>
        <% }%>
        <%else
            {
                if(Model.noticia.Jornalista.Email.Equals(User.Identity.Name)){ %>
                <%:Html.ActionLink("Apagar Noticia", "ApagarNoticia", "News", new { id = Model.noticia.NoticiaId, user = Page.User.Identity.Name }, null)%> 
                | <%:Html.ActionLink("Editar Noticia", "Edit", "News", new { id = Model.noticia.NoticiaId}, null)%>
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
        <p align="right">
            <small><%=Html.Encode(Model.noticia.Data) %></small>
        </p>
        <%if (Request.IsAuthenticated){ %>
        <p align="right">
            <%:Html.ActionLink("Reportar Noticia", "ReportNoticia", "News", new { id = Model.noticia.NoticiaId}, null)%>
        </p>
        <% }%>
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

        <%if (Model.noticia.Imagems.Count!=0) {%>
        <fieldset>
        <legend>Imagens</legend>
        <center>
        <div id="pics">
            <img class="newspic" id="current-pic" src="#" alt="pic" />
            <br />
            <a id="prev-pic" class="arrow" href="#">anterior</a> 
            <big class="arrow">∙</big>
            <a id="next-pic" class="arrow" href="#">proxima</a>
        </div>
        </center>
        </fieldset>
        <%}%>


        <%if (Model.noticia.Videos.Count!=0) {%>
        <fieldset>
            <legend>Videos</legend>
            <%if (!Request.Browser.IsMobileDevice) {%>

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
            <%}%>

          <%else{ int j=1;%>
            <%foreach (var c in Model.noticia.Videos) {%>
                <a href="<%=Html.Encode(c.Url)%>">Video <%=Html.Encode(j)%></a>
            <%} %>
            <%} %>


        </fieldset>
        <%}%>

        <%if (Model.hasMap)
          {%>
        <fieldset>
        <legend>Mapa</legend>
        <center>

        <div id="map">
        </div>

        </center>
        </fieldset>
        <%}%>

    </fieldset>
    <center>
        <big class="arrow"><b><%:Html.ActionLink("⇧","UpVote","News",new { id = Model.noticia.NoticiaId.ToString()}, null)%></b></big>
        <h3><%=Html.Encode(Model.noticia.Pontuacao)%></h3>
        <big class="arrow"><b><%:Html.ActionLink("⇩", "DownVote", "News",new { id = Model.noticia.NoticiaId.ToString()}, null)%></b></big>
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
                        <p align="right">
                            <small><%=Html.Encode(c.Data) %></small>
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
    <%--<%using (Html.BeginForm("Comentario", "News"))
    {
    
    }%>--%>
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

<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
    
    <%if (Model.hasMap)
          {%>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script type="text/javascript"><%= ViewData["MapPoints"] %></script>
    <script src="../../Scripts/viewmap.js" type="text/javascript"></script>
    <% }%>

    <%if (Model.noticia.Imagems.Count!=0) {%>
    <script type="text/javascript"><%= ViewData["PicIds"] %></script>
    <script type="text/javascript" src="../../Scripts/pics.js"></script>
    <% }%>
</asp:Content>
