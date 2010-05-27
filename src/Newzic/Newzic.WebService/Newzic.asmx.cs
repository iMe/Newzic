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
            Noticia n = (from Noticia nn in data.fetchAll() where nn.NoticiaId == idNoticia select nn).SingleOrDefault();
            NoticiaWrap res = new NoticiaWrap(n);
            
            return res;
        }



        [WebMethod]
        public List<ImagemWrap> getImagensOfNoticia(Guid idNoticia)
        {
            IDataCRUD<Noticia> data = new NoticiaData();

            List<Imagem> aux = (from Imagem i in data.fetchAll() where i.NoticiaId == idNoticia select i).ToList();
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
        public List<MapaWrap> getMapOfNoticia(Guid idNoticia)
        {
            IDataCRUD<Mapa> data = new DataCRUD<Mapa>();
            List<MapaWrap> ret = new List<MapaWrap>();

            try
            {
                var mapas = (from m in data.fetchAll() where m.NoticiaId == idNoticia select m).ToList();
                foreach (Mapa mapa in mapas)
                {
                    ret.Add(new MapaWrap(mapa));
                }

                return ret;
            }
            catch (Exception)
            {
                throw new ApplicationException("Esta noticia nao tem Mapa");
                
            }
        }



        [WebMethod]
        public List<VideoWrap> getVideosOfNoticia(Guid idNoticia)
        {
            IDataCRUD<Video> data = new DataCRUD<Video>();
            List<Video> aux = (from Video v in data.fetchAll() where v.NoticiaId == idNoticia select v).ToList();
            List<VideoWrap> res = new List<VideoWrap>();

            foreach (Video video in aux)
            {
                    res.Add(new VideoWrap(video));
            }

            return res;
        }



        // { }
        //-------------- Metodos do Jornalista -------------------
        //

        [WebMethod]
        public void publicar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, List<MapaWrap> mapas, String token)
        {
            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
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
                i.ImageFile = imag.ImageFile;
                i.NoticiaId = idN;
                i.Nome = imag.Nome;
                i.Tipo = imag.Tipo;
                ntc.Imagems.Add(i);
            }

            foreach (VideoWrap vid in videos)
            {
                Video v = new Video();
                v.NoticiaId = idN;
                v.Url = vid.Url;
                ntc.Videos.Add(v);
            }

            foreach (MapaWrap mapa in mapas)
            {
                Mapa m = new Mapa();
                m.NoticiaId = idN;
                m.Morada = mapa.Morada;
                m.Longitude = mapa.Longitude;
                m.Latitude = mapa.Latitude;
                ntc.Mapas.Add(m);
            }
            
            data.update(ntc);
            data.Save();
            data.Dispose();
            //throw new NotImplementedException();
        }

        [WebMethod]
        public void editar(NoticiaWrap noticia, List<ImagemWrap> imagens, List<VideoWrap> videos, List<MapaWrap> mapas, String token)
        {
            IDataCRUD<Noticia> data = new NoticiaData();
            IWebServiceData web = new WebServiceData();
            if (!web.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");

            bool teste = (from Noticia nt in data.fetchAll()
                          where nt.NoticiaId == noticia.NoticiaId && nt.JornalistaId == web.getUser(token).JornalistaId && !nt.Deleted
                          select nt).Any();
            if (!teste) throw new ApplicationException("Noticia nao existe ou nao pertence ao utilizador registado");

            Jornalista jorn = web.getUser(token);

            Noticia ntc = (from Noticia notc in data.fetchAll() where notc.NoticiaId == noticia.NoticiaId select notc).Single();
            //ntc.NoticiaId = noticia.NoticiaId;
            ntc.Titulo = noticia.Titulo;
            ntc.Corpo = noticia.Corpo;
            //ntc.Pontuacao = 0;
            ntc.Data = DateTime.Now;
            //ntc.FlagCount = 0;
            ntc.Deleted = false;
            ntc.Marked = false;
            //ntc.JornalistaId = jorn.JornalistaId;
            ntc.Tags = noticia.Tags;

            ntc.Imagems.Clear();
            ntc.Videos.Clear();
            ntc.Mapas.Clear();

            //data.update(ntc);

            foreach (ImagemWrap imag in imagens)
            {
                Imagem i = new Imagem();
                //i.ImagemId = imag.ImagemId;
                i.ImageFile = imag.ImageFile;
                i.NoticiaId = ntc.NoticiaId;
                i.Nome = imag.Nome;
                i.Tipo = imag.Tipo;
                ntc.Imagems.Add(i);
            }

            foreach (VideoWrap vid in videos)
            {
                Video v = new Video();
                //v.VideoId = vid.VideoId;
                v.NoticiaId = ntc.NoticiaId;
                v.Url = vid.Url;
                ntc.Videos.Add(v);
            }

            foreach (MapaWrap mapa in mapas)
            {
                Mapa m = new Mapa();
                m.NoticiaId = ntc.NoticiaId;
                m.Morada = mapa.Morada;
                m.Longitude = mapa.Longitude;
                m.Latitude = mapa.Latitude;
                ntc.Mapas.Add(m);
            }

            data.update(ntc);
            data.Save();
            data.Dispose();
        }

        [WebMethod]
        public void votar(Guid idNoticia, String token)
        {
            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
            IWebServiceData serv = new WebServiceData();

            if (!serv.isLoged(token)) throw new ApplicationException("Utilizador desconhecido");
            Jornalista j = serv.getUser(token);


            Noticia noticia = (from Noticia n in data.fetchAll() where n.NoticiaId == idNoticia select n).SingleOrDefault();
            bool teste = (from v in noticia.VotoNoticias where v.JornalistaId == j.JornalistaId select v).Any();

            if (teste) throw new ApplicationException("Este utilizador já votou nesta noticia");
            if(noticia==null) throw new ApplicationException("A noticia nao existe");

            VotoNoticia voto = new VotoNoticia();
            voto.JornalistaId = j.JornalistaId;
            voto.NoticiaId = noticia.NoticiaId;

            noticia.VotoNoticias.Add(voto);
            data.update(noticia);
            data.Save();

        }



        // { }
        //-------------- Metodos de Sessao -------------------
        // 

        [WebMethod]
        public String login(String email, String password)
        {
            IWebServiceData data = new WebServiceData();
            try
            {
                String token = data.login(email, password);
                data.Save();
                return token;
            }
            catch (Exception e)
            {

                throw new ApplicationException(e.ToString());
            }
        }

        [WebMethod]
        public void logout(String token)
        {
            try
            {
                IWebServiceData data = new WebServiceData();
                data.logout(token);
                data.Save();
            }
            catch (Exception e)
            {
                
                throw new ApplicationException(e.ToString());
            }

        }
    }
}