using System;
using System.Collections.Generic;

using Newzic.Core;

//{ }
namespace Newzic.WebService
{

    public class VideoWrap
    {

        public Guid VideoId { get; set; }
        public Guid NoticiaId { get; set; }
        public String Url { get; set; }

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