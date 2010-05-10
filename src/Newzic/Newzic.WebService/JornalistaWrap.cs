using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Pericles.WebService
{

    public class JornalistaWrap
    {

        private String Nome { get; set; }
        private String Email { get; set; }
        private String Password{ get; set; }
        private Guid JornalistaId { get; set; }

        public JornalistaWrap()
        {
            this.Nome = null;
            this.Email = null;
            this.Password = null;
            this.JornalistaId = Guid.Empty;
        }

        public JornalistaWrap(Jornalista j)
        {
            this.Nome = j.Nome;
            this.Email = j.Email;
            this.Password = j.Password;
            this.JornalistaId = j.JornalistaId;
        }

    }
}