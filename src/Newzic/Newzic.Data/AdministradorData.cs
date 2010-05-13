namespace Newzic.Core
{
    public class AdministradorData : DataCRUD<Administrador>
    {
        public override void remove(Administrador administrador)
        {
            administrador.Ban();
        }
    }
}