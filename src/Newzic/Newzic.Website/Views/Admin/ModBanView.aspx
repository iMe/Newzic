<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.ModBanModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrar - Banir Moderador
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Banir Moderador - Preencha o formulario seguinte e pressione o botão Banir.</h2>

    <% using (Html.BeginForm("ModBanView","Admin")) {%>
        <%: Html.ValidationSummary(true,"Erro na introdução da data") %>
        
        <fieldset>
            <legend>Dados relativos ao Ban de um Moderador</legend>
            
            <table border="0" width="100%">
           <tr style="width:100%;">
                <td style="width:50%;">
                    <div class="editor-label">
                        <%= Html.Label("Tipo") %>
                        <%=Html.DropDownList("banType", Model.banTypeList)%>
                        <%=Html.HiddenFor(model => model.banTypeList) %>
                        <%--<%: Html.ValidationMessageFor(model => model.banTypeList) %>--%>
                    </div>
                </td>
                <td style="width:50%;">
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Email) %>
                        
                    </div>
                    <div class="editor-label">
                        <%: Html.Encode(Model.Email) %>
                        <%: Html.HiddenFor(model => model.Email) %>
                    </div>
                </td>
           </tr>

           <tr style="width:100%;">
                <td>
                    <fieldset>
                        <legend>Data em que termina o Ban:</legend>
                        <div class="editor-label">
                            <%= Html.Label("Dia") %>
                        </div>
                        <div class="editor-field">
                            <%=Html.DropDownList("selectedDia", Model.diaList)%>
                            <%: Html.HiddenFor(model => model.diaList) %>
                        </div>

                        <div class="editor-label">
                            <%= Html.Label("Mês") %>
                        </div>
                        <div class="editor-field">
                            <%=Html.DropDownList("selectedMes", Model.mesList)%>
                            <%: Html.HiddenFor(model => model.mesList) %>
                        </div>
                        <div class="editor-label">
                            <%= Html.Label("Ano") %>
                        </div>
                        <div class="editor-field">
                            <%=Html.DropDownList("selectedAno", Model.anoList)%>
                            <%: Html.HiddenFor(model => model.anoList) %>
                        </div>
                    </fieldset>
                </td>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.reason) %>
                    </div>
                    <div class="editor-field" style="width:100%; height:100%;">
                        <%: Html.TextAreaFor(model => model.reason,12,100,new {style="width:100%; height:100%;"})%>
                        <%: Html.ValidationMessageFor(model => model.reason) %>
                    </div>
                </td>
           </tr>
           </table> 
            
            <%--<div class="editor-label">
                <%: Html.LabelFor(model => model.Email) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>
            

            <div class="editor-label">
                <%= Html.Label("Dia") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("selectedDia", Model.diaList)%>
            </div>

             <div class="editor-label">
                <%= Html.Label("Mês") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("selectedMes", Model.mesList)%>
            </div>

             <div class="editor-label">
                <%= Html.Label("Ano") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("selectedAno", Model.anoList)%>
            </div>

            <div class="editor-label">
                <%= Html.Label("Tipo") %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("banType", Model.banTypeList)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.reason) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.reason) %>
                <%: Html.ValidationMessageFor(model => model.reason) %>
            </div>--%>
            
            <p>
                <input type="submit" value="Banir" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Voltar", "Index") %>
    </div>

</asp:Content>

