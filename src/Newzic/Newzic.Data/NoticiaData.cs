using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newzic.Data;

namespace Newzic.Data
{
    public class NoticiaData : DataCRUD<Noticia>
    {
        //Os datacontext tem de ser descartaveis...
        //O que leva a que sempre que na camada de apresentação se recorrer a camada de dados deve-se usar com using...


        // Update pode ficar vazio... 

        public override Noticia fetch(Guid id)
        {
            var f = base.fetch(id);
            if(f.Deleted)
            {
                throw new DeletedEntityException();
            }
            else
            {
                return f;
            }
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
    }
}
