using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;

namespace Newzic.Website.Models
{
    public class NewsDetailsModel : Controller
    {

        public Noticia noticia { get; set; }
        public List<Comentario> comments { get; set; }
        public string comentario { get; set; }
        public string guid { get; set; }
        public bool hasMap { get; set; }
    }
}
