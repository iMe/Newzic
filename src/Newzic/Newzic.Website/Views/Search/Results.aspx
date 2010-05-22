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

    <table>
        <tr>
            <th></th>
            <th>
                 <%:Html.ActionLink("Rank", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 5.ToString() }, null)%>
            </th>
            <th>
                <%:Html.ActionLink("Titulo", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 0.ToString() }, null)%>
            </th>
<%--            <th>
                Corpo
            </th>--%>
 <%--               <th>
                    FlagCount
                </th>--%>
            <th>
                <%:Html.ActionLink("Data", "Order", "Search", new { q = Model.query, t = Model.typeSelected.ToString(), o = 4.ToString() }, null)%>
            </th>
<%--            <th>
                Deleted
            </th>
            <th>
                Marked
            </th>
            <th>
                JornalistaId
            </th>
            <th>
                Tags
            </th>
            <th>
                MapaId
            </th>--%>
        </tr>

    <% foreach (var item in Model.noticias) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.NoticiaId }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.NoticiaId })%>
            </td>
            <td>
                <%= Html.Encode(item.rank) %>
            </td>
            <td>
                <%= Html.Encode(item.Titulo) %>
            </td>
            <%--<td>
                <%= Html.Encode(item.Corpo) %>
            </td>
            <td>
                <%= Html.Encode(item.Pontuacao) %>
            </td>--%>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.Data)) %>
            </td>
            <%--<td>
                <%= Html.Encode(item.FlagCount) %>
            </td>
            <td>
                <%= Html.Encode(item.Deleted) %>
            </td>
            <td>
                <%= Html.Encode(item.Marked) %>
            </td>
            <td>
                <%= Html.Encode(item.JornalistaId) %>
            </td>
            <td>
                <%= Html.Encode(item.Tags) %>
            </td>
            <td>
                <%= Html.Encode(item.MapaId) %>
            </td>--%>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

