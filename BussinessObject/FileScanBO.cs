using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BussinessObject
{
    public class FileScanBO
    {
        private int _MaFileScan;
        private int _MaTin;
        private string _FileScan;

        public int MaFileScan
        {
            get { return _MaFileScan; }
            set { _MaFileScan = value; }
        }
        public int MaTin
        {
            get { return _MaTin; }
            set { _MaTin = value; }
        }
        public string FileScan
        {
            get { return _FileScan; }
            set { _FileScan = value; }
        }
    }
}
