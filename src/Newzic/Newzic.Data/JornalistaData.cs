using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Data
{
    public class JornalistaData
    {
        NewzicDataContext db = new NewzicDataContext();

        public Jornalista fetchJornalista(Guid jornalistaID)
        {
            return db.Jornalistas.Single(id => id.JornalistaId == jornalistaID);
        }

        public List<Jornalista> fetchJornalistas()
        {
            var result = db.Jornalistas;
            return result.ToList();
        }

        public void createJornalista(Jornalista jornalista)
        {
            jornalista.JornalistaId = Guid.NewGuid();
            db.Jornalistas.InsertOnSubmit(jornalista);
        }

        public void updateJornalista(Jornalista jornalista)
        {
            throw new NotImplementedException();
        }

   }
}
