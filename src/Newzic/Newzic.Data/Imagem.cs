using System;

namespace Newzic.Core
{
    public partial class Imagem : IEntity
    {
        public Guid Id
        {
            get { return ImagemId; }
            set { ImagemId = value; }
        }
    }
}