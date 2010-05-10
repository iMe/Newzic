using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Pericles.WebService {

    public class ImagemWrap {

        private Guid ImagemId { get; set; }
        private Byte[] ImageFile { get; set; }
        private Guid NoticiaId { get; set; }

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