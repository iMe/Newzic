<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.HomeModel>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Newzic
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    
    <%foreach (var c in Model.noticias.ToList())
    {%>
  
    
    <table>
        <tr>
            <td style="width:50%;">
                <fieldset>
                    <h3>sadasdsdfffffffffffffffff</h3>
                </fieldset>
            </td>
            <td style="width:50%;">
                <fieldset>
                    <h3><%=Html.Encode(c.Titulo) %></h3>
                    <%=Html.Encode(c.Corpo) %>
                    <center> <%=Html.Encode(c.Jornalista.Nome) %></center>
                </fieldset>
            </td>
        </tr>
    </table>
   <% } %>
</asp:Content>
