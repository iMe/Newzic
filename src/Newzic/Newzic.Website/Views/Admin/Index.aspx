<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <div id="menucontainer">
            
                           
                    <li><%: Html.ActionLink("Queixas", "Queixas", "Admin", new { email = Page.User.Identity }, null)%></li>    
                    <li><%: Html.ActionLink("gerir mods", "GerirMods", "Admin", new { email = Page.User.Identity }, null)%></li>   
               
            
     </div>

</asp:Content>
