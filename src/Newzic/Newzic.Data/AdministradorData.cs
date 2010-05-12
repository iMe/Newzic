namespace Newzic.Data
{
    public class AdministradorData : DataCRUD<Administrador>
    {
        public override void remove(Administrador administrador)
        {
            administrador.Ban();
        }
    }
}