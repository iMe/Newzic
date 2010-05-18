using System;

namespace Newzic.Core
{
    public partial class Queixa : IEntity
    {
        public Guid Id
        {
            get { return QueixaId; }
            set { QueixaId = value; }
        }


    }
}