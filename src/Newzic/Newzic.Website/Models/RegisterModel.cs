using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

namespace Newzic.Website.Models
{
    //[PropertiesMustMatch("Password", "ConfirmPassword", ErrorMessage = "A password e a sua confirmação tem de ser iguais.")]
    public class RegisterModel : Controller
    {
        [Required]
        [DisplayName("Nome")]
        public string Name { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Endereço email")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Palavra chave")]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Confirmação da palavra chave")]
        public string ConfirmPassword { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Captcha")]
        public string Captcha { get; set; }

        public string Status { get; set; }
        public string profileRole { get; set; }
        public string viewerRole { get; set; }
        public string id { get; set; }

        public List<Noticia> noticias { get; set; }

    }
}
