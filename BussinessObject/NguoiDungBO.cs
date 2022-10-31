using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class NguoiDungBO
    {
        #region attributes
        private string _UserName;
        private string _Password;
        private int _VaiTro;
        #endregion

        #region get,set values
        public string Username
        {
            get { return _UserName; }
            set { _UserName = value; }
        }

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
        public int VaiTro
        {
            get { return _VaiTro; }
            set { _VaiTro = value; }
        }
        #endregion
    }
}
