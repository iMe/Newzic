﻿using System;
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
        private readonly IDataCRUD<Noticia> repNoticias = new DataCRUD<Noticia>();
        private readonly IDataCRUD<Banido> repBanidos = new DataCRUD<Banido>();

        //
        // GET: /Mod/
        public ActionResult Index(string email)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");

            Jornalista user = getAutenticatedJornalista(email);
            return View("Index");
        }

        public ActionResult GerirJornalistas(string email)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");

            Jornalista user = getAutenticatedJornalista(email);

            var listaJornalistas = repJornalistas.fetchAll().ToList();
            return View("GerirJornalistas", listaJornalistas);
            
        }

        public ActionResult Unban(string id, string email)
        {
            if (!Request.IsAuthenticated) return View("acessoNegado");

            Jornalista user = getAutenticatedJornalista(email);

            if (user == null || !user.isModerador()) return View("acessoNegado");
            
            var gid = new Guid(id);

            var listaBanidos = repBanidos.fetchAll().ToList();
            var jornalista = repBanidos.fetchAll().Single(n => n.JornalistaId == gid).Jornalista;
            return View("ConfirmarUnban", jornalista);   
        }

        public ActionResult ConfirmaUnban(string id, string email)
        {
            
            Jornalista user = getAutenticatedJornalista(email);

            if (user == null || !user.isModerador()) return View("acessoNegado");

            Guid gid = new Guid(id);
            Banido jornalista = repBanidos.fetchAll().Single(n => n.JornalistaId == gid);
            jornalista.Jornalista.Unban();
            repBanidos.Save();

            var listaJornalitas = repJornalistas.fetchAll().ToList();
            return View("GerirJornalistas", listaJornalitas);
            
        }

        public ActionResult BanirJornalista(string id, string email)
        {
            Jornalista user = getAutenticatedJornalista(email);

            if (user == null || !user.isModerador()) return View("acessoNegado");
            
            Guid gid = new Guid(id);

            
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == gid);
            var ban = new JornBanModel(jornalista.Email);
            


            return View("BanirJornalista", ban);

            //return View("BanirJornalista", jornalista);
            
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult BanirJornalista2(JornBanModel Ban)
        {


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
            throw new NotImplementedException();
        }

        public ActionResult ConfirmaBanir(string id, string email)
        {
            Jornalista user = getAutenticatedJornalista(email);

            if (user == null || !user.isModerador()) return View("acessoNegado");
            
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
    }
}
