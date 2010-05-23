<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.SearchQueryModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Pesquisa
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

    <h2>Pesquisa</h2>
<%--     <% 
         var actionURL = "http://"+ Request.Url.Host + "/Search/Results2";
         using (Html.BeginForm("Results2","Search",FormMethod.Post,new { @action = actionURL })) --%>
         <%using (Html.BeginForm("Results","Search"))
        {%>
        <%--<%: Html.ValidationSummary(true, "") %>--%>
        <% } %>
        <fieldset>
                    <%using (Html.BeginForm("Results","Search"))
        {%>
            <legend>Fields</legend>
            <div class="editor-label">
                <%= Html.Label("Pesquisa") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.query) %>
                <%--<%= Html.ValidationMessageFor(model => model.query) %>--%>
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
    <% } %>

        </fieldset>
  <%--  <% } %>--%>
    
    <% if (Model.noticias.Count!=0) {%>
    <table>
        <tr style="width:900px;">
            <th style="width:5%;"></th>
            <th style="width:5%;">
                <% string var = 11.ToString();%>
                <%if (Model.state == 11) var = 10.ToString(); else var = 11.ToString(); %>
                <%--<%:Html.ActionLink("Rank", "Order", "Search", null, new Model {.class="tab"})%>--%>
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

    </form>

</asp:Content>

