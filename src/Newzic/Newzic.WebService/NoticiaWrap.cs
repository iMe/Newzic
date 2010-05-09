using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Pericles.WebService {

    public class NoticiaWrap {

        private Guid NoticiaId { get; set; }
        private string Titulo { get; set; }
        private string Corpo { get; set; }
        private int Pontuacao { get; set; }
        private DateTime Data { get; set; }
        private int FlagCount { get; set; }
        private bool Deleted { get; set; }
        private bool Marked { get; set; }
        private Guid JornalistaId { get; set; }

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