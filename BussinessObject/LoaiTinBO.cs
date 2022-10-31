using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class LoaiTinBO
    {
        #region attributes
        private int _MaLoai;
        private string _Loai;
        #endregion

        #region get,set values
        public int MaLoai
        {
            get { return _MaLoai; }
            set { _MaLoai = value; }
        }
        public string Loai
        {
            get { return _Loai; }
            set { _Loai = value; }
        }
        #endregion
    }
}
