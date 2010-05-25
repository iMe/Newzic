using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Controllers
{


    //[HandleError]
    public class AccountController : Controller
    {
        
        private IDataCRUD<Jornalista> jornList= new DataCRUD<Jornalista>();
        //private AccountsRepo acRepo = new AccountsRepo();

        private bool autenticado = false;

        public bool getAutenticado()
        {
            return autenticado;
        }

        public string iniciarSessao(string email, string password)
        {
            var jList = jornList.fetchAll();
            
            try
            {
                var jornalista = (from j in jList where (j.Email == email) && (j.Password == password) select j).Single();
                if (jornalista.isBanned())
                {
                    return "Banido";
                }
                else
                {
                    return "Autenticado";
                }

            }
            catch (Exception)
            {
                return "naoAutenticado";
            }
        }

        public ActionResult LogOff(LoginModel model)
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "");
        }

        
        public ActionResult Login(LoginModel login)
        {
            String email = login.Email;
            String pass = login.Password;
            //if (pass != null)
            //{
            //    pass = Hash.generate(pass);
            //}
            string res = null;
            if ((email != null ) && (pass != null))
                res = iniciarSessao(email, pass);
            if (res == "Autenticado")
            {
                autenticado = true;
                FormsAuthentication.Authenticate(email, pass);
                FormsAuthentication.SetAuthCookie(email, true);
                HttpContext.User.IsInRole("Admin");
                return RedirectToAction("Index", "Home");
                //return View("LogedIn");
            }
            else
            {
                if (res == "Banido")
                {
                    ModelState.AddModelError("", "Este utilizador encontra-se banido");
                }
                else
                    ModelState.AddModelError("","Palavra chave ou email inválido(s)");
            }
            return View("Login");
        }

        //gets jornalista by email
        public IQueryable<Jornalista> getJornalistaByEmail(string email)
        {
            var jList = jornList.fetchAll();
            var jornalista = from j in jList
                             where (j.Email == email)
                             select j;
            return jornalista;
        }

        //verifies if a Jornalist exists
        public bool userExists(string email)
        {
            bool res = false;
            var jornalista = getJornalistaByEmail(email);
            if (jornalista.Count() > 0)
                res = true;
            return res;
        }

        public ActionResult VerPerfil(string email)
        {
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();
            Jornalista j =(from Jornalista jr in dbj.fetchAll() where jr.Email.Equals(email) select jr).SingleOrDefault();
            //var j = getJornalistaByEmail(email);
            var perfil = new RegisterModel();

            if (j != null)
            {
                perfil.Email = j.Email;
                perfil.Name = j.Nome;
                perfil.Password = "";
                perfil.Status = getRole(j.JornalistaId);
                perfil.noticias = doSearch(j.JornalistaId);
                return View("VerPerfil", perfil);
            }

            //perfil.Email = "";
            //perfil.Name = "";
            //perfil.Password = "";
            //perfil.Status = "";

            return View("Error");
        }

        public ActionResult VerProprioPerfil(string email)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();
            
            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(User.Identity.Name) select j).SingleOrDefault();
            if (jorn == null || !jorn.Email.Equals(email)) return View("AcessoNegado");

            RegisterModel model = new RegisterModel();
            model.Name = jorn.Nome;
            model.Email = jorn.Email;
            model.Password = "";
            model.ConfirmPassword = "";
            model.Status = getRole(jorn.JornalistaId);

            return View("EditarPerfil", model);


        }

        private string getRole(Guid id)
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

        private List<Noticia> doSearch(Guid jorn)
        {
            List<Noticia> res = new List<Noticia>();
            IDataCRUD<Noticia> dbn = new DataCRUD<Noticia>();

            res = (from Noticia n in dbn.fetchAll() where n.JornalistaId.Equals(jorn) select n).ToList();

            return res;
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditarPerfil(RegisterModel model)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            var j = getJornalistaByEmail(model.Email).SingleOrDefault();
            if (j == null) return View("Error");
            if (ModelState.IsValid)
            {
                string name = Request.Form["Name"];
                string email = Request.Form["Email"];
                string password = Request.Form["Password"];
                string confirmPassword = Request.Form["ConfirmPassword"];

                //checks if passwords match
                if (password != confirmPassword)
                {
                    //model.ModelState.AddModelError("", "A password é diferente da sua confirmação");
                    ModelState.AddModelError("", "A password é diferente da sua confirmação.");
                    return View("EditarPerfil");
                }
                j.Email = email;
                j.Nome = name;
                j.Password = password;

                jornList.update(j);
                jornList.Save();
                jornList.Dispose();
                //ModelState.AddModelError("", "Perfil alterado com sucesso.");

            }
            
            model.Name = j.Nome;
            model.Status = getRole(j.JornalistaId);

            return View("EditarPerfil", model);
        }

        public ActionResult Register(RegisterModel model)
        {

            if (ModelState.IsValid)
            {
                string name = Request.Form["Name"];
                string email = Request.Form["Email"];
                string password = Request.Form["Password"];
                string confirmPassword = Request.Form["ConfirmPassword"];

                //checks if passwords match
                if (password != confirmPassword)
                {
                    //model.ModelState.AddModelError("", "A password é diferente da sua confirmação");
                    ModelState.AddModelError("", "A password é diferente da sua confirmação.");
                    return View(model);
                }
                // Attempt to register the user
                //checks if another user with the selected email exists
                if (userExists(email))
                {
                    ModelState.AddModelError("", "O email escolhido já existe. Por favor escolha um novo.");
                    return View(model);
                }
                Jornalista newJornalista = new Jornalista();
                newJornalista.Email = email;
                newJornalista.Nome = name;
                newJornalista.Password = Hash.generate(password);

                newJornalista.JornalistaId = Guid.NewGuid();
                jornList.create(newJornalista);
                jornList.Save();
            }

            return View();
        }




    }
}
