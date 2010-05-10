using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Newzic.WebService {

    public class NoticiaWrap {

        public Guid NoticiaId { get; set; }
        public String Titulo { get; set; }
        public String Corpo { get; set; }
        public Int32 Pontuacao { get; set; }
        public DateTime Data { get; set; }
        public Int32 FlagCount { get; set; }
        public Boolean Deleted { get; set; }
        public Boolean Marked { get; set; }
        public Guid JornalistaId { get; set; }

        public NoticiaWrap() {
            this.NoticiaId = Guid.Empty;
            this.Titulo = null;
            this.Corpo = null;
            this.Pontuacao = 0;
            this.Data = DateTime.MinValue;
            this.FlagCount = 0;
            this.Deleted = false;
            this.Marked = false;
            this.JornalistaId = Guid.Empty;
        }

        public NoticiaWrap(Noticia n) {
            this.NoticiaId = n.NoticiaId;
            this.Titulo = n.Titulo;
            this.Corpo = n.Corpo;
            this.Pontuacao = n.Pontuacao;
            this.Data = n.Data;
            this.FlagCount = n.FlagCount;
            this.Deleted = n.Deleted;
            this.Marked = n.Marked;
            this.JornalistaId = n.JornalistaId;
        }

    }
}