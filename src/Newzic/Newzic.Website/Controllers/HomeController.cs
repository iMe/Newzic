using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;
using Newzic.Website.Rss;
using System.Text;

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
                    c.Corpo = c.Corpo.Substring(0, 199);
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
                StringBuilder  body = new StringBuilder();
                if (noticias[i].Corpo.Length > 200)
                    body.Append(noticias[i].Corpo.Substring(0, 199));
                else
                {
                    body.Append(noticias[i].Corpo.Substring(0, noticias[i].Corpo.Length));
                }
                body.Append("(...)");
                var item = new SyndicationItem(noticias[i].Titulo,
                                                          body.ToString(),
                                                           new Uri("http://localhost:49174/News/Details/" + noticias[i].NoticiaId),
                                                           "TestItemID",
                                                           noticias[i].Data);
                items.Add(item);

            }
            feed.Items = items;
            return new RssActionResult() { Feed = feed };
        }

        public ActionResult FazerQueixas(string email)
        {
            IDataCRUD<Queixa> repQueixas = new DataCRUD<Queixa>();
            var queixa = new QueixaModel();
            queixa.email = email;
            return View("FazerQueixas", queixa);
            
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ProcessarQueixa(QueixaModel model)
        {
            Queixa queixa = new Queixa();
            IDataCRUD<Queixa> repQueixas = new DataCRUD<Queixa>();
            IDataCRUD<Jornalista> repJornalistas = new DataCRUD<Jornalista>();
            queixa.JornalistaId = repJornalistas.fetchAll().Single(n => n.Email.Equals(model.email)).JornalistaId;
            queixa.Resolved = false;
            queixa.Assunto = model.assunto;
            queixa.Texto = model.texto;
            queixa.QueixaId = repQueixas.create(queixa);
            repQueixas.Save();
            repQueixas.Dispose();
            repJornalistas.Dispose();
            return View("SuccessView");
        }
    }
}
