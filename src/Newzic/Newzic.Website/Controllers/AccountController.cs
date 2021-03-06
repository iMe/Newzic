﻿using System;
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
using XCaptcha;

namespace Newzic.Website.Controllers
{


    //[HandleError]
    public class AccountController : Controller
    {
        
        private IDataCRUD<Jornalista> jornList= new DataCRUD<Jornalista>();
        private readonly IDataCRUD<Moderador> modList = new DataCRUD<Moderador>();
        private readonly IDataCRUD<Administrador> adminList = new DataCRUD<Administrador>();
        //private AccountsRepo acRepo = new AccountsRepo();

        private bool autenticado = false;

        public bool getAutenticado()
        {
            return autenticado;
        }



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
                catch 
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
                catch 
                {

                    return false;
                }
            }

            return false;

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
                    IDataCRUD<Banido> repBanidos = new DataCRUD<Banido>();
                    Banido ban = repBanidos.fetchAll().SingleOrDefault(n => n.JornalistaId == jornalista.JornalistaId);
                    if (ban != null)
                        repBanidos.remove(ban);
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
            return RedirectToAction("Index", "Home");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(LoginModel login)
        {
            String email = login.Email;
            String pass = login.Password;
            if (pass != null)
            {
                pass = Hash.generate(pass);
            }
            string res = null;
            if ((email != null ) && (pass != null))
                res = iniciarSessao(email, pass);
            if (res == "Autenticado")
            {
                autenticado = true;
                FormsAuthentication.Authenticate(email, pass);
                FormsAuthentication.SetAuthCookie(email, true);
                //HttpContext.User.IsInRole("Admin");
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

        public ActionResult LoginForm()
        {
            if (User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            LoginModel model = new LoginModel();
            model.Email = "";
            model.Password = "";
            return View("Login", model);
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
            perfil.id = j.JornalistaId.ToString();
            perfil.banned = j.isBanned();
            if (UserIsInRole("Admin"))
            {
                perfil.viewerRole = "Admin";
            }
            else
            {
                if (UserIsInRole("Mod"))
                {
                    perfil.viewerRole = "Mod";
                }
                else
                {
                    perfil.viewerRole = "Jorn";
                }
            }
        
            perfil.profileRole = getRole(j.JornalistaId);

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
            //string res;

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
                return View("SuccessView");
            }
            
            model.Name = j.Nome;
            model.Status = getRole(j.JornalistaId);

            return View("EditarPerfil", model);
        }


        public ActionResult Image()
        {
            var builder = new XCaptcha.ImageBuilder();
            var result = builder.Create();
            Session.Clear();
            Session.Add(result.Solution, result.Solution);
            return new FileContentResult(result.Image, result.ContentType);
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(RegisterModel model)
        {

            if (ModelState.IsValid)
            {
                string name = Request.Form["Name"];
                string email = Request.Form["Email"];
                string password = Request.Form["Password"];
                string confirmPassword = Request.Form["ConfirmPassword"];
                string captcha = "";
                if (Session.Keys.Count > 0)
                    captcha = Session.Keys.Get(0);
                

                //checks if passwords match
                if (captcha != model.Captcha)
                {
                    //model.ModelState.AddModelError("", "A password é diferente da sua confirmação");
                    ModelState.AddModelError("", "O captcha está errado.");
                    return View(model);
                }

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

                return RedirectToAction("LoginForm", "Account");
            }

            return View("Register",model);
        }

        public ActionResult RegisterForm()
        {
            RegisterModel model = new RegisterModel();
            model.Status = "";
            model.Email = "";
            model.Name = "";
            model.noticias = null;
            model.Password = "";
            model.ConfirmPassword = "";
            model.Captcha = "";
            return View("Register", model);

        }




    }
}
