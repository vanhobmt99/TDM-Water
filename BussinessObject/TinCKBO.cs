using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class TinCKBO
    {
        private int _MaTin;
        private string _TieuDe;
        private string _ChiTiet;
        private string _FileScan;
        private DateTime _NgayDang;

        public int MaTin
        {
            get { return _MaTin; }
            set { _MaTin = value; }
        }
        public string TieuDe
        {
            get { return _TieuDe; }
            set { _TieuDe = value; }
        }
        public string ChiTiet
        {
            get { return _ChiTiet; }
            set { _ChiTiet = value; }
        }
        public string FileScan
        {
            get { return _FileScan; }
            set { _FileScan = value; }
        }
        public DateTime NgayDang
        {
            get { return _NgayDang; }
            set { _NgayDang = value; }
        }
    }
}
