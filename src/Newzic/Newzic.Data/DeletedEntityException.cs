using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Core
{
    class DeletedEntityException : Exception
    {
        public DeletedEntityException()
            : base(Properties.Resources.DeletedEntityException)
        {

        }
    }
}
