using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class VideosBO
    {
        #region attributes
        private int _MaVideo;
        private string _TenVideo;
        private string _LinkVideo;
        private string _PosterVideo;
        #endregion

        #region get,set values
        public int MaVideo
        {
            get { return _MaVideo; }
            set { _MaVideo = value; }
        }
        public string TenVideo
        {
            get { return _TenVideo; }
            set { _TenVideo = value; }
        }
        public string LinkViedo
        {
            get { return _LinkVideo; }
            set { _LinkVideo = value; }
        }
        public string PosterVideo
        {
            get { return _PosterVideo; }
            set { _PosterVideo = value; }
        }
        #endregion
    }
}
