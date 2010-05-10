using System;
using System.Collections.Generic;

using Newzic.Data;

//{ }
namespace Newzic.WebService
{

    public class VideoWrap
    {

        private Guid VideoId { get; set; }
        private Guid NoticiaId { get; set; }
        private String Url { get; set; }

        public VideoWrap()
        {
            this.VideoId = Guid.Empty;
            this.NoticiaId = Guid.Empty;
            this.Url = null;
        }

        public VideoWrap(Video v)
        {
            this.VideoId = v.VideoId;
            this.NoticiaId = v.NoticiaId;
            this.Url = v.Url;
        }

    }
}