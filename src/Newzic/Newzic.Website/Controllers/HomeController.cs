using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            ViewData["Message"] = "Bem-vindo ao Newzic!";
            HomeModel model = new HomeModel();
            model.noticias = getNoticias();

            return View("Index",model);
        }

        public ActionResult About()
        {
            return View();
        }


        private List<Noticia> getNoticias()
        {
            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
            var ns = data.fetchAll();
            List<Noticia> res = new List<Noticia>();
            
            foreach (Noticia noticia in ns)
            {
                noticia.calcRank();
                res.Add(noticia);
            }

            res.OrderBy(x => x.rank).Reverse();
            //ns = from Noticia n in ns orderby n.rank select n;
            return res;
        }

    }
}
