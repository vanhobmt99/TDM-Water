using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class LienHeBO
    {
        #region attributes
        private int _MaYeuCau;
        private string _HoTen;
        private string _DiaChi;
        private string _DienThoai;
        private string _Email;
        private string _YeuCau;
        private DateTime _NgayGui;
        private Boolean _XuLy;
        private string _NoiDungXuLy;
        private DateTime _NgayXuLy;
        #endregion

        #region get,set,values
        public int MaYeuCau
        {
            get { return _MaYeuCau; }
            set { _MaYeuCau = value; }
        }
        public string HoTen
        {
            get { return _HoTen; }
            set { _HoTen = value; }
        }
        public string DiaChi
        {
            get { return _DiaChi; }
            set { _DiaChi = value; }
        }
        public string DienThoai
        {
            get { return _DienThoai; }
            set { _DienThoai = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string YeuCau
        {
            get { return _YeuCau; }
            set { _YeuCau = value; }
        }
        public DateTime NgayGui
        {
            get { return _NgayGui; }
            set { _NgayGui = value; }
        }
        public Boolean XuLy
        {
            get { return _XuLy; }
            set { _XuLy = value; }
        }
        public string NoiDungXuLy
        {
            get { return _NoiDungXuLy; }
            set { _NoiDungXuLy = value; }
        }
        public DateTime NgayXuLy
        {
            get { return _NgayXuLy; }
            set { _NgayXuLy = value; }
        }
        #endregion
    }
}
