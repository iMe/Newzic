using System;
using System.Security.Cryptography;
using System.Text;

namespace Newzic.Core
{
    public partial class Jornalista : IEntity
    {
        Guid IEntity.Id
        {
            get { return JornalistaId; }
            set { JornalistaId = value; }
        }

        public void Ban()
        {
            var banido = new Banido();
            banido.BanidoId = Guid.NewGuid();
            banido.Permanente = true;
            banido.Jornalista = this;
            banido.JornalistaId = this.JornalistaId;
            this.Banidos.Add(banido);
        }

        public void Ban(DateTime dataFim)
        {
            var banido = new Banido();
            banido.BanidoId = Guid.NewGuid();
            banido.Permanente = false;
            banido.Jornalista = this;
            banido.JornalistaId = this.JornalistaId;
            banido.DataFim = dataFim;
            this.Banidos.Add(banido);
            
        }


    }
}