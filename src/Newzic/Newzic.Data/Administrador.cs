using System;
using System.Linq;

namespace Newzic.Core
{
    public partial class Administrador : IEntity
    {
        private readonly IDataCRUD<Jornalista> repJornalistas = new DataCRUD<Jornalista>();

        Guid IEntity.Id
        {
            get { return AdministradorId; }
            set { AdministradorId = value; }
        }

        public void Ban()
        {
            var banido = new Banido();
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == this.AdministradorId);

            banido.BanidoId = Guid.NewGuid();
            banido.Permanente = true;
            banido.Jornalista = jornalista;
            banido.JornalistaId = jornalista.JornalistaId;
            jornalista.Banidos.Add(banido);
        }
        
        public void Ban(DateTime dataFim)
        {
            var banido = new Banido();
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == this.AdministradorId);

            banido.BanidoId = Guid.NewGuid();
            banido.Permanente = false;
            banido.Jornalista = jornalista;
            banido.JornalistaId = jornalista.JornalistaId;
            banido.DataFim = dataFim;
            jornalista.Banidos.Add(banido);
        }

        public bool isBanned()
        {
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == this.AdministradorId);
            try
            {
                var a = jornalista.Banidos.Single(n => n.JornalistaId == this.AdministradorId);
                return true;
            }
            catch (InvalidOperationException)
            {
                return false;
            }
        }
    }
}