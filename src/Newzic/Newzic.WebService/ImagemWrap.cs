using System;
using System.Collections.Generic;

using Newzic.Core;

//{ }
namespace Newzic.WebService {

    public class ImagemWrap {

        public Guid ImagemId { get; set; }
        public Byte[] ImageFile { get; set; }
        public Guid NoticiaId { get; set; }
        public string Nome { get; set; }
        public string Tipo { get; set; }

        public ImagemWrap() {
            this.ImagemId = Guid.Empty;
            this.ImageFile = null;
            this.NoticiaId = Guid.Empty;
            this.Nome = null;
            this.Tipo = null;
        }

        public ImagemWrap(Imagem i) {
            this.ImagemId = i.ImagemId;
            this.ImageFile = i.ImageFile.ToArray();
            this.NoticiaId = i.NoticiaId;
            this.Nome = i.Nome;
            this.Tipo = i.Tipo;
        }

    }
}