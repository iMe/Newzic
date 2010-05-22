using System;

namespace Newzic.Core
{
    public partial class Moderador : IEntity
    {
        Guid IEntity.Id
        {
            get { return ModeradorId; }
            set { ModeradorId = value; }
        }
    }
}