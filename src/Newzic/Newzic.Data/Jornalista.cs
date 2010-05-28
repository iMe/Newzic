using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Newzic.Core
{
    public partial class Jornalista : IEntity
    {
        IDataCRUD<Banido> repBanidos = new DataCRUD<Banido>();
        IDataCRUD<Moderador> repModerador = new DataCRUD<Moderador>();

        Guid IEntity.Id
        {
            get { return JornalistaId; }
            set { JornalistaId = value; }
        }

        public void Ban()
        {        
            var banido = new Banido();
            //banido.BanidoId = Guid.NewGuid();
            banido.Permanente = true;
            
            banido.JornalistaId = this.JornalistaId;

            Guid guid = repBanidos.create(banido);
           // banido.BanidoId = guid;
            //this.Banidos.Add(banido);
            
            repBanidos.Save();
        }

        public void Ban(DateTime dataFim)
        {
            IDataCRUD<Banido> data = new DataCRUD<Banido>();
            var banido = new Banido();
            //banido.BanidoId = Guid.NewGuid();
            banido.Permanente = false;
            //banido.Jornalista = this;
            banido.JornalistaId = this.JornalistaId;
            banido.DataFim = dataFim;
            //this.Banidos.Add(banido);
            repBanidos.create(banido);
            repBanidos.Save();
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
                if (a.Permanente == false && a.DataFim < DateTime.Now)
                {
                    return false;
                }
                return true;
            }
            catch (InvalidOperationException)
            {
                return false;
            }
        }

        public void promote()
        {
            var repModData = new ModeradorData();
            var moderador = new Moderador();
            moderador.ModeradorId = this.JornalistaId;
            Guid gid = repModData.create(moderador);
            repModData.Save();
        }

        public void demote()
        {
            var repModData = new ModeradorData();
            var moderador = repModData.fetchAll().Single(n => n.ModeradorId == this.JornalistaId);
            repModData.demote(moderador);
            repModData.Save();
        }

    }
}