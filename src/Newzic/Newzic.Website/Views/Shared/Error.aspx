<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Erro...
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Oups! Ocorreu um erro inesperado no sistema.
        Por favor diriga-se a secção de Queixas do Site para reportar este problema.
        Obrigado.
    </h2>
</asp:Content>
