<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar uma notícia</h2>

    <% using (Html.BeginForm()) {%>

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
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

