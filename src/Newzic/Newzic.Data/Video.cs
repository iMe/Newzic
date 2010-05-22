using System;

namespace Newzic.Core
{
    public partial class Video : IEntity
    {
        Guid IEntity.Id
        {
            get { return VideoId; }
            set { VideoId = value; }
        }
    }
}