﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

namespace Newzic.Website.Models
{
    public class SearchQueryModel : Controller
    {
        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Query")]
        public string query { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Type")]
        public string type { get; set; }

       // public List<Noticia> noticias { get; set; }

    }
}