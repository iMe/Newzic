<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="scripts">
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
        type="text/javascript"></script>
    <script src="../../Scripts/maps.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/upload.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Criar Noticia</h2>
    <form action="/news/Create" method="post" enctype="multipart/form-data">

    <% using (Html.BeginForm()) {%>
    <%= Html.ValidationSummary(true, "Creation was unsuccessful. Please correct the errors and try again.") %>
    
    <fieldset>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            <%= Html.TextBoxFor(model => model.Titulo) %>
            <%= Html.ValidationMessageFor(model => model.Titulo) %>
        </div>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Corpo) %>
        </div>
        <div class="editor-field">
            <%= Html.TextAreaFor (model => model.Corpo, 10, 30, null) %>
            <%= Html.ValidationMessageFor(model => model.Corpo) %>
        </div>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Tags) %>
        </div>
        <div class="editor-field">
            <%= Html.TextBoxFor(model => model.Tags) %>
            <%= Html.ValidationMessageFor(model => model.Tags) %>
        </div>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Imagems) %>
        </div>
        <div id="uploads">
            <input type="file" name="file1" id="file1" />
        </div>
        <div class="editor-label">
            <%= Html.LabelFor(model => model.Videos) %>
        </div>
        <div>
            <%= Html.TextAreaFor(model=>model.listaVideos)%>
        </div>
        <%--<div class="editor-label">
            <%= Html.LabelFor(model => model.Mapa) %>
        </div>--%>
        <div id="map">
        </div>
        <input type="submit" value="Create" />
    </fieldset>
    </form>
    <% } %>
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
