using System;

namespace Newzic.Core
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