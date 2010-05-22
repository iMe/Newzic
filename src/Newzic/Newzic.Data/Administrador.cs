using System;

namespace Newzic.Core
{
    public partial class Administrador : IEntity
    {
        Guid IEntity.Id
        {
            get { return AdministradorId; }
            set { AdministradorId = value; }
        }
    }
}