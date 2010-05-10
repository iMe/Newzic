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
            NoticiaData data = new NoticiaData();
            NoticiaWrap res = new NoticiaWrap(/*NoticiaData.*/data.fetchNoticia(idNoticia));
            
            return res;
        }



        [WebMethod]
        public List<ImagemWrap> getImagensOfNoticia(Guid idNoticia)
        {
            NoticiaData data = new NoticiaData();
            List<Imagem> aux = data.fetchNoticia(idNoticia).Imagems.ToList();
            List<ImagemWrap> res = null;

            foreach (Imagem elem in aux)
            {
                if (elem.NoticiaId==idNoticia)
                {
                    res.Add(new ImagemWrap(elem));
                }
            }

            return res;
        }



        [WebMethod]
        public MapaWrap getMapOfNoticia(Guid idNoticia)
        {
            NoticiaData data = new NoticiaData();
            List<Mapa> aux = data.fetchNoticia(idNoticia).Mapas.ToList();
            MapaWrap res = null;
            
            foreach (Mapa mapa in aux)
            {
                if (mapa.NoticiaId == idNoticia)
                {
                    res=new MapaWrap(mapa);
                }
            }
            
            return res;
        }



        [WebMethod]
        public List<VideoWrap> getVideosOfNoticia(Guid idNoticia)
        {
            NoticiaData data = new NoticiaData();
            List<Video> aux = data.fetchNoticia(idNoticia).Videos.ToList();
            List<VideoWrap> res = null;

            foreach (Video video in aux)
            {
                if (video.NoticiaId == idNoticia)
                {
                    res.Add(new VideoWrap(video));
                }
            }

            return res;
        }



        // { }
        //-------------- Metodos do Jornalista -------------------
        //

        [WebMethod]
        public void publicar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, MapaWrap mapa, String token)
        {
            NoticiaData data = new NoticiaData();
            WebServiceData web = new WebServiceData();
            if(!web.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");
            
            Guid jorn = web.getUser(token);

            Noticia ntc = new Noticia();
            ntc.NoticiaId = noticia.NoticiaId;
            ntc.Titulo = noticia.Titulo;
            ntc.Corpo = noticia.Corpo;
            ntc.Pontuacao = 0;
            ntc.Data = DateTime.Now;
            ntc.FlagCount = 0;
            ntc.Deleted = false;
            ntc.Marked = false;
            ntc.JornalistaId = jorn;

            Guid idN = data.createNoticia(ntc);

            foreach (ImagemWrap imag in imagens)
            {
                Imagem i = new Imagem();
                i.ImagemId = imag.ImagemId;
                i.ImageFile = imag.ImageFile;
                i.NoticiaId = idN;
                data.createImagem(i);
            }

            foreach (VideoWrap vid in videos)
            {
                Video v = new Video();
                v.VideoId = vid.VideoId;
                v.NoticiaId = idN;
                v.Url = vid.Url;
                data.createVideo(v);
            }

            Mapa m = new Mapa();
            m.MapaId = mapa.MapaId;
            m.NoticiaId = idN;
            m.Morada = mapa.Morada;
            m.Longitude = mapa.Longitude;
            m.Latidude = mapa.Latitude;
            data.createMapa(m);
            
            data.Save();
            //throw new NotImplementedException();
        }

        [WebMethod]
        public void editar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, MapaWrap mapa, String token)
        {
            NoticiaData data = new NoticiaData();
            WebServiceData web = new WebServiceData();
            if (!web.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");

            Guid jorn = web.getUser(token);

            Noticia ntc = new Noticia();
            ntc.NoticiaId = noticia.NoticiaId;
            ntc.Titulo = noticia.Titulo;
            ntc.Corpo = noticia.Corpo;
            ntc.Pontuacao = 0;
            ntc.Data = DateTime.Now;
            ntc.FlagCount = 0;
            ntc.Deleted = false;
            ntc.Marked = false;
            ntc.JornalistaId = jorn;

            data.updateNoticia(ntc);

            foreach (ImagemWrap imag in imagens)
            {
                Imagem i = new Imagem();
                i.ImagemId = imag.ImagemId;
                i.ImageFile = imag.ImageFile;
                i.NoticiaId = ntc.NoticiaId;
                data.updateImagem(i);
            }

            foreach (VideoWrap vid in videos)
            {
                Video v = new Video();
                v.VideoId = vid.VideoId;
                v.NoticiaId = ntc.NoticiaId;
                v.Url = vid.Url;
                data.updateVideo(v);
            }

            Mapa m = new Mapa();
            m.MapaId = mapa.MapaId;
            m.NoticiaId = ntc.NoticiaId;
            m.Morada = mapa.Morada;
            m.Longitude = mapa.Longitude;
            m.Latidude = mapa.Latitude;
            data.updateMapa(m);

            data.Save();
        }

        [WebMethod]
        public void votar(Guid idNoticia, String token)
        {
            NoticiaData data = new NoticiaData();
            WebServiceData serv = new WebServiceData();
            if(!serv.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");
            Guid idJornalista = serv.getUser(token);
            data.votarNoticia(idJornalista,idNoticia);
        }



        // { }
        //-------------- Metodos de Sessao -------------------
        // 

        [WebMethod]
        public String login(String email, String password)
        {
            WebServiceData data = new WebServiceData();
            String token = data.login(email, password);
            return token;
        }

        [WebMethod]
        public void logout(String token)
        {
            WebServiceData data = new WebServiceData();
            data.logout(token);
        }
    }
}