<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<%@ Import Namespace="Newzic.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editar</h2>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            <%= Html.TextBoxFor(model => model.Titulo, new { style = "width:30%; height:30%;" })%>
            <%= Html.ValidationMessageFor(model => model.Titulo) %>
        </div>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Corpo) %>
        </div>
        <div class="editor-field" style="width: 100%; height: 100%;">
            <%= Html.TextAreaFor(model => model.Corpo, 12, 100, new { style = "width:100%; height:100%;" })%>
            <%= Html.ValidationMessageFor(model => model.Corpo) %>
        </div>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Tags) %>
        </div>
        <div class="editor-field">
            <%= Html.TextBoxFor(model => model.Tags, new { style = "width:30%; height:30%;" })%>
            <%= Html.ValidationMessageFor(model => model.Tags) %>
        </div>


        <div id="imagens">
            <%
                var listaImagens = Model.Imagems;
                var num = listaImagens.Count;
           
            %>
            <input id="numImagens" type="text" value="<%=num%>" />
            <%
           
           if (num > 0)
             Response.Write("<div>Imagens</div>");
                int countImagens = 0;
                foreach (Imagem imagem in listaImagens)
                {
                    string nome = imagem.Nome + "." + imagem.Tipo;
                    string source = "/News/getImage/" + imagem.ImagemId;
                    
            %>
            <div id="divImagem<%=countImagens%>">
                <input id="guidImagem<%=countImagens%>" type="text" value="<%=imagem.ImagemId%>" />
                <input id="remImagem<%=countImagens%>" type="button" value="x" />
                <a href="<%=source%>">
                    <%=nome %></a>
            </div>
            <%
                countImagens++;
                }
            %>
        </div>



        <input id="textBoxRemoveImagens" name = "textBoxRemoveImagens" type="text" value="" />
        <script type="text/javascript">

            function initHandlerRemove(num) {
                $('#remImagem' + num).click(function () {
                    $('#divImagem' + num).fadeOut();
                    $('#textBoxRemoveImagens')[0].value += $('#guidImagem' + num)[0].value + ';';
                });
            }

            function removeImagens(contador) {
                var x;
                for (x = 0; x < contador; x++) {
                    var num = x;
                    var idRemoveImagem = '#remImagem' + num;
                    var idDivImagem = '#divImagem' + num;
                    var idGuidImagem = '#guidImagem' + num;
                    
                    initHandlerRemove(x);
                }
            }

            function mainImagens() {
                
                var contador = $('#numImagens')[0].value;
                removeImagens(contador);
            }

            $(document).ready(mainImagens);

        </script>
        <div>
            <label>
                Links Videos</label>
        </div>
        <input id="textBoxVideos" name="textBoxVideos" type="text" style="width: 30%; height: 30%" />
        <input id="inserirVideo" type="button" value="+" />
        <input id="removeListaVideos" name="removeListaVideos" type="text" style="display: none" />
        <div id="linksVideos">
            <%
            var listaVideos = Model.Videos;
            if (listaVideos.Count == 0)
            {
                string caixaNumVideos = "<input id=\"link0\" name=\"link0\" type=\"text\" value=\"" + listaVideos.Count +
                                        "\" style=\"display: none\"/>";
                Response.Write(caixaNumVideos);
            }
            if (listaVideos.Count > 0)
            {

                string caixaNumVideos = "<input id=\"link0\" name=\"link0\" type=\"text\" value=\"" + listaVideos.Count +
                                        "\" style=\"display: none\"/>";
                Response.Write(caixaNumVideos);
                int contador = 1;
                foreach (var video in listaVideos)
                {
                    string id = "\"" + "link" + contador + "\"";
                    string novoLink = "<input id=" + id + " name=" + id + " value=" + "\"" + video.Url + "\"" + " style=\"display: none\" />";
                    Response.Write(novoLink);
                    contador++;
                }
            }
           
            %>
        </div>
        <div id="videos">
        </div>
        <script type="text/javascript">
            $(document).ready(initVideos);
            $(document).ready(main);
    
        </script>
        <%
        var mapas = Model.Mapas;
        int countMarcos = 0;
        
        %>
        <input id="countMarcos" type="text" value="<%=mapas.Count%>" style="display: none" />
        <%
        foreach (var mapa in mapas)
        {
            string latitude = mapa.Latitude.ToString (); 
            string longitude = mapa.Longitude.ToString ();
            latitude = latitude.Replace(',', '.');
            longitude = longitude.Replace (',','.');
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
        <br />
        <div id="mapaGoogle">
        </div>
        <br />
        <input id="dadosMarcoFadeIn" type="button" value="+" />
        <input id="dadosMarcoFadeOut" type="button" value="-" />
        <div id="dadosBalao" style="display: none">
            <fieldset>
                <label>
                    Titulo Balao
                </label>
                <br />
                <br />
                <input id="textTituloBalao" type="text" style="width: 30%; height: 50%;" />
                <br />
                <br />
                <label>
                    Corpo Balao
                </label>
                <br />
                <br />
                <textarea id="textCorpoBalao" style="width: 30%; height: 50%"></textarea>
                <br />
                <br />
                <input id="botaoSubmeter" type="button" value="Criar marca" />
            </fieldset>
        </div>
        <input id="stringComMarcos" name="stringComMarcos" type="text" style="display: none" />
        <br />
        <br />
        <input id="botaoAdicionaStringComMarcos" type="submit" value="Save" />
    </fieldset>
    <%
        }%>
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="scripts">
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script src="../../Scripts/googleMapsV2.js" type="text/javascript">
    </script>
    <script src="../../Scripts/addRemoveVideos.js" type="text/javascript">
    </script>
</asp:Content>
