using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

using Newzic.Data;
using System.Collections;
using Newzic.WebService;

namespace Newzic.WebService
{
    /// <summary>
    /// Summary description for Service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Newzic : System.Web.Services.WebService
    {
        /*
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        */

        // { }
        //-------------- Metodos do Leitor -------------------
        //
        [WebMethod]
        public List<NoticiaWrap> searchNoticia(String query, String type) 
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public NoticiaWrap getNoticia(Guid idNoticia)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public List<ImagemWrap> getImagensOfNoticia(Guid idNoticia)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public MapaWrap getMapOfNoticia(Guid idNoticia)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public List<VideoWrap> getVideosOfNoticia(Guid idNoticia)
        {
            throw new NotImplementedException();
        }



        // { }
        //-------------- Metodos do Jornalista -------------------
        //

        [WebMethod]
        public void publicar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, MapaWrap mapa, String token)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public void editar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, MapaWrap mapa, String token)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public void votar(Guid idNoticia, String token)
        {
            throw new NotImplementedException();
        }



        // { }
        //-------------- Metodos de Sessao -------------------
        // 

        [WebMethod]
        public String login(String email, String password)
        {
            throw new NoNullAllowedException();
        }

        [WebMethod]
        public void logout(String token)
        {
            throw new NotImplementedException();
        }
    }
}