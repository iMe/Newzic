namespace Newzic.Data
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
    }
    
}