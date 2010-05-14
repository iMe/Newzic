using System;

namespace Newzic.Core
{
    public partial class Banido : IEntity
    {
        public Guid Id
        {
            get { return BanidoId; }
            set { BanidoId = value; }
        }
    }
}