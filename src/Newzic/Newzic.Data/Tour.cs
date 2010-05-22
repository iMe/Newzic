using System;

namespace Newzic.Core
{
    public partial class Tour : IEntity
    {
        Guid IEntity.Id
        {
            get { return TourId; }
            set { TourId = value; }
        }
    }
}