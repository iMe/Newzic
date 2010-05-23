<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.SearchQueryModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Pesquisa
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Pesquisa</h2>

     <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true, "") %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.Label("Pesquisa") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.query) %>
                <%= Html.ValidationMessageFor(model => model.query) %>
            </div>
           
            <div class="editor-label">
                <%= Html.Label("Tipo") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("typeSelected", Model.type)%>
            </div>
           
            <p>
                <input type="submit" value="Search" />
            </p>
        </fieldset>

    <% } %>

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
                <%if (Model.state == 17) var = 16.ToString(); else var = 17.ToString(); %>
                <%:Html.ActionLink("Titulo", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 0.ToString(), s=var}, null)%>
            </th>
            <th style="width:20%;">
                <%if (Model.state == 15) var = 14.ToString(); else var = 15.ToString(); %>
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
                <%= Html.ActionLink("Edit", "Edit", new { id=item.NoticiaId }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.NoticiaId })%>
            </td>
            <td>
                <b>
                <%= Html.Encode(item.rank) %>
                </b>
            </td>
            <td>
                <b>
                <%= Html.Encode(item.Titulo) %> </b><br>
                <%= Html.Encode(item.Corpo)%>
            </td>
            <td>
                <b>
                <%= Html.Encode(item.Jornalista.Nome) %>
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

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

