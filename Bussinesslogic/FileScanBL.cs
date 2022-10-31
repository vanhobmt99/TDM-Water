using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BussinessObject;
using System.Data.SqlClient;
using System.Collections;
using System.Data;


namespace Bussinesslogic
{
    public class FileScanBL
    {
        FileScanDA da = new FileScanDA();

        public DataTable SelectMaTin(int MaTin)
        {
            return da.SelectMaTin(MaTin);
        }
        public int Insert(int MaTin, string FileScan)
        {
            return da.Insert(MaTin, FileScan);
        }
        public int Update(int MaFileScan, int MaTin, string FileScan)
        {
            return da.Update(MaFileScan, MaTin, FileScan);
        }
        public int Delete(int MaTin)
        {
            return da.Delete(MaTin);
        }
    }
}
