using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
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
        private readonly IDataCRUD<Jornalista> jornList = new DataCRUD<Jornalista>();
        private readonly IDataCRUD<Moderador> modList = new DataCRUD<Moderador>();
        private readonly IDataCRUD<Administrador> adminList = new DataCRUD<Administrador>();



        //gets queixa por id
        public Queixa getQueixa(string id)
        {
            var listaqueixas = qrepo.fetchAll();
            var queixa = (from q in listaqueixas where q.QueixaId.ToString() == id select q).Single();
            return queixa;
        }

        //gets jornalista by email
        public Jornalista getJornalistaByEmail(string email)
        {
            var jList = jornList.fetchAll();
            var jornalista = (from j in jList
                             where (j.Email == email)
                             select j).Single();
            return jornalista;
        }

        //gets jornalista by email
        public Moderador getModeradorByEmail(string email)
        {
            var mList = modList.fetchAll();
            var moderador = (from m in mList
                              where (m.Jornalista.Email == email)
                              select m).Single();
            return moderador;
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

            var allQueixas = qrepo.fetchAll().ToList();
            var listaQueixas = (from q in allQueixas where q.Resolved == false select q);
            return View("Queixas", listaQueixas.ToList());
        }

        public ActionResult resolv(string id)
        {
            var q = getQueixa(id);
            //q.Resolved = true;
            q.MarcarResolvida();
            qrepo.update(q);
            qrepo.Save();

            return View("QueixaResolvida");
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
  

       

        public ActionResult ModUnPromoteView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            return View("ModunPromoteView", mod);
        }


        //promote section
        public ActionResult ModUnPromote(string id, string email)
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

        public ActionResult ModPromoteView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            return View("ModPromoteView", mod);
        }

        public ActionResult ModPromote(string id, string email)
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
        public ActionResult ModUnBanView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var mod = getMod(id);
            return View("ModUnBanView", mod);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ModBanView(ModBanModel Ban)
        {

            //if (!isAdmin(Ban.Email))
            //{
            //    return View("acessoNegado");
            //}
            
            //Ban.Email = mod.Jornalista.Email;
            Ban.banTypeList = createDropList(new string[2] {"Permanente", "Temporario"});

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
                return View("ModBanConfirmView", Ban);
            }
            return View(Ban);

        }

        public ActionResult ModBanView(string id, string email)
        {
            //if (!isAdmin(email))
            //{
            //    return View("acessoNegado");
            //}
            var mod = getMod(id);
            ModBanModel Ban = new ModBanModel();
            Ban.Email = mod.Jornalista.Email;

            Ban.banTypeList = createDropList(new string[2] { "Permanente", "Temporario" });

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


            return View("ModBanView", Ban);
       }


        public ActionResult ModUnBan(string id, string email)
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

        public ActionResult ModBan(string id, string year, string month, string day, string type, string email)
        {
            //if (!isAdmin(email))
            //{
            //    return View("acessoNegado");
            //}
            var mod = getModeradorByEmail(id);
            if(!mod.isBanned())
            {
                 if (type == "1")
                {
                    mod.Jornalista.Ban();
                }
                if (type == "2")
                {
                    DateTime date = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
                    mod.Jornalista.Ban(date);
                }
            }
               
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
            var mods = modList.fetchAll().ToList();
            model.searchQuery = query;
            if (query!= null)
            {
                var searchResult = (from m in mods where (m.Jornalista.Email.Contains(query)) select m).ToList();
                model.Moderadores = searchResult;
                model.searchQuery = query;
                return View("GerirMods", model);
            }
            model.Moderadores = mods;
            model.searchQuery = "";
            return View("GerirMods", model);
        }

        //----------------------------------------Jornalistas--------------------------------------------------------


        private Jornalista getJorn(string id)
        {
            var jList = jornList.fetchAll();
            var jorn = (from j in jList where (j.JornalistaId.ToString() == id) select j).Single();
            return jorn;
        }
        
        public ActionResult GerirJorns(string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var jorns = jornList.fetchAll().ToList();
            GerirJornsModel model = new GerirJornsModel();
            model.Jornalistas = jorns;
            model.searchQuery = "";
            return View("GerirJorns",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult GerirJorns(GerirJornsModel model)
        {
            string query = model.searchQuery;
            var jorns = jornList.fetchAll().ToList();
            model.searchQuery = query;
            if (query != null)
            {
                var searchResult = (from j in jorns where (j.Email.Contains(query)) select j).ToList();
                model.Jornalistas = searchResult;
                model.searchQuery = query;
                return View("GerirMods", model);
            }
            model.Jornalistas = jorns;
            model.searchQuery = "";
            return View("GerirMods", model);
        }

        //promote section
        public ActionResult JornUnPromoteView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var jorn = getJorn(id);
            return View("JornUnPromoteView", jorn);
        }



        public ActionResult JornUnPromote(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var jorn = getJorn(id);
            if (jorn.isModerador())
                jorn.demote();
            else
            {
                ModelState.AddModelError("", "Este utilizador já é jornalista");
                return View("Index");
            }
            return View("SuccessView");
        }

        public ActionResult JornPromoteView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var jorn = getJorn(id);
            return View("JornPromoteView", jorn);
        }

        public ActionResult JornPromote(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }

            var jorn = getJorn(id);
            if (!jorn.isModerador())
                jorn.promote();
            else
            {
                ModelState.AddModelError("", "Este utilizador ja é Moderador");
                return View("Index");
            }
            return View("SuccessView");
        }

        //ban section
        public ActionResult JornUnBanView(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var jorn = getJorn(id);
            return View("JornUnBanView", jorn);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult JornBanView(JornBanModel Ban)
        {

            //if (!isAdmin(Ban.Email))
            //{
            //    return View("acessoNegado");
            //}

            Ban.banTypeList = createDropList(new string[2] { "Permanente", "Temporario" });
            
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

            

            if ((Ban.selectedMes == 2) && (Ban.selectedDia > 29))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View();
            }

            
            if (ModelState.IsValid)
            {
                return View("JornBanConfirmView", Ban);
            }
            return View(Ban);

        }

        public ActionResult JornBanView(string id, string email)
        {
            //if (!isAdmin(email))
            //{
            //    return View("acessoNegado");
            //}
            var jorn = getJorn(id);
            JornBanModel Ban = new JornBanModel();
            Ban.banTypeList = createDropList(new string[2] { "Permanente", "Temporario" });

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


            return View("JornBanView", Ban);
        }


        public ActionResult JornUnBan(string id, string email)
        {
            if (!isAdmin(email))
            {
                return View("acessoNegado");
            }
            var jorn = getJorn(id);
            if (jorn.isBanned())
                jorn.Unban();
            else
            {
                ModelState.AddModelError("", "Este utilizador não está banido");
                return View("Index");
            }

            return View("SuccessView");
        }

        public string getAdmins()
        {
            var admins = adminList.fetchAll().ToList();
            StringBuilder res = new StringBuilder();
            foreach(Administrador a in admins)
            {
                res.Append(a.Jornalista.Email);
                res.Append(",");
            }
            return res.ToString();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult JornBan(string id, string year, string month, string day, string type)
        {
            
            var jorn = getJornalistaByEmail(id);
            if (!jorn.isBanned())
            {
                if (type == "1")
                {
                    jorn.Ban();
                }
                if (type == "2")
                {
                    DateTime date = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
                    jorn.Ban(date);
                }
            }
            else
            {
                ModelState.AddModelError("", "Este utilizador já está banido");
                return View("Index");
            }
            return View("SuccessView");
        }

    }
}




