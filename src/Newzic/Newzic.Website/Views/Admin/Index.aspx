<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index - Pagina Principal do Administrador</h2>

    <div id="menucontainer">
            
                           
                    <li><%: Html.ActionLink("Gerir Queixas dos Utilizadores", "Queixas", "Admin", new { email = Page.User.Identity.Name }, null)%></li>    
                    <li><%: Html.ActionLink("Gerir Moderadores e Promover Jornalistas", "GerirMods", "Admin", new { email = Page.User.Identity.Name }, null)%></li>   
               
            
     </div>

</asp:Content>
