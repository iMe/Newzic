using System;

namespace Newzic.Core
{
    public partial class Banido : IEntity
    {
        Guid IEntity.Id
        {
            get { return BanidoId; }
            set { BanidoId = value; }
        }
    }
}