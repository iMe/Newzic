<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Preview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode(Model.Titulo) %></h2>

    <fieldset>
            <% var s = Model.Corpo.Split('\n'); foreach(var ss in s) {%>
                <%=Html.Encode(ss) %>
                <br />
            <% } %>
        <p></p>
        <%--<p align="right">
            <small>escrito por </small>
            <%=Html.Encode(Model.Jornalista.Nome) %>
            <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = Model.noticia.Jornalista.Email}, null)%>
        </p>--%>
    
        <center>  
        <table style="width:30%;">
        <tr></tr>
        <tr><td>
            <fieldset>
            <legend>Tags</legend>
            <center><p><%= Html.Encode(Model.Tags)%></p></center>
            </fieldset>
        </td></tr>
        </table>
        </center>

         <%if (Model.Imagems.Count>0) {%>
        <fieldset>
        <legend>Imagens</legend>
        <center>
        <div id="pics">
            <img class="newspic" id="current-pic" src="#" alt="pic" />
            <br />
            <a id="prev-pic" class="arrow" href="#">prev</a> 
            <big class="arrow">∙</big>
            <a id="next-pic" class="arrow" href="#">next</a>
        </div>
        </center>
        </fieldset>
        <%}%>


        <%if (Model.Videos.Count!=0) {%>
        <fieldset>
            <legend>Videos</legend>
            <%if (!Request.Browser.IsMobileDevice) {%>

            <table border="0" width="100%">
            <%int i=1;%>
            <%foreach (var c in Model.Videos) {%>
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
            <%foreach (var c in Model.Videos) {%>
                <a href="<%=Html.Encode(c.Url)%>">Video <%=Html.Encode(j)%></a>
            <%} %>
            <%} %>

        </fieldset>
        <%}%>

        <%if (Model.Mapas.Count>0)
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







</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
<%if (Model.Mapas.Count>0)
          {%>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script type="text/javascript"><%= ViewData["MapPoints"] %></script>
    <script src="../../Scripts/viewmap.js" type="text/javascript"></script>
    <% }%>

    <%if (Model.Imagems.Count>0) {%>
    <script type="text/javascript"><%= ViewData["PicIds"] %></script>
    <script type="text/javascript" src="../../Scripts/picsprev.js"></script>
    <% }%>
</asp:Content>
