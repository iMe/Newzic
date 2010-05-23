using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

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
            try
            {
                Jornalista user = repJornalistas.fetchAll().Single(n => n.Email.Equals(email));
                if (!user.isModerador())
                    return View("acessoNegado");

                return View("Index");
            }
            catch (InvalidOperationException)
            {
                return View("acessoNegado");
            }
            
        }

        public ActionResult GerirJornalistasBanidos(string email)
        {
            try
            {
                Jornalista user = repJornalistas.fetchAll().Single(n => n.Email.Equals(email));
                if (!user.isModerador())
                    return View("acessoNegado");

                var listaBanidos = repBanidos.fetchAll().ToList();
                return View("GerirJornalistasBanidos", listaBanidos);
            }
            catch (Exception)
            {
                return View("acessoNegado");
            }
            
        }

        public ActionResult Unban(string id, string email)
        {
            try
            {
                Jornalista user = repJornalistas.fetchAll().Single(n => n.Email.Equals(email));
                if (!user.isModerador())
                    return View("acessoNegado");

                Guid gid = new Guid(id);

                var listaBanidos = repBanidos.fetchAll().ToList();
                var jornalista = repBanidos.fetchAll().Single(n => n.BanidoId == gid).Jornalista;
                return View("ConfirmarUnban", jornalista);
            }
            catch (InvalidOperationException)
            {
                return View("acessoNegado");
            }
            
            
        }

        public ActionResult ConfirmaUnban(string id, string email)
        {
            try
            {
                Jornalista user = repJornalistas.fetchAll().Single(n => n.Email.Equals(email));
                if (!user.isModerador())
                    return View("acessoNegado");

                Guid gid = new Guid(id);
                Banido jornalista = repBanidos.fetchAll().Single(n => n.JornalistaId == gid);
                jornalista.Jornalista.Unban();
                repBanidos.Save();

                var listaBanidos = repBanidos.fetchAll().ToList();
                return View("GerirJornalistasBanidos", listaBanidos);
            }
            catch (InvalidOperationException)
            {
                return View("acessoNegado");
            }
            

        }
    }
}
