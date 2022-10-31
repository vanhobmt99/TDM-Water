using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class LoaiHinhAnhBO
    {
        private int _MaLoaiHinhAnh;
        private string _Loai;

        public int MaLoaiHinhAnh
        {
            get { return _MaLoaiHinhAnh; }
            set { _MaLoaiHinhAnh = value; }
        }
        public string Loai
        {
            get { return _Loai; }
            set { _Loai = value; }
        }
    }
}
