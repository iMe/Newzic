﻿using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Controllers
{
    public class NewsController : Controller
    {
        //
        // GET: /Noticia/

        public ActionResult Index()
        {
            DataCRUD<Noticia> obter = new DataCRUD<Noticia>();
            var noticias = obter.fetchAll();
            return View(noticias);

        }

        //
        // GET: /Noticia/Details/5

        public ActionResult Details(string id)
        {
            NewsDetailsModel model = buildModel(id);
            return View("Show",model);
        }

        public ActionResult Comentario(NewsDetailsModel model)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");
            string email = User.Identity.Name;
            
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();
            IDataCRUD<Comentario> dbc = new DataCRUD<Comentario>();

            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(email) select j).Single();
            
            Comentario c = new Comentario();
            c.Texto = model.comentario;
            c.JornalistaId = jorn.JornalistaId;
            //String s = ViewData["noticiaid"].ToString();
            c.NoticiaId = new Guid(model.guid);//model.noticia.NoticiaId;

            dbc.create(c);
            dbc.Save();
            dbc.Dispose();

            model = buildModel(model.guid);
            model.comentario = null;
            //if (model.comments==null) model.comments=new List<Comentario>();
            //model.comments.Add(c);
            return View("Show", model);
        }

        public ActionResult UpVote(string id)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            IDataCRUD<Noticia> dbn = new DataCRUD<Noticia>();
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();

            Noticia noticia = (from Noticia n in dbn.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(User.Identity.Name) select j).Single();
            var votos = noticia.VotoNoticias;
            Boolean b = votos.Any(vn => vn.JornalistaId == jorn.JornalistaId);//(from VotoNoticia vn in votos where vn.JornalistaId==jorn.JornalistaId select vn).Any();
            

            if (!b)
            {
                VotoNoticia voto = new VotoNoticia();
                voto.JornalistaId = jorn.JornalistaId;
                voto.NoticiaId = noticia.NoticiaId;
                noticia.VotoNoticias.Add(voto);
                noticia.Pontuacao++;

                dbn.Save();
                dbn.Dispose();
            }

            NewsDetailsModel model = buildModel(id);
            
            return View("Show", model);
        }

        public ActionResult DownVote(string id)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            IDataCRUD<Noticia> dbn = new DataCRUD<Noticia>();
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();

            Noticia noticia = (from Noticia n in dbn.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(User.Identity.Name) select j).Single();
            var votos = noticia.VotoNoticias;
            Boolean b = votos.Any(vn => vn.JornalistaId == jorn.JornalistaId);//(from VotoNoticia vn in votos where vn.JornalistaId==jorn.JornalistaId select vn).Any();


            if (!b)
            {
                VotoNoticia voto = new VotoNoticia();
                voto.JornalistaId = jorn.JornalistaId;
                voto.NoticiaId = noticia.NoticiaId;
                noticia.VotoNoticias.Add(voto);
                noticia.Pontuacao--;

                dbn.Save();
                dbn.Dispose();
            }

            NewsDetailsModel model = buildModel(id);

            return View("Show", model);
        }

        public ActionResult getImage(String id)
        {
            IDataCRUD<Imagem> dbi = new DataCRUD<Imagem>();
            byte[] res = dbi.fetchAll().Single(i => i.ImagemId.ToString().Equals(id)).ImageFile.ToArray();
            return new FileContentResult(res, "image/jpeg");
        }

        public NewsDetailsModel buildModel(string id)
        {
            NewsDetailsModel model = new NewsDetailsModel();
            IDataCRUD<Noticia> db = new DataCRUD<Noticia>();
            IDataCRUD<Comentario> dbc =new DataCRUD<Comentario>();

            model.comments = (from Comentario c in dbc.fetchAll() where c.NoticiaId.ToString().Equals(id) select c).ToList();
            model.noticia = (from Noticia n in db.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            //model.comments = null;
            model.comentario = null;
            model.guid = model.noticia.NoticiaId.ToString();
            
            return model;
        }
        //
        // GET: /Noticia/Create

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult AddVideo ()
        {
            var nameValueCollection = Request.Form;
            return View();
        }

        public void addMapaPoint (float longitude, float latitude, string localidade)
        {
            



        }

        //
        // POST: /Noticia/Create

        [HttpPost]
        public ActionResult Create(Noticia noticia)
        {
            var isAuthenticated = Request.IsAuthenticated;
            if (isAuthenticated == true)
            {
                if (ModelState.IsValid)
                {

                    try
                    {
                        foreach (string file in Request.Files)
                        {
                            HttpPostedFileBase hpf = Request.Files[file] as HttpPostedFileBase;
                            var fileSize = hpf.ContentLength;
                            if (fileSize == 0)
                                continue;

                            Imagem img = new Imagem();
                            byte[] buffer = new byte[fileSize];
                            hpf.InputStream.Read(buffer, 0, fileSize);
                            img.ImageFile = buffer;
                            noticia.Imagems.Add(img);

                        }

                        string listaVideos = noticia.listaVideos;
                        string[] arrayVideos = listaVideos.Split('\n');
                        /**
                         * Adição dos links youtube.
                         */
                        foreach (var arrayVideo in arrayVideos)
                        {
                            Video vs = new Video();
                            vs.Url = arrayVideo;
                            noticia.Videos.Add(vs);
                        }
                        var ss = noticia.Videos;
  
                        var email = User.Identity.Name;
                        IDataCRUD<Jornalista> jornalistaConsulta = new DataCRUD<Jornalista>();
                        IQueryable<Jornalista> jornalistas = jornalistaConsulta.fetchAll();
                        Jornalista jorn =
                            (from Jornalista j in jornalistas where j.Email.Equals(email) select j).Single();
                        var jornalistaId = jorn.JornalistaId;
                        noticia.Data = DateTime.Now;
                        noticia.JornalistaId = jornalistaId;
                        IDataCRUD<Noticia> noticiaAdd = new DataCRUD<Noticia>();
                        //noticia.Mapa.InsertTour(234.342f, 23409.234f, "Braga");
                        //noticia.Mapa.InsertTour(29123.23f, 1032.123f, "Lisboa");
                        //noticia.Mapa.Tours.
                        noticiaAdd.create(noticia);
                        noticiaAdd.Save();
                        return RedirectToAction("Index");
                    }
                    catch
                    {
                        return View(noticia);
                    }
                }
                else
                {
                    return View(noticia);
                }
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        //
        // GET: /Noticia/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Noticia/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
