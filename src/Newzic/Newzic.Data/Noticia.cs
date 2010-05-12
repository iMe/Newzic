using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Data
{
    partial class Noticia : IEntity, ISoftDelete
    {
        Guid IEntity.Id
        {
            get { return NoticiaId; }
            set { NoticiaId = value; }
        }
    }
}
