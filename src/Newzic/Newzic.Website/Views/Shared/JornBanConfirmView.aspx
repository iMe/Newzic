<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.JornBanModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Moderar - Confirmar Ban
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tem a certeza que deseja banir este Jornalista ?</h2>
     <% using (Html.BeginForm())
        {%>
    <fieldset>
        <legend>Dados do Ban a confirmar:</legend>
        <div class="display-label">Email do utilizador: <%: Model.Email%></div>
        <div class="display-label">Razão do Ban: <%: Model.reason%></div>
        <%if (Model.banType == 1)
          {%>
        <div class="display-label">Tipo de Ban: PERMANENTE</div>
        <%
            }
          else
{%>
        <div class="display-label">Tipo de Ban: TEMPORARIO</div>
        <% DateTime d = new DateTime(Model.selectedAno,Model.selectedMes,Model.selectedDia); %>
        <div class="display-label">Data de Fim do Ban: <%: d.ToString("dd-MM-yyyy")%></div>
        <%
}%>
        
                       
        
        
    </fieldset>
    
    <p>
        <%: Html.ActionLink("Banir Jornalista", "JornBan", "Mod", new { id = Model.Email, year = Model.selectedAno, month = Model.selectedMes, day = Model.selectedDia, type = Model.banType }, null)%> |
        <%--<%: Html.ActionLink("Back to List", "GerirJornalistas", "Mod", new { email = Page.User.Identity.Name })%>--%>
    </p>
     <% }%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

