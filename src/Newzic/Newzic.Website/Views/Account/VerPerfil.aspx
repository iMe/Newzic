﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	VerPerfil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Perfil do utilizador</h2>

    <fieldset>
        <legend>Perfil</legend>
        <center>
        <p>
        <big> Estatuto:</big>
        <%= Html.Encode(Model.Status) %>
        </p>
        </center>

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

        <p>
        <%:Html.ActionLink("Editar", "VerProprioPerfil", "Account", new { email = User.Identity.Name}, null)%>
        </p>
        
    </fieldset>

    <fieldset>
    <legend>Noticias</legend>
        <%foreach (var n in Model.noticias) { %>
            <p>
            <%= Html.ActionLink("Edit", "Edit", new { id=n.NoticiaId }) %> |
                <%= Html.ActionLink("Details", "Details", "News",new { id=n.NoticiaId },null)%> |
            <%=Html.Encode(n.Titulo) %>
            </p>
        <% } %>
    </fieldset>
    
    <p>
        <%: Html.ActionLink("Back to List", "/Home/Index") %>
    </p>

</asp:Content>

