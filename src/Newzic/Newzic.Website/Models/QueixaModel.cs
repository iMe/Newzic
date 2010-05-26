using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Newzic.Website.Models
{
    public class QueixaModel : Controller
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Queixoso: ")]
        public string email { get; set; }
        
        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Descreva aqui a sua queixa:")]
        public string texto { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Assunto:")]
        public string assunto { get; set; }
    }
}
