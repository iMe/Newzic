<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	VerPerfil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Perfil do utilizador</h2>

    <fieldset>
        <legend>Perfil</legend>
        
        <p>
            Nome:
            <%= Html.Encode(Model.Name ) %>
        </p>

         <p>
            Email:
            <%= Html.Encode(Model.Email ) %>
        </p>

         <%--<p>
            Palavra chave:
            <%= Html.Encode(Model.Password ) %>
        </p>--%>
        
    </fieldset>
    <p>
        <%:Html.ActionLink("Editar", "EditarPerfil", "Account", new {email = Model.Email, name = Model.Name}, null) %>
        <%: Html.ActionLink("Back to List", "/Home/Index") %>
    </p>

</asp:Content>

