<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.SearchQueryModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Pesquisar noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

    <h2>Pesquisar</h2>
         <%using (Html.BeginForm("Results","Search"))
        {%>
        <% } %>
        <fieldset>
                    <%using (Html.BeginForm("Results","Search"))
        {%>
            <legend>Faça a sua pesquisa</legend>
            <div class="editor-label">
                <%= Html.Label("Pesquisa") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.query) %>
            </div>
           
            <div class="editor-label">
                <%= Html.Label("Tipo") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("typeSelected", Model.type)%>
            </div>
            <p>
                <input type="submit" value="Procurar" />
            </p>
    <% } %>

        </fieldset>

    <% if (Model.noticias.Count!=0) {%>
    <table>
        <tr style="width:900px;">
            <th style="width:5%;"></th>
            <th style="width:5%;">
                <% string var = 11.ToString();%>
                <%if (Model.state == 11) var = 10.ToString(); else var = 11.ToString(); %>
                <%:Html.ActionLink("Rank", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 5.ToString(), s=var}, null)%>
            </th>
            <th style="width:50%;">
                <%if (Model.state == 16) var = 17.ToString(); else var = 16.ToString(); %>
                <%:Html.ActionLink("Titulo", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 0.ToString(), s=var}, null)%>
            </th>
            <th style="width:20%;">
                <%if (Model.state == 14) var = 15.ToString(); else var = 14.ToString(); %>
                <%:Html.ActionLink("Jornalista", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 1.ToString(), s=var}, null)%>
            </th>
            <th style="width:20%;">
                <%if (Model.state == 13) var = 12.ToString(); else var = 13.ToString(); %>
                <%:Html.ActionLink("Data", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 4.ToString(), s=var}, null)%>
            </th>
        </tr>

    
    <% foreach (var item in Model.noticias) { %>
    
        <tr>
            <td>
                <%if(Request.IsAuthenticated) {
                    if(User.Identity.Name.Equals(item.Jornalista.Email)) {   
                %>
                    <%= Html.ActionLink("Editar", "Edit","News",new { id=item.NoticiaId },null) %> |
                <% }%>
                <%else {%>
                    Editar |
                <% } } %>
                <%= Html.ActionLink("Detalhes", "Details", "News",new { id=item.NoticiaId },null)%>
            </td>
            <td>
                <b>
                <%= Html.Encode(item.Pontuacao) %>
                </b>
            </td>
            <td>
                <b>
                <%= Html.Encode(item.Titulo) %> </b><br>
                <%if (!Request.Browser.IsMobileDevice) {%>
                <small>
                <%= Html.Encode(item.Corpo)%>
                </small>
                <% }%>
            </td>
            <td>
                <b>
                <%= Html.Encode(item.Jornalista.Nome) %> <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = item.Jornalista.Email}, null)%>
                </b>
            </td>
            <td>
                <b>
                <%= Html.Encode(String.Format("{0:g}", item.Data)) %>
                </b>
            </td>

        </tr>
    
        <% } %>
    <% } %>
    
    <%else {%>
        <h3> Nao existem resultados para esta pesquisa</h3>
    <% } %>

    </table>

    <<%--p>
        <%= Html.ActionLink("Criar nova", "Create") %>
    </p>--%>

    <div>
        <%=Html.ActionLink("Voltar", "Index", "Home")%>
    </div>

    </form>

</asp:Content>

