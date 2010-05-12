using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Newzic.WebService
{

    public class JornalistaWrap
    {

        public String Nome { get; set; }
        public String Email { get; set; }
        public String Password{ get; set; }
        public Guid JornalistaId { get; set; }

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