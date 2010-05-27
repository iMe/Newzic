<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Core.Moderador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Gerir Moderadores
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tem a certeza que deseja levantar o Ban deste Moderador ?</h2>

    <fieldset>
        <legend>Dados do Moderador:</legend>
        
        <div class="display-label">Nome: <%: Model.Jornalista.Nome %></div>
        <div class="display-label">Email: <%: Model.Jornalista.Email %></div>
        <% if (Model.Jornalista.Banidos[0].Permanente)
           {%>
        <div class="display-label">Tipo de Ban: PERMANENTE</div>
        <%
            }
           else
           {%>
        <div class="display-label">Tipo de Ban: TEMPORARIO</div>
        <div class="display-label">Data de Fim do Ban: <%:Model.Jornalista.Banidos[0].DataFim%></div>
        <%
           }%>
                
    </fieldset>
    <p>

        <%: Html.ActionLink("Levantar Ban", "ModUnBan", new { id=Model.ModeradorId }) %> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>

</asp:Content>

