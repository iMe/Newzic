using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

namespace Newzic.Website.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        private readonly IDataCRUD<Queixa> qrepo = new DataCRUD<Queixa>();
        private readonly IDataCRUD<Jornalista> qjorn = new DataCRUD<Jornalista>();
        private readonly IDataCRUD<Moderador> modList = new DataCRUD<Moderador>();
        public ActionResult Index(string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }

            return View("Index");
        }

        private static bool isAdmin(string email)
        {
            return true;
        }


        public ActionResult Queixas(string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }

            var listaQueixas = qrepo.fetchAll().ToList();

            return View("Queixas", listaQueixas);
        }

        public ActionResult resolv(string id)
        {
            //marcar como resolvida
            return View("resolved");
        }

        public ActionResult Details(string id)
        {
            Guid g = new Guid(id);
            var jList = qrepo.fetchAll();
            var q = (from n in jList where (n.QueixaId.ToString() == id) select n).ToList();

            //var q = qrepo.fetch(g);
            return View("QueixaDetails", q.First());
        }

        public ActionResult GerirMods(string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mods = modList.fetchAll().ToList();

            return View("GerirMods",mods);
        }
    }
}
