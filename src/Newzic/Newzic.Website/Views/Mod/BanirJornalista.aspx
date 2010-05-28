<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Newzic.Website.Models.JornBanModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Moderar - Banir Jornalista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Banir Jornalista - Preencha o formulario seguinte e pressione o botão Banir. </h2>
     <% using (Html.BeginForm("BanirJornalista2","Mod"))
        {
        }%>
    <% using (Html.BeginForm("BanirJornalista2","Mod")) {%>
        <%: Html.ValidationSummary(true,"Erro") %>
        
        <fieldset>
            <legend>Dados relativos ao Ban de um Jornalista:</legend>
            
           <table border="0" width="100%">
           <tr style="width:100%;">
                <td style="width:50%;">
                    <div class="editor-label">
                        <%= Html.Label("Tipo") %>
                        <%=Html.DropDownList("banType", Model.banTypeList)%>
                        <%= Html.HiddenFor(model => model.banTypeList) %>
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
                        <%: Html.HiddenFor(model => model.reason) %>
                        <%: Html.ValidationMessageFor(model => model.reason) %>
                    </div>
                </td>
           </tr>
           </table> 

            <p>
                <input type="submit" value="Banir" />
            </p>
        </fieldset>
<%--        <div>
        <%:Html.ActionLink("Back to List", "Index") %>
    </div>--%>

    <% } %>

    <div>
        <%:Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>  
