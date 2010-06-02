<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="scripts">
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script src="../../Scripts/googleMapsV2.js" type="text/javascript"></script>
    <script src="../../Scripts/listVideos.js" type="text/javascript"></script>
    <script src="../../Scripts/upload.js" type="text/javascript" ></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Criar Noticia</h2>
    <% using (Html.BeginForm("Create", "News", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
    
    <%= Html.ValidationSummary(true, "Creation was unsuccessful. Please correct the errors and try again.") %>
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
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Imagems) %>
        </div>
        <div id="uploads">
            <input type="file" name="file1" id="file1" style="width: 30%; height: 30%;" />
        </div>
        <br />
        <div id="divDadosVideos">
            <div>
                <label>
                    Links Videos</label>
            </div>
            <input id="textBoxVideos" name="textBoxVideos" type="text" style="width: 30%; height: 30%" />
            <input id="inserirVideo" type="button" value="+" />
            <input id="removerVideo" type="button" value="-" />
            <br />
            <br />
            <select id="selectListVideos" name="selectListVideo" size="0" style="width: 30%;display: none;">
            </select>
            <input id="stringListaVideos" name="stringListaVideos" type="text" style="display:none"/>
        </div>
        <br />
        <br />
        <div id="mapaGoogle">
        </div>
        <br />
        <input id="dadosMarcoFadeIn" type="button" value="+" />
        <input id="dadosMarcoFadeOut" type="button" value="-" />
        <input id="botaoAdicionaStringComMarcos" type="button" value="Guardar Marcos" />
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
        <input type="submit" value="Criar Noticia" />
    </fieldset>
    
    <% } %>
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
