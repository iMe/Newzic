using System;

namespace Newzic.Core
{
    public partial class Mapa : IEntity
    {
        public Mapa(float longitude, float latidude, string morada)
        {
            this.Longitude = longitude;
            this.Latidude = latidude;
            this.Morada = morada;
            this.isTour = false;
        }

        public void InsertTour(float longitude, float latidude, string morada)
        {
            var tour = new Tour {Latitude = latidude, Longitude = longitude, Morada = morada};
            this.Tours.Add(tour);
        }

        public Guid Id
        {
            get { return MapaId; }
            set { MapaId = value; }
        }
    }
}