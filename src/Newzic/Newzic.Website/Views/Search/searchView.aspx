<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.SearchQueryModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	searchView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>searchView</h2>

     <% using (Html.BeginForm()) {%>
        <%--<%: Html.ValidationSummary(true, "") %>
--%>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.query) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.query) %>
                <%= Html.ValidationMessageFor(model => model.query) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.type) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.type) %>
                <%= Html.ValidationMessageFor(model => model.type) %>
            </div>
           
            <p>
                <input type="submit" value="Search" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

