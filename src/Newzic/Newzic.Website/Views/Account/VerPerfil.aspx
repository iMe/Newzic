<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.RegisterModel>" %>
<%@ Import Namespace="Newzic.Website.Controllers" %>

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


        <% if(Request.IsAuthenticated) {
               if (User.Identity.Name.Equals(Model.Email)){
               %>       
        <p>
            <%:Html.ActionLink("Editar", "VerProprioPerfil", "Account", new { email = User.Identity.Name}, null)%>
        </p>
        <% }
           }%>
        
    </fieldset>

    <fieldset>
    <legend>Noticias</legend>
        <%foreach (var n in Model.noticias) { %>
            <p>
            <% if(Request.IsAuthenticated) {
               if (User.Identity.Name.Equals(Model.Email)){
               %>   
            <%= Html.ActionLink("Editar", "Edit","News", new { id=n.NoticiaId },null) %> |
            <% } %>
            <%else {%>
            Editar |
            <% }
               } %>
                <%= Html.ActionLink("Detalhes", "Details", "News",new { id=n.NoticiaId },null)%> |
            <%=Html.Encode(n.Titulo) %>
            </p>
        <% } %>
    </fieldset>
    
    <p>
        <%: Html.ActionLink("Back to List", "/Home/Index") %>
    </p>

</asp:Content>

