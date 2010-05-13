using System;

namespace Newzic.Core
{
    public partial class Video : IEntity
    {
        public Guid Id
        {
            get { return VideoId; }
            set { VideoId = value; }
        }
    }
}