using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newzic.Data;

namespace Newzic.Data
{
    public class NoticiaData
    {

        NewzicDataContext db = new NewzicDataContext();
        
        public Noticia fetchNoticia(Guid noticiaID)
        {
            var result = db.Noticias.Single(id => id.NoticiaId == noticiaID);
            if (result.Deleted) throw new DeletedNoticiaException();
            return result;
        }

        public List<Noticia> fetchNoticias()
        {
            return db.Noticias.ToList();
        }

        public void createNoticia(Noticia noticia)
        {
            db.Noticias.InsertOnSubmit(noticia);
        }

        public void updateNoticia(Noticia noticia)
        {
            var result = db.Noticias.Single(id => id.NoticiaId == noticia.NoticiaId);
            result.Titulo = noticia.Titulo;
            result.Data = noticia.Data;
            result.Corpo = noticia.Corpo;
            result.Imagems = noticia.Imagems;
            result.Mapas = noticia.Mapas;
            result.Videos = noticia.Videos;
            result.Marked = false;
        }

        public void removeNoticia(Guid noticiaID)
        {
            throw new NotImplementedException();
        }

        public void markNoticia(Guid noticiaID)
        {
            throw new NotImplementedException();
        }

        public void flagNoticia(Guid noticiaID)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            db.SubmitChanges();
        }

    }
}
