<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
   Perguntas frequentes
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Perguntas frequentes</h2>
         <b> Como é que me registo? </b>
         <p align="left"> Para criar um novo registo basta ir à secção de registo e fornecer os dados pedidos. 
         Após a confirmação de registo pode iniciar a sessão e começar a publicar as suas próprias noticias </p>
         <b>Não consigo iniciar sessão. O que fazer? </b>
         <p align="left"> Verifique que o seu email e palavra chave estão correctos. Se mesmo assim não conseguir iniciar sessão contacte o administrador 
         em <a href="mailto:admin@newzic.pt"> admin@newzic.pt</a> </p>
         <b>Como faço para publicar uma noticia? </b>
         <p align="left"> Para publicar uma noticia clique em <em>Publicar Noticia</em> na pagina principal.</p>
         <b>Posso alterar a minha senha de acesso? </b>
         <p align="left"> Sim. Para alterar a sua senha de acesso e outra informação pessoal vá ao seu perfil, clicando no seu nome de utilizador, e clique em editar.</p>
         <b>Numa notica por mim publicada aparece a seguinte mensagem <em>"Esta Noticia está a violar as regras e pode ser apagada a qualquer momento"</em>. O que devo fazer? </b>
         <p>Para corrigir esta situação verique que a noticia publicada obedece aos padrões de publicação do Newzic.</p>
         
         <b>O Newzic divulga as minhas informações de utilizador?</b>
         <p align="left">Não. O Newzic não divulga em situação alguma a sua informação de utilizador </p>


</asp:Content>
