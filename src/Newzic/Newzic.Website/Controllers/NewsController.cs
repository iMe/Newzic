using System;
using System.Collections.Generic;
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
            NewsDetailsModel model = new NewsDetailsModel();
            IDataCRUD<Noticia> db = new DataCRUD<Noticia>();
            
            model.noticia = (from Noticia n in db.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            model.comments = null;
            model.comentario = null;
            return View("Show",model);
        }

        public ActionResult Comentario(NewsDetailsModel model)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");
            return View("Show", model);
        }

        //
        // GET: /Noticia/Create

        public ActionResult Create()
        {
            return View();
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
                        var email = User.Identity.Name;
                        IDataCRUD<Jornalista> jornalistaConsulta = new DataCRUD<Jornalista>();
                        IQueryable<Jornalista> jornalistas = jornalistaConsulta.fetchAll();
                        Jornalista jorn =
                            (from Jornalista j in jornalistas where j.Email.Equals(email) select j).Single();
                        var jornalistaId = jorn.JornalistaId;

                        noticia.Data = DateTime.Now;
                        noticia.JornalistaId = jornalistaId;

                        IDataCRUD<Noticia> noticiaAdd = new DataCRUD<Noticia>();



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
                throw new Exception("Utilizador nao está autenticado!");
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
