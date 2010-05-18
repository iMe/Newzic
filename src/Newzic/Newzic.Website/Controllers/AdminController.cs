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

        private readonly DataCRUD<Queixa> qrepo = new DataCRUD<Queixa>();
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

        public ActionResult GerirMods(string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }

            return View("GerirMods");
        }
    }
}
