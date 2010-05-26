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

        //Tipo de ordenacao
        private const Int32 RankASC = 10;
        private const Int32 RankDSC = 11;
        private const Int32 DataASC = 12;
        private const Int32 DataDSC = 13;
        private const Int32 AutorASC = 14;
        private const Int32 AutorDSC = 15;
        private const Int32 TituloASC = 16;
        private const Int32 TituloDSC = 17;

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
            model.state = RankDSC;
            model.page = 1;
            return View("Results",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Results(SearchQueryModel model)
        { 
            var queryString = model.query;
            var queryType = model.typeSelected;
            var res = doSearch(queryString, queryType);
            res = doOrder(res, Rank,RankDSC);
            model.noticias = res;
            model.type=createDropList(dropList);
            model.state = RankDSC;
            model.page = 1;
            return View("Results",model);
        }

        public ActionResult Teste(SearchQueryModel m){
            return View("Results", m);
        }

        public ActionResult Order(string q, string t, string o, string s)
        {
            int typeSelected = Int32.Parse(t);
            int order = Int32.Parse(o);
            
            var res = doSearch(q, typeSelected);
            SearchQueryModel model=new SearchQueryModel();

            res = doOrder(res, order, Int32.Parse(s));

            model.state = Int32.Parse(s);
            model.typeSelected = typeSelected;
            model.type = createDropList(dropList);
            model.noticias = res;
            model.query = q;
            model.order = order;
            model.page = 1;

            //return Teste(model);
            return View("Results",model);
        }

        
        //Aux
        public List<Noticia> doOrder(List<Noticia> l, int type, int state)
        {
            List<Noticia> res = new List<Noticia>();
            switch (type)
            {
                case Titulo:
                    res = l.OrderBy(x => x.Titulo).ToList();
                    if (state != TituloASC) res.Reverse();
                    break;
                
                case Autor:
                    res = l.OrderBy(x => x.Jornalista.Nome).ToList();
                    if(state!=AutorASC) res.Reverse();
                    break;
                
                case Data:
                    res = l.OrderBy(x => x.Data).ToList();
                    if (state != DataASC) res.Reverse();
                    break;
                
                case Rank:
                    res = l.OrderBy(x => x.rank).ToList();
                    if (state != RankASC) res.Reverse();
                    break;
            }
            return res;
        }

        public List<Noticia> doSearch(String query, int type) 
        {
            IDataCRUD<Noticia> data = new DataCRUD<Noticia>();
            var ns = data.fetchAll();
            
           var result = new List<Noticia>();// = new IQueryable<Noticia>();
            if (query != null) {
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
                if (noticia.Corpo.Length > 200)
                {
                    noticia.Corpo = noticia.Corpo.Substring(0, 200);
                    noticia.Corpo = noticia.Corpo + "(...)";

                }
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
