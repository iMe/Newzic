<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Perfil
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edite o seu perfil</h2>

    <% using (Html.BeginForm("EditarPerfil", "Account"))
       {%>
        <%: Html.ValidationSummary(true) %>
        <div>
        <fieldset>
            <legend>Perfil</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Name) %>
                <%: Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Email) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Password) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Password) %>
                <%: Html.ValidationMessageFor(model => model.Password) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ConfirmPassword) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ConfirmPassword) %>
                <%: Html.ValidationMessageFor(model => model.ConfirmPassword) %>
            </div>
            
            <p>
                <input type="submit" value="Editar" />
            </p>

            <%-- <%: Html.ActionLink("Cancelar", "editarPerfil", "Account", new {email = Model.Email}, "") %>--%>
            <%-- <%: Html.ActionLink("Editar", "Editar", "Account",  new {model = Model}, "") %>--%>
             
            
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Voltar", "Index", "Home") %>
    </div>
    </div>
</asp:Content>

