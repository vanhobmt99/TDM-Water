using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class LichSuHinhThanh
    {
        #region attributes
        private int _MaLichSu;
        private string _NoiDung;
        private DateTime _NgayDang;
        private Boolean _NgonNgu;
        #endregion

        #region get,set values
        public int MaLichSu
        {
            get { return _MaLichSu; }
            set { _MaLichSu = value; }
        }
        public string NoiDung
        {
            get { return _NoiDung; }
            set { _NoiDung = value; }
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
