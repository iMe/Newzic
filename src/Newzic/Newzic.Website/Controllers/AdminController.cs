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



        //gets jornalista by email
        public Jornalista getJornalistaByEmail(string email)
        {
            var jList = qjorn.fetchAll();
            var jornalista = (from j in jList
                             where (j.Email == email)
                             select j).Single();
            return jornalista;
        }

        //creates a list of strings to populate the dropLists
        public List<SelectListItem> createDropList(string[] list)
        {
            Int32 i = 1;
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
            //resolver queixa
            return View("queixaResolvida");
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
            var mod = getMod(id);
            if (mod.Jornalista.isModerador())
                mod.Jornalista.demote();
            else
            {
                ModelState.AddModelError("","Este utilizador já é jornalista");
                return View("Index");
            }
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

            var mod = getMod(id);
            if (!mod.Jornalista.isModerador())
                mod.Jornalista.promote();
            else
            {
                ModelState.AddModelError("","Este utilizador ja é Moderador");
                return View("Index");
            }
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

            if (!isAdmin(Ban.Email))
            {
                return View("acessoNegado");
            }
            string[] meses = new string[12] { "Janeiro", "Fevereiro", "Março", "Abril,", "Maio", "Junho", "Julho", "Agosto", "Setembro,", "Outubro", "Novembro", "Dezembro" };
            List<SelectListItem> diaList = new List<SelectListItem>();
            for (int i = 1; i <= 31;i++)
            {
                SelectListItem item = new SelectListItem();
                item.Text = i.ToString();
                item.Value = i.ToString();
                diaList.Add(item);
            }

            int nowYear = DateTime.Now.Year;
            List<SelectListItem> anoList = new List<SelectListItem>();
            for (int i = nowYear; i <= nowYear+10; i++)
            {
                SelectListItem item = new SelectListItem(); 
                item.Text = i.ToString();
                item.Value = i.ToString();
                anoList.Add(item);
            }
            
            List<SelectListItem> mesList = new List<SelectListItem>();
            int mes = 1;
            List<SelectListItem> res = new List<SelectListItem>();
            foreach (string m in meses)
            {
                SelectListItem item = new SelectListItem();
                item.Text = m;
                item.Value = mes.ToString();
                mesList.Add(item);
                mes++;
            }

            Ban.diaList = diaList;
            Ban.anoList = anoList;
            Ban.mesList = mesList;

            if (Ban.selectedMes > 12 || Ban.selectedMes < 1)
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View();
            }

            if ((Ban.selectedMes ==  2) && (Ban.selectedDia>29))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View();
            }

            if (Ban.selectedDia > 31 || (Ban.selectedDia < 1))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View();
            }
            if (ModelState.IsValid)
            {
                return View("BanConfirmView", Ban.Email);
            }
            return View(Ban);

        }

        public ActionResult BanModView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            BanModel Ban = new BanModel();
            
            string[] meses = new string[12] { "Janeiro", "Fevereiro", "Março", "Abril,", "Maio", "Junho", "Julho", "Agosto", "Setembro,", "Outubro", "Novembro", "Dezembro" };
            List<SelectListItem> diaList = new List<SelectListItem>();
            for (int i = 1; i <= 31; i++)
            {
                SelectListItem item = new SelectListItem();
                item.Text = i.ToString();
                item.Value = i.ToString();
                diaList.Add(item);
            }

            int nowYear = DateTime.Now.Year;
            List<SelectListItem> anoList = new List<SelectListItem>();
            for (int i = nowYear; i <= nowYear + 10; i++)
            {
                SelectListItem item = new SelectListItem();
                item.Text = i.ToString();
                item.Value = i.ToString();
                anoList.Add(item);
            }

            List<SelectListItem> mesList = new List<SelectListItem>();
            int m = 1;
            List<SelectListItem> res = new List<SelectListItem>();
            foreach (string mes in meses)
            {
                SelectListItem item = new SelectListItem();
                item.Text = mes;
                item.Value = m.ToString();
                mesList.Add(item);
                m++;
            }

            Ban.diaList = diaList;
            Ban.anoList = anoList;
            Ban.mesList = mesList;


            return View("BanModView", Ban);
       }


        public ActionResult UnBanMod(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            if(mod.isBanned())
                mod.Jornalista.Unban();
            else
            {
                ModelState.AddModelError("","Este utilizador não está banido");
                return View("Index");
            }
            
            return View("SuccessView");
        }

        public ActionResult BanMod(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            if(!mod.isBanned())
                mod.Jornalista.Ban();
            else
            {
                ModelState.AddModelError("","Este utilizador já está banido");
                return View("Index");
            }
            return View("SuccessView");
        }

        public ActionResult GerirMods(string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mods = modList.fetchAll().ToList();
            GerirModsModel model = new GerirModsModel();
            model.Moderadores = mods;
            model.searchQuery = "";
            return View("GerirMods",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult GerirMods(GerirModsModel model)
        {
            string query = model.searchQuery;
            //if (!isAdmin(email))
            //{
            //    return View("acessoNegado");
            //}
            var mods = modList.fetchAll();
            var searchResult = (from m in mods where (m.Jornalista.Email.Contains(query)) select m).ToList();
            //GerirModsModel model = new GerirModsModel();
            model.Moderadores = searchResult;
            model.searchQuery = query;
            return View("GerirMods", model);

        }
    }
}
