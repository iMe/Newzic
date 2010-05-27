<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.LoginModel>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Iniciar Sessão
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Login</h2>
    <% using (Html.BeginForm("Login","Account")) {%>
        <%: Html.ValidationSummary(true, "") %>
    <div>
    <fieldset>
          <div class="editor-label">
                    <%: Html.LabelFor(m => m.Email) %>
           </div>
           <div class="editor-field">
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(m => m.Password) %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.Password) %>
                <%: Html.ValidationMessageFor(m => m.Password) %>
            </div>
     <p>
            <input type="submit" value="Login" />
     </p>
     </fieldset>
     </div>

      <% } %>

</asp:Content>
