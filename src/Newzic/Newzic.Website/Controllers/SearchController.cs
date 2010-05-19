using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Controllers
{
    public class SearchController : Controller
    {
        private const Int32 Titulo = 0;
        private const Int32 Autor = 1;
        private const Int32 Tags = 2;
        private const Int32 Conteudo = 3;
        //
        // GET: /Search/
        //{ }

        public ActionResult SearchView()
        {
            return View("searchView");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Search(SearchQueryModel model)
        {
            //var queryString = Request.Form["query"];
            //var queryType = Int32.Parse(Request.Form["type"]);
            var queryString = model.query;
            var queryType = Int32.Parse(model.type);
            var res = doSearch(queryString, queryType);
            //query.noticias = search(query.query, query.type);
            return View("Search",res);
        }

        
        public List<Noticia> doSearch(String query, int type) 
        {
            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
            var ns = data.fetchAll();
            
           var result = new List<Noticia>();// = new IQueryable<Noticia>();
            if (query == "") {
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
            }
            else
            {
                result = ns.ToList();
            }

            return result;
        }

    }
}
