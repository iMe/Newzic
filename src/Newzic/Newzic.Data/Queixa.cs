using System;

namespace Newzic.Core
{
    public partial class Queixa : IEntity
    {
        Guid IEntity.Id
        {
            get { return QueixaId; }
            set { QueixaId = value; }
        }

        public void MarcarResolvida()
        {
            this.Resolved = true;
        }

    }
}