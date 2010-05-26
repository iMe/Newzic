using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Controllers
{
    public class ModController : Controller
    {
        //Controlador que implementa as funcionalidades do Moderador
        private readonly IDataCRUD<Jornalista> repJornalistas = new DataCRUD<Jornalista>();
        private readonly IDataCRUD<Administrador> repAdministradores = new DataCRUD<Administrador>();
        private readonly IDataCRUD<Moderador> repModeradores = new DataCRUD<Moderador>();
        private readonly IDataCRUD<Noticia> repNoticias = new DataCRUD<Noticia>();
        private readonly IDataCRUD<Banido> repBanidos = new DataCRUD<Banido>();

        public bool UserIsInRole(string role)
        {
            string email = User.Identity.Name;
            if (role == "Admin")
            {
                try
                {
                    var admins = repAdministradores.fetchAll();
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
                    var mods = repModeradores.fetchAll();
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
        

        //
        // GET: /Mod/
        public ActionResult Index()
        {
            //if (!Request.IsAuthenticated) return View("acessoNegado");

            //Jornalista user = getAutenticatedJornalista(email);
            return View("Index");
        }

        public ActionResult GerirJornalistas()
        {

            if (!Request.IsAuthenticated) return View("acessoNegado");
            //if (!Request.IsAuthenticated) return View("acessoNegado");

            //Jornalista user = getAutenticatedJornalista(email);

            var listaJornalistas = repJornalistas.fetchAll().Where(n => n.Administrador == null).ToList();
            return View("GerirJornalistas", listaJornalistas);
            
        }

        public ActionResult Unban(string id)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");

            //Jornalista user = getAutenticatedJornalista(V);

            //if (user == null || !user.isModerador()) return View("acessoNegado");
            
            var gid = new Guid(id);

            var listaBanidos = repBanidos.fetchAll().ToList();
            var jornalista = repBanidos.fetchAll().Single(n => n.JornalistaId == gid).Jornalista;
            return View("ConfirmarUnban", jornalista);   
        }

        public ActionResult ConfirmaUnban(string id)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");
            
            //Jornalista user = getAutenticatedJornalista(email);

            //if (user == null || !user.isModerador()) return View("acessoNegado");

            Guid gid = new Guid(id);
            Banido jornalista = repBanidos.fetchAll().Single(n => n.JornalistaId == gid);
            jornalista.Jornalista.Unban();
            repBanidos.Save();

            var listaJornalitas = repJornalistas.fetchAll().ToList();
            return View("GerirJornalistas", listaJornalitas);
            
        }

        public ActionResult BanirJornalista(string id)
        {
            
            //if (user == null || !user.isModerador()) return View("acessoNegado");
            if (!Request.IsAuthenticated) return View("acessoNegado");
            Guid gid = new Guid(id);

            
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == gid);
            if (jornalista.isAdministrador()) return View("AcessoNegado");
            var ban = new JornBanModel(jornalista.Email);
            
            return View("BanirJornalista", ban);

            //return View("BanirJornalista", jornalista);
            
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult BanirJornalista2(JornBanModel Ban)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");

            if ((Ban.selectedMes == 2) && (Ban.selectedDia > 29))
            {
                ModelState.AddModelError("", "A data introduzida é inválida. Por favor corrija e tente novamente.");
                return View("JornBanView",Ban);
            }


            if (ModelState.IsValid)
            {
                return View("JornBanConfirmView", Ban);
            }
            return View("Error");
            
        }

        public Jornalista getJornalistaByEmail(string email)
        {
            
            var jList = repJornalistas.fetchAll();
            var jornalista = (from j in jList
                             where (j.Email == email)
                             select j).Single();
            return jornalista;
        }

        public ActionResult JornBan(string id, string year, string month, string day, string type)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");

            if (!UserIsInRole("Mod"))
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
                return View("GerirJornalistas", repJornalistas.fetchAll().ToList());
            }
            return View("SuccessView");
        }

        public ActionResult ConfirmaBanir(string id)
        {
            //Jornalista user = getAutenticatedJornalista(email);

            //if (user == null || !user.isModerador()) return View("acessoNegado");
            if (!Request.IsAuthenticated) return View("acessoNegado");
            Guid gid = new Guid(id);
            Jornalista jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == gid);
            jornalista.Ban();
            //repJornalistas.Save();
            //repBanidos.Save();

            var listaJornalistas = repJornalistas.fetchAll().ToList();
            return View("GerirJornalistas", listaJornalistas);

        }

        public Jornalista getAutenticatedJornalista(string email)
        {
            try
            {
                Jornalista user = repJornalistas.fetchAll().Single(n => n.Email.Equals(email));
                return user;
            }
            catch (InvalidOperationException)
            {
                return null;
            }
            
        }

        public ActionResult GerirNoticiasFlagged()
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");
            var noticiasFlagged = repNoticias.fetchAll().Where(n => n.NoticiaFlaggeds.Any() && n.Deleted == false);

            return View("GerirNoticiasFlagged",noticiasFlagged);
        }


        public ActionResult MarcarNoticia(string id)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");
            if (!UserIsInRole("Mod"))
                return View("AcessoNegado");

            var gid = new Guid(id);
            var noticia = repNoticias.fetchAll().Single(n => n.NoticiaId == gid);

            noticia.markNoticia();
            repNoticias.update(noticia);
            repNoticias.Save();

            return RedirectToAction("Details", "News", new {id = noticia.NoticiaId.ToString()});
            
        }
    }
}
