namespace Newzic.Data
{
    class ModeradorData: DataCRUD<Moderador>
    {
        public override void remove(Moderador moderador)
        {
            moderador.Ban();
        }
    }
    
}