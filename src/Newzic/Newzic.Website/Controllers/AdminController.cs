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


        public bool UserIsInRole(string role)
        {
            string email = User.Identity.Name; 
            if (role == "Admin")
            {   
                try
                {
                    var admins = adminList.fetchAll();
                    var admin = (from a in admins where a.Jornalista.Email.Equals(email) select a).Single();
                    if (admin.Jornalista.Email == email)
                    {
                        return true;
                    }
                }
                catch (Exception e)
                {

                    return false;
                }    
            }

            if (role == "Mod")
            {
                try
                {
                    var mods = modList.fetchAll();
                    var mod = (from m in mods where m.Jornalista.Email == email select m).Single();
                    if (mod.Jornalista.Email == email)
                    {
                        return true;
                    }
                }
                catch (Exception e)
                {

                    return false;
                }
            }

            return false;

        }

        public static string getRole(Guid id)
        {
            IDataCRUD<Administrador> dba = new DataCRUD<Administrador>();
            IDataCRUD<Moderador> dbm = new DataCRUD<Moderador>();
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();
            string res;

            bool r = (from Administrador a in dba.fetchAll() where a.AdministradorId.Equals(id) select a).Any();
            if (r) return "Administrador";

            r = (from Moderador m in dbm.fetchAll() where m.ModeradorId.Equals(id) select m).Any();
            if (r) return "Moderador";

            r = (from Jornalista j in dbj.fetchAll() where j.JornalistaId.Equals(id) select j).Any();
            if (r) return "Jornalista";

            return null;

        }

        public static string getRole(String email)
        {
            IDataCRUD<Administrador> dba = new DataCRUD<Administrador>();
            IDataCRUD<Moderador> dbm = new DataCRUD<Moderador>();
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();
            string res;

            Guid id = (from Jornalista jj in dbj.fetchAll() where jj.Email.Equals(email) select jj.JornalistaId).SingleOrDefault();

            bool r = (from Administrador a in dba.fetchAll() where a.AdministradorId.Equals(id) select a).Any();
            if (r) return "Administrador";

            r = (from Moderador m in dbm.fetchAll() where m.ModeradorId.Equals(id) select m).Any();
            if (r) return "Moderador";

            r = (from Jornalista j in dbj.fetchAll() where j.JornalistaId.Equals(id) select j).Any();
            if (r) return "Jornalista";

            return null;

        }

        //gets queixa por id
        public Queixa getQueixa(string id)
        {
            var listaqueixas = qrepo.fetchAll();
            try
            {
                var queixa = (from q in listaqueixas where q.QueixaId.ToString() == id select q).Single();
                return queixa;
            }
            catch (Exception)
            {
                var q = new Queixa();
                return q;
            }
            
        }

        //gets jornalista by email
        public Jornalista getJornalistaByEmail(string email)
        {
            var jList = jornList.fetchAll();
            try
            {
                var jornalista = (from j in jList
                                  where (j.Email == email)
                                  select j).Single();
                return jornalista;
            }
            catch (Exception)
            {
                
                var j = new Jornalista();
                return j;
            }
            
        }

        //gets jornalista by email
        public Moderador getModeradorByEmail(string email)
        {
            var mList = modList.fetchAll();
            try
            {
                var moderador = (from m in mList
                                 where (m.Jornalista.Email == email)
                                 select m).Single();
                return moderador;
            }
            catch (Exception)
            {
                
                var m = new Moderador();
                return m;
            }
            
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
        
        public ActionResult Index()
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");

            return View("Index");
        }

        private Moderador getMod(string id)
        {
            var modsList = modList.fetchAll();
            try
            {
                var mod = (from m in modsList where (m.Jornalista.JornalistaId.ToString() == id) select m).Single();
                return mod;
            }
            catch (Exception)
            {
                
                var m = new Moderador();
                return m;
            }
            
        }

        private static bool isAdmin(string email)
        {
            return true;
        }


        public ActionResult Queixas()
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var allQueixas = qrepo.fetchAll().ToList();
            var listaQueixas = (from q in allQueixas where q.Resolved == false select q);
            return View("Queixas", listaQueixas.ToList());
        }

        public ActionResult resolv(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var q = getQueixa(id);
            q.MarcarResolvida();
            qrepo.update(q);
            qrepo.Save();

            return View("QueixaResolvida");
        }

        public ActionResult Details(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            Guid g = new Guid(id);
            var jList = qrepo.fetchAll();
            try
            {
                var q = (from n in jList where (n.QueixaId.ToString() == id) select n).ToList();
                return View("QueixaDetails", q.First());
            }
            catch (Exception)
            {

                return View("Error");
            }
           
        }

        public ActionResult ModDetais(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var modsList = modList.fetchAll();
            try
            {
                var mod = (from m in modsList where (m.Jornalista.JornalistaId.ToString() == id) select m).Single();
                return View("ModDetails", mod);
            }
            catch (Exception)
            {

                return View("Error");
            }
            
        }
  

        public ActionResult ModUnPromoteView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var mod = getMod(id);
            return View("ModunPromoteView", mod);
        }


        //promote section
        public ActionResult ModUnPromote(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
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

        public ActionResult ModPromoteView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var mod = getMod(id);
            return View("ModPromoteView", mod);
        }

        public ActionResult ModPromote(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var jorn = getJorn(id);
            if (!jorn.isModerador())
                jorn.promote();
            return View("SuccessView");
        }

        //ban section
        public ActionResult ModUnBanView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var mod = getMod(id);
            return View("ModUnBanView", mod);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ModBanView(ModBanModel Ban)
        {

            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            
            //Ban.banTypeList = createDropList(new string[2] {"Permanente", "Temporario"});

            //string[] meses = new string[12] { "Janeiro", "Fevereiro", "Março", "Abril,", "Maio", "Junho", "Julho", "Agosto", "Setembro,", "Outubro", "Novembro", "Dezembro" };
            //List<SelectListItem> diaList = new List<SelectListItem>();
            //for (int i = 1; i <= 31;i++)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = i.ToString();
            //    item.Value = i.ToString();
            //    diaList.Add(item);
            //}

            //int nowYear = DateTime.Now.Year;
            //List<SelectListItem> anoList = new List<SelectListItem>();
            //for (int i = nowYear; i <= nowYear+10; i++)
            //{
            //    SelectListItem item = new SelectListItem(); 
            //    item.Text = i.ToString();
            //    item.Value = i.ToString();
            //    anoList.Add(item);
            //}
            
            //List<SelectListItem> mesList = new List<SelectListItem>();
            //int mes = 1;
            //List<SelectListItem> res = new List<SelectListItem>();
            //foreach (string m in meses)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = m;
            //    item.Value = mes.ToString();
            //    mesList.Add(item);
            //    mes++;
            //}

            //Ban.diaList = diaList;
            //Ban.anoList = anoList;
            //Ban.mesList = mesList;

            if (Ban.selectedMes > 12 || Ban.selectedMes < 1)
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                ModBanModel banModel = new ModBanModel(Ban.Email);
                banModel.reason = Ban.reason;
                return View(banModel);
            }

            if ((Ban.selectedMes ==  2) && (Ban.selectedDia>29))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                ModBanModel banModel = new ModBanModel(Ban.Email);
                banModel.reason = Ban.reason;
                return View(banModel);
            }

            DateTime data = new DateTime(Ban.selectedAno, Ban.selectedMes, Ban.selectedDia);
            if (data < DateTime.Now && Ban.banType ==2)
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                ModBanModel banModel = new ModBanModel(Ban.Email);
                banModel.reason = Ban.reason;
                return View(banModel);
            }

            if (Ban.selectedDia > 31 || (Ban.selectedDia < 1))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                ModBanModel banModel = new ModBanModel(Ban.Email);
                banModel.reason = Ban.reason;
                return View(banModel);
            }
            //if (ModelState.IsValid)
            //{
            //    return View("ModBanConfirmView", Ban);
            //}
            //return View(Ban);
            return View("ModBanConfirmView", Ban);

        }

        public ActionResult ModBanView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var mod = getMod(id);
            ModBanModel Ban = new ModBanModel(mod.Jornalista.Email);
            Ban.Email = mod.Jornalista.Email;
            return View("ModBanView", Ban);
       }


        public ActionResult ModUnBan(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
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

        public ActionResult ModBan(string id, string year, string month, string day, string type)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
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


        public ActionResult GerirMods()
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var mods = modList.fetchAll().Where(n => n.Jornalista.Administrador == null).ToList();
            GerirModsModel model = new GerirModsModel();
            model.Moderadores = mods;
            model.searchQuery = "";
            return View("GerirMods",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult GerirMods(GerirModsModel model)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            string query = model.searchQuery;
            var mods = modList.fetchAll().Where(n => n.Jornalista.Administrador == null && n.Jornalista.Banidos.Count == 0).ToList();
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
            try
            {
                var jorn = (from j in jList where (j.JornalistaId.ToString() == id) select j).Single();
                return jorn;
            }
            catch (Exception)
            {
                
                var j = new Jornalista();
                return j;
            }
            
        }
        
        public ActionResult GerirJorns()
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var jorns = jornList.fetchAll().Where(n => n.Moderador==null && n.Banidos.Count == 0).ToList();
            GerirJornsModel model = new GerirJornsModel();
            model.Jornalistas = jorns;
            model.searchQuery = "";
            return View("GerirJorns",model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult GerirJorns(GerirJornsModel model)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            string query = model.searchQuery;
            var jorns = jornList.fetchAll().Where(n => n.Moderador == null && n.Banidos.Count == 0).ToList();
            model.searchQuery = query;
            if (query != null)
            {
                var searchResult = (from j in jorns where (j.Email.Contains(query)) select j).ToList();
                model.Jornalistas = searchResult;
                model.searchQuery = query;
                return View("GerirJorns", model);
            }
            model.Jornalistas = jorns;
            model.searchQuery = "";
            return View("GerirJorns", model);
        }

        //promote section
        public ActionResult JornUnPromoteView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var jorn = getJorn(id);
            return View("JornUnPromoteView", jorn);
        }



        public ActionResult JornUnPromote(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
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

        public ActionResult JornPromoteView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var jorn = getJorn(id);
            return View("JornPromoteView", jorn);
        }

        public ActionResult JornPromote(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");

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
        public ActionResult JornUnBanView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var jorn = getJorn(id);
            return View("JornUnBanView", jorn);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult JornBanView(JornBanModel Ban)
        {

            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");

            Ban.banTypeList = createDropList(new string[2] { "Permanente", "Temporario" });
            
            //string[] meses = new string[12] { "Janeiro", "Fevereiro", "Março", "Abril,", "Maio", "Junho", "Julho", "Agosto", "Setembro,", "Outubro", "Novembro", "Dezembro" };
            //List<SelectListItem> diaList = new List<SelectListItem>();
            //for (int i = 1; i <= 31; i++)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = i.ToString();
            //    item.Value = i.ToString();
            //    diaList.Add(item);
            //}

            //int nowYear = DateTime.Now.Year;
            //List<SelectListItem> anoList = new List<SelectListItem>();
            //for (int i = nowYear; i <= nowYear + 10; i++)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = i.ToString();
            //    item.Value = i.ToString();
            //    anoList.Add(item);
            //}

            //List<SelectListItem> mesList = new List<SelectListItem>();
            //int mes = 1;
            //List<SelectListItem> res = new List<SelectListItem>();
            //foreach (string m in meses)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = m;
            //    item.Value = mes.ToString();
            //    mesList.Add(item);
            //    mes++;
            //}

            //Ban.diaList = diaList;
            //Ban.anoList = anoList;
            //Ban.mesList = mesList;

            

            if ((Ban.selectedMes == 2) && (Ban.selectedDia > 29))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                ModBanModel banModel = new ModBanModel(Ban.Email);
                banModel.reason = Ban.reason;
                return View(banModel);
            }
            DateTime data = new DateTime(Ban.selectedAno, Ban.selectedMes, Ban.selectedDia);
            if (data < DateTime.Now && Ban.banType ==2)
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                ModBanModel banModel = new ModBanModel(Ban.Email);
                banModel.reason = Ban.reason;
                return View(banModel);
            }

            
            if (ModelState.IsValid)
            {
                return View("JornBanConfirmView", Ban);
            }
            return View(Ban);

        }

        public ActionResult JornBanView(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
            var jorn = getJorn(id);
            JornBanModel Ban = new JornBanModel(jorn.Email);
            //Ban.banTypeList = createDropList(new string[2] { "Permanente", "Temporario" });

            //string[] meses = new string[12] { "Janeiro", "Fevereiro", "Março", "Abril,", "Maio", "Junho", "Julho", "Agosto", "Setembro,", "Outubro", "Novembro", "Dezembro" };
            //List<SelectListItem> diaList = new List<SelectListItem>();
            //for (int i = 1; i <= 31; i++)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = i.ToString();
            //    item.Value = i.ToString();
            //    diaList.Add(item);
            //}

            //int nowYear = DateTime.Now.Year;
            //List<SelectListItem> anoList = new List<SelectListItem>();
            //for (int i = nowYear; i <= nowYear + 10; i++)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = i.ToString();
            //    item.Value = i.ToString();
            //    anoList.Add(item);
            //}

            //List<SelectListItem> mesList = new List<SelectListItem>();
            //int m = 1;
            //List<SelectListItem> res = new List<SelectListItem>();
            //foreach (string mes in meses)
            //{
            //    SelectListItem item = new SelectListItem();
            //    item.Text = mes;
            //    item.Value = m.ToString();
            //    mesList.Add(item);
            //    m++;
            //}

            //Ban.diaList = diaList;
            //Ban.anoList = anoList;
            //Ban.mesList = mesList;


            return View("JornBanView", Ban);
        }


        public ActionResult JornUnBan(string id)
        {
            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
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

       
        public ActionResult JornBan(string id, string year, string month, string day, string type)
        {

            if (!UserIsInRole("Admin"))
                return View("AcessoNegado");
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




