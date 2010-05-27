<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Registar
</asp:Content>


<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Registar uma nova conta.</h2>
    <p>
       Use o formulário em baixo para criar uma nova conta. 
    </p>

    <% using (Html.BeginForm("Register","Account")) { %>
        <%: Html.ValidationSummary(true, "Houve um erro ao criar a sua conta. Por favor corrija os erros e tente novamente.") %>
        <div>
            <fieldset>
                <legend>Informação da sua conta</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Email) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Name) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Name) %>
                    <%: Html.ValidationMessageFor(m => m.Name) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                <input type="image" id="image" src="<%=Url.Action("Image") %>" alt="clique para actualiar" />
                <div class="editor-label">
                <%: Html.LabelFor(m => m.Captcha) %>
            
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Captcha)%>
                    <%: Html.ValidationMessageFor(m => m.Captcha)%>
                </div>
                
                <p>
                    <input type="submit" value="Registar" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
