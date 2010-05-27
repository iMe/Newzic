using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Newzic.Website.Models
{
    public class LoginModel : Controller
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Endereço Email")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Palavra chave")]
        public string Password { get; set; }

    }
}