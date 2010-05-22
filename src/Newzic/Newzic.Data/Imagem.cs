using System;

namespace Newzic.Core
{
    public partial class Imagem : IEntity
    {
        Guid IEntity.Id
        {
            get { return ImagemId; }
            set { ImagemId = value; }
        }
    }
}