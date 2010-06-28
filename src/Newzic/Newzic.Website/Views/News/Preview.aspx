<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Preview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Html.Encode(Model.Titulo) %></h2>
   
    <fieldset>
        <% var s = Model.Corpo.Split('\n'); foreach (var ss in s)
           {%>
        <%=Html.Encode(ss) %>
        <br />
        <% } %>
        <%--<%=Html.Encode(Model.noticia.Corpo) %>--%>
        <p>
        </p>
        <p align="right">
            <small>escrito por </small>
            <%=Html.Encode(Model.Jornalista.Nome) %>
            <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = Model.Jornalista.Email}, null)%>
        </p>
        <p align="right">
            <small>
                <%=Html.Encode(Model.Data) %></small>
        </p>
        
        <center>
            <table style="width: 30%;">
                <tr>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Tags</legend>
                            <center>
                                <p>
                                    <%= Html.Encode(Model.Tags)%></p>
                            </center>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </center>
        <%if (Model.Imagems.Count != 0)
          {%>
        <fieldset>
            <legend>Imagens</legend>
            <center>
                <div id="pics">
                    <img class="newspic" id="current-pic" src="#" alt="pic" />
                    <br />
                    <a id="prev-pic" class="arrow" href="#">anterior</a> <big class="arrow">∙</big>
                    <a id="next-pic" class="arrow" href="#">proxima</a>
                </div>
            </center>
        </fieldset>
        <%}%>
        <%if (Model.Videos.Count != 0)
          {%>
        <fieldset>
            <legend>Videos</legend>
            <%if (!Request.Browser.IsMobileDevice)
              {%>
            <table border="0" width="100%">
                <%int i = 1;%>
                <%foreach (var c in Model.Videos)
                  {%>
                <% if (i == 1)
                   {%>
                <tr style="width: 100%;">
                    <%}%>
                    <td style="width: 33%;">
                        <center>
                            <object width="280" height="225">
                                <param name="movie" value="
                <%=Html.Encode(c.Url) %>
                "></param>
                                <param name="allowFullScreen" value="true"></param>
                                <param name="allowscriptaccess" value="always"></param>
                                <embed src="
                <%=Html.Encode(c.Url) %>
                " type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="280"
                                    height="225"></embed></object>
                        </center>
                    </td>
                    <% if (i == 3)
                       {%>
                </tr>
                <%i = 1;
                       }%>
                <%else i++; %>
                <%}%>
                <%if (i != 3)
                  {%>
                </tr>
                <%}%>
            </table>
            <%}%>
            <%else
                {
                    int j = 1;%>
            <%foreach (var c in Model.Videos)
              {%>
            <a href="<%=Html.Encode(c.Url)%>">Video
                <%=Html.Encode(j)%></a>
            <%} %>
            <%} %>
        </fieldset>
        <%}%>
        <% if (Model.Mapas.Count != 0)
           {%>
        <script type="text/javascript">
            $(document).ready(mainShow);
        </script>
        <%
            }%>
        <%
            
            var mapas = Model.Mapas;
            int countMarcos = 0;
        
        %>
        <input id="countMarcos" type="text" value="<%=mapas.Count%>" style="display: none" />
        <%
            foreach (var mapa in mapas)
            {
                string latitude = mapa.Latitude.ToString();
                string longitude = mapa.Longitude.ToString();
                latitude = latitude.Replace(',', '.');
                longitude = longitude.Replace(',', '.');
                string[] arrayMarcos = mapa.Morada.Split('§');
                string titulo = arrayMarcos[0];
                string corpo = arrayMarcos[1];%>
        <input id="latitude<%=countMarcos %>" type="text" value="<%=latitude%>" style="display: none" />
        <input id="longitude<%=countMarcos %>" type="text" value="<%=longitude %>" style="display: none" />
        <input id="titulo<%=countMarcos %>" type="text" value="<%=titulo %>" style="display: none" />
        <input id="corpo<%=countMarcos %>" type="text" value="<%=corpo %>" style="display: none" />
        <%
            countMarcos++;
        }
              
        %>
        <%if (Model.Mapas.Count != 0)
          {%>
        <fieldset>
            <legend>Mapa</legend>
            <center>
                <div id="mapaGoogle">
                </div>
            </center>
        </fieldset>
        <%}%>
    </fieldset>
    
    
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
    <%if (Model.Mapas.Count != 0)
      {%>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script src="../../Scripts/googleMapsV2.js" type="text/javascript">
    </script>
    <% }%>
    <script src="../../Scripts/upload.js" type="text/javascript"></script>
    <%if (Model.Imagems.Count != 0)
      {%>
    <script type="text/javascript"><%= ViewData["PicIds"] %></script>
    <script type="text/javascript" src="../../Scripts/picsprev.js"></script>
    <% }%>
</asp:Content>
