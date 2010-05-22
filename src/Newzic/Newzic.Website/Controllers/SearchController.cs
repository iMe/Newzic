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
        private string[] dropList = new string[4] { "Titulo", "Autor", "Tags", "Conteudo" };

        //
        // GET: /Search/
        //{ }

        public ActionResult Results()
        {
            SearchQueryModel model = new SearchQueryModel();
            model.query = "";
            model.type = createDropList(dropList);
            model.typeSelected = 0;
            model.noticias= new List<Noticia>();
            return View("Results",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Results(SearchQueryModel model)
        {
            var queryString = model.query;
            var queryType = model.typeSelected;
            var res = doSearch(queryString, queryType);
            model.noticias = res;
            model.type=createDropList(dropList);
            return View("Results",model);
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

        public List<SelectListItem> createDropList(string[] list)
        {
            Int32 i = 0;
            List<SelectListItem> res = new List<SelectListItem>();
            foreach (string s in list)
            {

                res.Add(new SelectListItem
                {
                    Text = s,
                    Value = Convert.ToString(i)
                });
                i++;
            }
            
            return res;
        }

    }
}
