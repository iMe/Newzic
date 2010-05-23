<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.ModBanModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ModBanConfirmView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ModBanConfirmView</h2>
     <% using (Html.BeginForm())
        {%>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email%></div>
        
        <div class="display-label">ano</div>
        <div class="display-field"><%: Model.ano%></div>
        
        <div class="display-label">mes</div>
        <div class="display-field"><%: Model.mes%></div>
        
        <div class="display-label">dia</div>
        <div class="display-field"><%: Model.dia%></div>
        
        <div class="display-label">reason</div>
        <div class="display-field"><%: Model.reason%></div>
        
        <div class="display-label">selectedDia</div>
        <div class="display-field"><%: Model.selectedDia%></div>
        
        <div class="display-label">selectedMes</div>
        <div class="display-field"><%: Model.selectedMes%></div>
        
        <div class="display-label">selectedAno</div>
        <div class="display-field"><%: Model.selectedAno%></div>
        
        <div class="display-label">ValidateRequest</div>
        <div class="display-field"><%: Model.ValidateRequest%></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Banir Moderador", "ModBan", "Admin", new { id = Model.Email, year = Model.selectedAno, month = Model.selectedMes, day = Model.selectedDia, type = Model.banType }, null)%>,|
        <%: Html.ActionLink("Back to List", "Index")%>
    </p>
    <%}%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

