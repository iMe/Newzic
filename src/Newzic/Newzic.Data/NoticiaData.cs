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
            noticia.NoticiaId = Guid.NewGuid();
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
            var result = db.Noticias.Single(id => id.NoticiaId == noticiaID);
            result.Deleted = true;
        }

        public void markNoticia(Guid noticiaID)
        {
            var result = db.Noticias.Single(id => id.NoticiaId == noticiaID);
            result.Marked = true;
        }

        public void flagNoticia(Guid noticiaID)
        {
            var result = db.Noticias.Single(id => id.NoticiaId == noticiaID);
            result.FlagCount++;
        }

        public void votarNoticia(Guid jornalistaID, Guid noticiaID)
        {
            throw new NotImplementedException();
        }

        //Metodos relativos as imagens de uma notícia
        public void createImagem(Imagem imagem)
        {
            throw new NotImplementedException();
        }

        public void updateImagem(Imagem imagem)
        {
            throw new NotImplementedException();
        }

        //Metodos relativos aos videos de uma notícia
        public void createVideo(Video video)
        {
            throw new NotImplementedException();
        }

        public void updateVideo(Video video)
        {
            throw new NotImplementedException();
        }

        //Metodos relativos aos mapas de uma notícia
        public void createMapa(Mapa mapa)
        {
            throw new NotImplementedException();
        }

        public void updateMapa(Mapa mapa)
        {
            throw new NotImplementedException();
        }

        public List<Noticia> searchNoticia(String query, int tipo)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            db.SubmitChanges();
        }

    }
}
