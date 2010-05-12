using System;

namespace Newzic.Data
{
    public partial class Jornalista : IEntity
    {
        Guid IEntity.Id
        {
            get { return JornalistaId; }
            set { JornalistaId = value; }
        }
    }
}