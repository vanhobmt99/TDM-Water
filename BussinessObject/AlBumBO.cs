using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class AlBumBO
    {
        private int _MaAlbum;
        private int _MaLoaiHinhAnh;
        private string _TenAlbum;
        private string _Link;
        private DateTime _NgayDang;
        private Boolean _NgonNgu;

        public int MaAlbum
        {
            get { return _MaAlbum; }
            set { _MaAlbum = value; }
        }
        public int MaLoaiHinhAnh
        {
            get { return _MaLoaiHinhAnh; }
            set { _MaLoaiHinhAnh = value; }
        }
        public string TenAlbum
        {
            get { return _TenAlbum; }
            set { _TenAlbum = value; }
        }
        public string Link
        {
            get { return _Link; }
            set { _Link = value; }
        }
        public DateTime NgayDang
        {
            get { return _NgayDang; }
            set { _NgayDang = value; }
        }
        public Boolean NgonNgu
        {
            get { return _NgonNgu; }
            set { _NgonNgu = value; }
        }
    }
}
