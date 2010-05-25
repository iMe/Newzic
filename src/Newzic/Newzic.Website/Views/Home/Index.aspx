<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.HomeModel>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Newzic
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <table border="0" width="100%">
    <%int i=1;%>
    <%foreach (var c in Model.noticias.ToList())
    {%>
  
    <%if((i%2)==1) {%>
        <tr style="width:100%;"> <%} %>
            <td style="width:50%;">
                <fieldset>
                    <h3><%:Html.ActionLink(c.Titulo, "Details", "News", new { id = c.NoticiaId.ToString() }, null) %></h3>
                    <%=Html.Encode(c.Corpo) %>
                    <p align="right"> <%=Html.Encode(c.Jornalista.Nome) %>
                        <%:Html.ActionLink("+", "VerPerfil", "Account", new { email = c.Jornalista.Email}, null)%>
                    </p>
                </fieldset>
            </td>
        <%i++; %>
        <%if((i%2)==1) {%>
        </tr><%} %>
 
   <% } %>
      </table>
</asp:Content>
