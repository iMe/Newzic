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
    public class SearchQueryModel : Controller
    {
        //[Required]
        [DataType(DataType.Text)]
        [DisplayName("Query")]
        public string query { get; set; }

        //[Required]
        //[DataType(DataType.Text)]
        //[DisplayName("Type")]
        public List<SelectListItem> type { get; set; }

        public int typeSelected { get; set; }

        public List<Noticia> noticias { get; set; }

        public int order { get; set; }

        public int state { get; set; }

        public int page { get; set; }

        public bool merda { get; set; }

    }
}
