<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.QueixaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Efectuar uma queixa
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Preencha o seguinte formulario e pressione o botão Enviar Queixa</h2>

    <% using (Html.BeginForm("ProcessarQueixa", "Home")) {%>

        <fieldset>
            <legend>Dados da Queixa: </legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.email) %>
            
                <%= Html.DisplayFor(model => model.email) %>
                <%= Html.HiddenFor(model => model.email) %>
                <%= Html.ValidationMessageFor(model => model.email) %>
            </div>
            
            <div class="editor-label">
                <%=Html.LabelFor(model => model.assunto) %>
            </div>
            <div class="editor-field" style="width:25%;">
                <%= Html.TextBoxFor(model => model.assunto, new {style="width:100%;"}) %>
                <%= Html.ValidationMessageFor(model => model.texto) %>
            </div>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.texto) %>
            </div>
            <div class="editor-field" style="width:100%; height:100%;">
                <%= Html.TextAreaFor(model => model.texto,12,100,new {style="width:100%; height:100%;"}) %>
                <%= Html.ValidationMessageFor(model => model.texto) %>
            </div>
                         
            <p>
                <input type="submit" value="Enviar Queixa" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Voltar", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

