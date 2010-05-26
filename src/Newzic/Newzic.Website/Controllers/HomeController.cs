using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;
using Newzic.Website.Rss;

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
            foreach (Noticia c in model.noticias)
            {
                if (c.Corpo.Length > 200)
                {
                    c.Corpo = c.Corpo.Substring(0, 200);
                    c.Corpo = c.Corpo + "(...)";

                }
            }

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

        public ActionResult Rssfeed()
        {

            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
            var items = new List<SyndicationItem>();
            var noticias = data.fetchAll().ToList();

            int count = 0;
            if (noticias.Count < 10)
                count = noticias.Count;
            else
            {
                count = 10;
            }


            var feed = new SyndicationFeed("Newzic rss feed",
                                                           "Ultimas noticias",
                                                           new Uri("http://newzic/rssfeed"),
                                                           "TestFeedID",
                                                           DateTime.Now);
            for (int i = 0; i < count; i++)
            {
                var item = new SyndicationItem(noticias[i].Titulo,
                                                           noticias[i].Corpo,
                                                           new Uri("http://localhost:49174/News/Details/" + noticias[i].NoticiaId),
                                                           "TestItemID",
                                                           DateTime.Now);
                items.Add(item);

            }
            feed.Items = items;
            return new RssActionResult() { Feed = feed };
        }
    }
}
