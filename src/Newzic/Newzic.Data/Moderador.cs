using System;

namespace Newzic.Data
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