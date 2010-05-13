using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newzic.Core;

namespace Newzic.Core
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

    }
}
