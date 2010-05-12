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

        public void Ban()
        {
            throw new NotImplementedException();
        }

        public void Ban(DateTime dataFim)
        {
            throw new NotImplementedException();
        }
    }
}