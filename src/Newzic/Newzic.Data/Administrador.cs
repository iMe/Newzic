using System;

namespace Newzic.Data
{
    public partial class Administrador : Moderador, IEntity
    {
        Guid IEntity.Id
        {
            get { return AdministradorId; }
            set { AdministradorId = value; }
        }
    }
}