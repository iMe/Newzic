using System;

namespace Newzic.Core
{
    public partial class Comentario : IEntity
    {
        Guid IEntity.Id
        {
            get { return ComentarioId; }
            set { ComentarioId = value; }
        }
    }
}