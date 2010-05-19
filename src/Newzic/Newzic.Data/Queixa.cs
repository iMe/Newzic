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


    }
}