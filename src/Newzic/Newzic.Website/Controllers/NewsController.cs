using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

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

        public ActionResult Details(int id)
        {
            return View();
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
                    DataCRUD<Noticia> noticiaAdd = new DataCRUD<Noticia>();
                    noticia.Data = DateTime.Now;
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
