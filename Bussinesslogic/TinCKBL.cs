using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BussinessObject;
using BussinessObject;
using System.Data.SqlClient;
using System.Collections;
using System.Data;

namespace Bussinesslogic
{
    public class TinCKBL
    {
        TinCKDA da = new TinCKDA();
        public DataTable SelectAll()
        {
            return da.SelectAll();
        }
        public DataTable SelectMaTin(TinCKBO boTinCK)
        {
            return da.SelectMaTin(boTinCK);
        }
        public int Update(TinCKBO boTinCK)
        {
            return da.Update(boTinCK);
        }
        public int Insert(TinCKBO boTinCK)
        {
            return da.Insert(boTinCK);
        }
        public int Delete(int MaTin)
        {
            return da.Delete(MaTin);
        }
    }
}
