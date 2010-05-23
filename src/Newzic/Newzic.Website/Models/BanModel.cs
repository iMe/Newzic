using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Newzic.Website.Models
{
    public class BanModel : Controller
    {

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Email do utilizador")]
        public string Email { get; set; }
        
        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Ano")]
        public string ano { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Mês")]
        public string mes { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Dia")]
        public string dia { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Razão")]
        public string reason { get; set; }
    }
}