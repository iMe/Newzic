using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Models
{
    public class GerirModsModel : Controller
    {
        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Pesquisa")]
        public string searchQuery { get; set; }

        public List<Moderador>Moderadores { get; set; }
    }
}
