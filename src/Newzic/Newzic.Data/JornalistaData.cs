using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Core
{
    public class JornalistaData : DataCRUD<Jornalista>
    {
        public override void remove(Jornalista entity)
        {
            entity.Ban();
        }
    }
}
