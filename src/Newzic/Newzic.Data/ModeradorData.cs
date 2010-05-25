using System;

namespace Newzic.Core
{
    class ModeradorData: DataCRUD<Moderador>
    {
        public override void remove(Moderador moderador)
        {
            moderador.Ban();
        }

        public void demoteModerador(Moderador moderador)
        {
            db.GetTable<Moderador>().DeleteOnSubmit(moderador);
        }

        public override Guid create(Moderador moderador)
        {
            db.GetTable<Moderador>().InsertOnSubmit(moderador);
            return moderador.ModeradorId;
        }

    }
    
}