using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Core
{
    partial class Noticia : IEntity, ISoftDelete
    {
        
        public string listaVideos { get; set; }

        NewzicDataContext db = new NewzicDataContext();
        
        public double rank { get; set; }

        Guid IEntity.Id
        {
            get { return NoticiaId; }
            set { NoticiaId = value; }
        }

        
        public Video getVideo(Guid videoId)
        {
            throw new NotImplementedException();
        }

        public Imagem getImagem(Guid imagemId)
        {
            throw new NotImplementedException();
        }

        public void markNoticia()
        {
            this.Marked = true;
        }

        public void flagNoticia()
        {
            this.FlagCount++;
        }

        public void votarNoticia(Jornalista jornalista)
        {
            var voto = new VotoNoticia();
            voto.Noticia = this;
            voto.NoticiaId = this.NoticiaId;
            voto.Jornalista = jornalista;
            voto.JornalistaId = jornalista.JornalistaId;
            this.VotoNoticias.Add(voto);
        }

        public void addTag(String tag)
        {
            Tags = this.Tags+ tag + " ";
        }

        public void removeTag(String tag)
        {
            Tags =this.Tags.Replace(tag, "").Replace("  ", " ").Trim();
        }

        public void calcRank()
        {
            double data = (this.Data - DateTime.Now).TotalDays;
            double res = 0;
            if (data == double.MinValue) { res = this.Pontuacao; }
            else { res = this.Pontuacao / data; }

            this.rank = res;
        }

        public void setObjecto (Noticia origem)
        {
            this.Titulo = origem.Titulo;
            this.Corpo = origem.Corpo;
            this.Tags = origem.Tags;
        }
    }
}
