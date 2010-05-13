using System;

namespace Newzic.Core
{
    public partial class Moderador :Jornalista, IEntity
    {
        Guid IEntity.Id
        {
            get { return ModeradorId; }
            set { ModeradorId = value; }
        }
    }
}