using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

namespace Newzic.Website.Models
{
    public class HomeModel : Controller
    {
        public List<Noticia> noticias { get; set; }
    }
}
