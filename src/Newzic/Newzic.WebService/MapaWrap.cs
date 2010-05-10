using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Pericles.WebService
{

    public class MapaWrap
    {

        private Guid MapaId { get; set; }
        private Guid NoticiaId { get; set; }
        private String Morada { get; set; }
        private Double Longitude { get; set; }
        private Double Latitude { get; set; }

        public MapaWrap()
        {
            this.MapaId = Guid.Empty;
            this.NoticiaId = Guid.Empty;
            this.Morada = null;
            this.Longitude = Double.NaN;
            this.Latitude = Double.NaN;
        }

        public MapaWrap(Mapa m)
        {
            this.MapaId = m.MapaId;
            this.NoticiaId = m.NoticiaId;
            this.Morada = m.Morada;
            this.Longitude = m.Longitude;
            this.Latitude = m.Latidude;
        }

    }
}