using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Newzic.WebService {

    public class ImagemWrap {

        public Guid ImagemId { get; set; }
        public Byte[] ImageFile { get; set; }
        public Guid NoticiaId { get; set; }

        public ImagemWrap() {
            this.ImagemId = Guid.Empty;
            this.ImageFile = null;
            this.NoticiaId = Guid.Empty;
        }

        public ImagemWrap(Imagem i) {
            this.ImagemId = i.ImagemId;
            this.ImageFile = i.ImageFile.ToArray();
            this.NoticiaId = i.NoticiaId;
        }

    }
}