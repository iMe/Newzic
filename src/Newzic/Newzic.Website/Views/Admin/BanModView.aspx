<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.BanModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	BanModView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>BanModView</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Email) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>
            
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ano) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ano)%>
                <%: Html.ValidationMessageFor(model => model.ano)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.mes) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.mes)%>
                <%: Html.ValidationMessageFor(model => model.mes)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.dia) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.dia)%>
                <%: Html.ValidationMessageFor(model => model.dia)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.reason) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.reason) %>
                <%: Html.ValidationMessageFor(model => model.reason) %>
            </div>
            
            <p>
                <input type="submit" value="Ban" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

