using System;

namespace Newzic.Core
{
    public partial class Comentario : IEntity
    {
        public Guid Id
        {
            get { return ComentarioId; }
            set { ComentarioId = value; }
        }
    }
}