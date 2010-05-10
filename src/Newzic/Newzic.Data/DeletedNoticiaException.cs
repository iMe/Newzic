using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Newzic.Data
{
    class DeletedNoticiaException : Exception
    {
        public DeletedNoticiaException()
            : base(Properties.Resources.DeletedNoticiaException)
        {

        }
    }
}
