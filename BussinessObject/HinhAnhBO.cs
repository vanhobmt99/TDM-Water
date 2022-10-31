using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class HinhAnhBO
    {
        private int _MaHinhAnh;
        private int _MaAlbum;
        private string _Link;

        public int MaHinhAnh
        {
            get { return _MaHinhAnh; }
            set { _MaHinhAnh = value; }
        }
        public int MaAlbum
        {
            get { return _MaAlbum; }
            set { _MaAlbum = value; }
        }
        public string Link
        {
            get { return _Link; }
            set { _Link = value; }
        }
    }
}
