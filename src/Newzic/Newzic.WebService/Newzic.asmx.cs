using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

using Newzic.Core;
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

        // { }
        //-------------- Metodos do Leitor -------------------
        //
        private const Int32 Titulo = 0;
        private const Int32 Autor = 1;
        private const Int32 Tags = 2;
        private const Int32 Conteudo = 3;

        [WebMethod]
        public List<NoticiaWrap> searchNoticia(String query, Int32 type) 
        {
            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
            var ns = data.fetchAll();
            
            List<Noticia> result = new List<Noticia>();// = new IQueryable<Noticia>();
            switch (type)
            {
                case Titulo:
                    result = (from n in ns where n.Titulo.Contains(query) select n).ToList();
                    break;
                case Autor:
                    result = (from n in ns where n.Jornalista.Nome.Contains(query) select n).ToList();
                    break;
                case Tags:
                    result = (from n in ns where n.Tags.Contains(query) select n).ToList();
                    break;
                case Conteudo:
                    result = (from n in ns where n.Corpo.Contains(query) select n).ToList();
                    break;
                default:
                    //result = ns;
                    throw new ApplicationException("Tipo de pesquisa desconhecido");
            }

            List<NoticiaWrap> res = new List<NoticiaWrap>();
            foreach (Noticia n in result)
            {
                res.Add(new NoticiaWrap(n));
            }

            return res;
        }



        [WebMethod]
        public NoticiaWrap getNoticia(Guid idNoticia)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            NoticiaWrap res = new NoticiaWrap(data.fetch(idNoticia));
            
            return res;
        }



        [WebMethod]
        public List<ImagemWrap> getImagensOfNoticia(Guid idNoticia)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            List<Imagem> aux = data.fetch(idNoticia).Imagems.ToList();
            List<ImagemWrap> res = new List<ImagemWrap>();
            foreach (Imagem elem in aux)
            {
                //if (elem.NoticiaId==idNoticia)
                //{
                    res.Add(new ImagemWrap(elem));
                //}
            }

            return res;
        }



        [WebMethod]
        public MapaWrap getMapOfNoticia(Guid idNoticia)
        {
            NoticiaData data = new NoticiaData();
            Mapa aux = data.fetch(idNoticia).Mapa;
            MapaWrap res = new MapaWrap(aux);
            
            return res;
        }



        [WebMethod]
        public List<VideoWrap> getVideosOfNoticia(Guid idNoticia)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            List<Video> aux = data.fetch(idNoticia).Videos.ToList();
            List<VideoWrap> res = new List<VideoWrap>();

            foreach (Video video in aux)
            {
                //if (video.NoticiaId == idNoticia)
                //{
                    res.Add(new VideoWrap(video));
                //}
            }

            return res;
        }



        // { }
        //-------------- Metodos do Jornalista -------------------
        //

        [WebMethod]
        public void publicar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, MapaWrap mapa, String token)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            IWebServiceData web = new WebServiceData();
            if(!web.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");
            
            Jornalista jorn = web.getUser(token);

            Noticia ntc = new Noticia();
            ntc.NoticiaId = noticia.NoticiaId;
            ntc.Titulo = noticia.Titulo;
            ntc.Corpo = noticia.Corpo;
            ntc.Pontuacao = 0;
            ntc.Data = DateTime.Now;
            ntc.FlagCount = 0;
            ntc.Deleted = false;
            ntc.Marked = false;
            ntc.JornalistaId = jorn.JornalistaId;
            ntc.Tags = noticia.Tags;

            Guid idN = data.create(ntc);

            foreach (ImagemWrap imag in imagens)
            {
                Imagem i = new Imagem();
                i.ImagemId = imag.ImagemId;
                i.ImageFile = imag.ImageFile;
                i.NoticiaId = idN;
                ntc.Imagems.Add(i);
            }

            foreach (VideoWrap vid in videos)
            {
                Video v = new Video();
                v.VideoId = vid.VideoId;
                v.NoticiaId = idN;
                v.Url = vid.Url;
                ntc.Videos.Add(v);
            }

            Mapa m = new Mapa();
            m.MapaId = mapa.MapaId;
            m.NoticiaId = idN;
            m.Morada = mapa.Morada;
            m.Longitude = mapa.Longitude;
            m.Latitude = mapa.Latitude;
            ntc.Mapa = m;
            
            data.Save();
            //throw new NotImplementedException();
        }

        [WebMethod]
        public void editar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, MapaWrap mapa, String token)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            IWebServiceData web = new WebServiceData();
            if (!web.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");

            Jornalista jorn = web.getUser(token);

            Noticia ntc = new Noticia();
            ntc.NoticiaId = noticia.NoticiaId;
            ntc.Titulo = noticia.Titulo;
            ntc.Corpo = noticia.Corpo;
            ntc.Pontuacao = 0;
            ntc.Data = DateTime.Now;
            ntc.FlagCount = 0;
            ntc.Deleted = false;
            ntc.Marked = false;
            ntc.JornalistaId = jorn.JornalistaId;
            ntc.Tags = noticia.Tags;

            ntc.Imagems.Clear();
            ntc.Videos.Clear();
            ntc.Mapa = null;

            data.update(ntc);

            foreach (ImagemWrap imag in imagens)
            {
                Imagem i = new Imagem();
                i.ImagemId = imag.ImagemId;
                i.ImageFile = imag.ImageFile;
                i.NoticiaId = ntc.NoticiaId;
                ntc.Imagems.Add(i);
            }

            foreach (VideoWrap vid in videos)
            {
                Video v = new Video();
                v.VideoId = vid.VideoId;
                v.NoticiaId = ntc.NoticiaId;
                v.Url = vid.Url;
                ntc.Videos.Add(v);
            }

            Mapa m = new Mapa();
            m.MapaId = mapa.MapaId;
            m.NoticiaId = ntc.NoticiaId;
            m.Morada = mapa.Morada;
            m.Longitude = mapa.Longitude;
            m.Latitude = mapa.Latitude;
            ntc.Mapa = m;

            data.Save();
        }

        [WebMethod]
        public void votar(Guid idNoticia, String token)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            IWebServiceData serv = new WebServiceData();
            Jornalista j = serv.getUser(token);

            Noticia noticia = data.fetch(idNoticia);
            noticia.votarNoticia(j);
            data.Save();

            //if(!serv.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");
            //Guid idJornalista = serv.getUser(token);
            //data.votarNoticia(idJornalista,idNoticia);
        }



        // { }
        //-------------- Metodos de Sessao -------------------
        // 

        [WebMethod]
        public String login(String email, String password)
        {
            IWebServiceData data = new WebServiceData();
            String token = data.login(email, password);
            data.Save();
            return token;
        }

        [WebMethod]
        public void logout(String token)
        {
            IWebServiceData data = new WebServiceData();
            data.logout(token);
            data.Save();
        }
    }
}