<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.ModBanModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	BanModView
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>BanModView</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true,"Erro na introdução da data") %>
        
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
                <%= Html.Label("Dia") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("selectedDia", Model.diaList)%>
            </div>

             <div class="editor-label">
                <%= Html.Label("Mês") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("selectedMes", Model.mesList)%>
            </div>

             <div class="editor-label">
                <%= Html.Label("Ano") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("selectedAno", Model.anoList)%>
            </div>

            <div class="editor-label">
                <%= Html.Label("Tipo") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("banType", Model.banTypeList)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.reason) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.reason) %>
                <%: Html.ValidationMessageFor(model => model.reason) %>
            </div>
            
            <p>
                <input type="submit" value="Banir" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

