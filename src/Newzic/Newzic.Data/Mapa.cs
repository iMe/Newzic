using System;

namespace Newzic.Core
{
    public partial class Mapa : IEntity
    {
        public Mapa(float longitude, float latitude, string morada)
        {
            this.Longitude = longitude;
            this.Latitude = latitude;
            this.Morada = morada;
            
        }

        
        Guid IEntity.Id
        {
            get { return MapaId; }
            set { MapaId = value; }
        }
    }
}