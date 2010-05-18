using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Core
{
    partial class Noticia : IEntity, ISoftDelete
    {
        NewzicDataContext db = new NewzicDataContext();

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
            Enumerable.Concat(this.Tags, " " + tag);
        }

        public void removeTag(String tag)
        {
            this.Tags.Replace(tag, "").Replace("  ", " ");
        }
    }
}
