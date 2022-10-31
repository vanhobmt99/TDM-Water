using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class TinTucBO
    {
        #region attributes
        private int _MaTin;
        private int _MaLoai;
        private string _TieuDe;
        private string _BanTinTomTat;
        private string _BanTinChiTiet;
        private string _HinhAnh;
        private DateTime _NgayDang;
        private Boolean _NgonNgu;
        #endregion

        #region get,set values
        public int Matin
        {
            get { return _MaTin; }
            set { _MaTin = value; }
        }
        public int MaLoai
        {
            get { return _MaLoai; }
            set { _MaLoai = value; }
        }
        public string Tieude
        {
            get { return _TieuDe; }
            set { _TieuDe = value; }
        }
        public string BanTinTomTat
        {
            get { return _BanTinTomTat; }
            set { _BanTinTomTat = value; }
        }
        public string BanTinChiTiet
        {
            get { return _BanTinChiTiet; }
            set { _BanTinChiTiet = value; }
        }
        public string HinhAnh
        {
            get { return _HinhAnh; }
            set { _HinhAnh = value; }
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
        #endregion
    }
}
