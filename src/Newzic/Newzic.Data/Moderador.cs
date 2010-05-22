using System;
using System.Linq;

namespace Newzic.Core
{
    public partial class Moderador : IEntity
    {
        private readonly IDataCRUD<Jornalista> repJornalistas = new DataCRUD<Jornalista>();

        Guid IEntity.Id
        {
            get { return ModeradorId; }
            set { ModeradorId = value; }
        }

        public void Ban()
        {
            var banido = new Banido();
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == this.ModeradorId);

            banido.BanidoId = Guid.NewGuid();
            banido.Permanente = true;
            banido.Jornalista = jornalista;
            banido.JornalistaId = jornalista.JornalistaId;
            jornalista.Banidos.Add(banido);
        }

        public void Ban(DateTime dataFim)
        {
            var banido = new Banido();
            var jornalista = repJornalistas.fetchAll().Single(n => n.JornalistaId == this.ModeradorId);

            banido.BanidoId = Guid.NewGuid();
            banido.Permanente = false;
            banido.Jornalista = jornalista;
            banido.JornalistaId = jornalista.JornalistaId;
            banido.DataFim = dataFim;
            jornalista.Banidos.Add(banido);
        }
    }
}