﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="scripts">
    <script type="text/javascript" src="../../Scripts/upload.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create</h2>
    <% using (Html.BeginForm())
       {%>
       <form action="/news/Create" method="post" enctype="multipart/form-data">
    <fieldset>
        <legend>Fields</legend>
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
            <%= Html.TextBoxFor(model => model.Corpo) %>
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
        <input type="submit" value="Create" />
        <br />
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
    </form>
    <% } %>
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>