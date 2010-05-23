using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Newzic.Core;
using Newzic.Website.Models;

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

        private Moderador getMod(string id)
        {
            var modsList = modList.fetchAll();
            var mod = (from m in modsList where (m.Jornalista.JornalistaId.ToString() == id) select m).Single();
            return mod;
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

        public ActionResult ModDetais(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var modsList = modList.fetchAll();
            var mod = (from m in modsList where (m.Jornalista.JornalistaId.ToString() == id) select m).Single();
            return View("ModDetails", mod);
        }
  

       

        public ActionResult UnPromoteView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            return View("unPromoteView", mod);
        }


        //promote section
        public ActionResult UnPromoteMod(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            //despromover mod
            return View("SuccessView");
        }

        public ActionResult PromoteView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            return View("PromoteView", mod);
        }

        public ActionResult PromoteMod(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }

            //promover mod 
            return View("SuccessView");
        }

        //ban section
        public ActionResult UnBanView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            return View("UnBanView", mod);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult BanModView(BanModel Ban)
        {
            if (Int32.Parse(Ban.mes) > 12 || Int32.Parse(Ban.mes) < 0)
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View();
            }

            if (Int32.Parse(Ban.mes) ==  12 || Int32.Parse(Ban.mes) < 0)
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View();
            }




            return View("SuccessView");
        }

        public ActionResult BanModView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var m = getMod(id);
            //BanModel bm = new BanModel();
            return View("BanModView");
        }


        public ActionResult UnBanMod(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            //desbanir mod

            return View("SuccessView");
        }

        public ActionResult BanMod(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            //banir mod

            return View("SuccessView");
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
