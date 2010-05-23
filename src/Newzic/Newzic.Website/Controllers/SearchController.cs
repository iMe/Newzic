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
        private const Int32 Data = 4;
        private const Int32 Rank = 5;
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
            model.order = 0;
            model.noticias= new List<Noticia>();
            return View("Results",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Results(SearchQueryModel model)
        {
            var queryString = model.query;
            var queryType = model.typeSelected;
            var res = doSearch(queryString, queryType);
            res = doOrder(res, Rank);
            model.noticias = res;
            model.type=createDropList(dropList);
            return View("Results",model);
        }

        public ActionResult Order(string q, string t, string o)
        {
            int typeSelected = Int32.Parse(t);
            int order = Int32.Parse(o);
           
            var res = doSearch(q, typeSelected);
            SearchQueryModel model=new SearchQueryModel();

            res = doOrder(res, order);

            model.typeSelected = typeSelected;
            model.type = createDropList(dropList);
            model.noticias = res;
            model.query = q;
            model.order = order;

            return View("Results",model);
        }

        
        //Aux
        public List<Noticia> doOrder(List<Noticia> l, int type)
        {
            List<Noticia> res = new List<Noticia>();
            switch (type)
            {
                case Titulo:
                    res = l.OrderBy(x => x.Titulo).ToList();
                    break;
                case Data:
                    res = l.OrderBy(x => x.Data).ToList();
                    break;
                case Rank:
                    res = l.OrderBy(x => x.rank).ToList();
                    break;
            }
            return res;
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
            foreach (Noticia noticia in result)
            {
                noticia.calcRank();
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
