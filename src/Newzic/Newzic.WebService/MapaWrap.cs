using System;
using System.Collections.Generic;

using Newzic.Core;

//{ }
namespace Newzic.WebService
{

    public class MapaWrap
    {

        public Guid MapaId { get; set; }
        public Guid NoticiaId { get; set; }
        public String Morada { get; set; }
        public Double Longitude { get; set; }
        public Double Latitude { get; set; }

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
            this.Latitude = m.Latitude;
        }

    }
}