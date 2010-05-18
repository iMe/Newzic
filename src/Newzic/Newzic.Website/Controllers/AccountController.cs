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
        
        private DataCRUD<Jornalista> acRepo = new DataCRUD<Jornalista>();
        //private AccountsRepo acRepo = new AccountsRepo();

        private bool autenticado = false;

        public bool getAutenticado()
        {
            return autenticado;
        }

        public string iniciarSessao(string email, string password)
        {
            string res = "naoAutenticado";
            var jList = acRepo.fetchAll();
            var jornalista = from j in jList
                    //where (j.Email == email ) && (j.Password == Hash.generate(password))
                             where (j.Email == email) && (j.Password == password)
                    select j;

            if (jornalista.Count() != 0)
                res = "autenticado";

            return res;
        }

        public ActionResult LogOff(LoginModel model)
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "");
        }

        
        public ActionResult Login(LoginModel login)
        {
            string email = Request.Form["email"];
            string pass = Request.Form["password"];

            email = login.Email;
            pass = login.Password;
            string res = null;
            if ((email != null ) && (pass != null))
                res = iniciarSessao(email, pass);
            if (res == "autenticado")
            {
                autenticado = true;
                FormsAuthentication.Authenticate(email, pass);
                FormsAuthentication.SetAuthCookie(email, true);

                return RedirectToAction("Index", "");
                //return View("LogedIn");
            }
            else
            {
                ModelState.AddModelError("","Palavra chave ou email inválido(s)");
            }
            return View("Login");
        }

        //gets jornalista by email
        public IQueryable<Jornalista> getJornalistaByEmail(string email)
        {
            var jList = acRepo.fetchAll();
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
            var j = getJornalistaByEmail(email);
            var perfil = new RegisterModel();
            if (j.Count() != 0)
            {
                perfil.Email = j.First().Email;
                perfil.Name = j.First().Nome;
                perfil.Password = "";
                return View("VerPerfil", perfil);
            }

            perfil.Email = "";
            perfil.Name = "";
            perfil.Password = "";
            return View("VerPerfil", perfil);
        }

        //[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditarPerfil(RegisterModel model)
        {
            var j = getJornalistaByEmail(model.Email);
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
                j.First().Email = email;
                j.First().Nome = name;
                j.First().Password = password;

                acRepo.update(j.First());
                acRepo.Save();
                //ModelState.AddModelError("", "Perfil alterado com sucesso.");

            }
            
            model.Name = j.First().Nome;

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
                acRepo.create(newJornalista);
                acRepo.Save();
            }

            return View();
        }




    }
}
