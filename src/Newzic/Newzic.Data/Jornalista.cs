using System;
using System.Linq;
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

        public void Unban()
        {
            IDataCRUD<Banido> data = new DataCRUD<Banido>();
            IQueryable<Banido> r = data.fetchAll();
            var banido = r.Single(b => b.JornalistaId == this.JornalistaId);

            this.Banidos.Remove(banido);
            data.remove(banido);
            data.Save();
        }

        public bool isAdministrador()
        {
            if (this.Administrador == null) return false;
            return true;
        }

        public bool isModerador()
        {
            if (this.Moderador == null) return false;
            return true;
        }

        public bool isBanned()
        {
            try
            {
                var a = this.Banidos.Single(n => n.JornalistaId == this.JornalistaId);
                return true;
            }
            catch (InvalidOperationException)
            {
                return false;
            }
        }

        public void promote()
        {
            throw new NotImplementedException();
        }

        public void demote()
        {
            throw new NotImplementedException();
        }

    }
}