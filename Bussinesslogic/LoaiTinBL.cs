using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BussinessObject;
using System.Data.SqlClient;
using System.Collections;

namespace Bussinesslogic
{
    public class LoaiTinBL
    {
        LoaiTinDA LoaiTin = new LoaiTinDA();
        public SqlDataAdapter LoaiTin_SelectALL()
        {
            return LoaiTin.LoaiTin_SelectALL();
        }
        public SqlDataAdapter LoaiTin_MaLoai(int MaLoai)
        {
            return LoaiTin.LoaiTin_MaLoai(MaLoai);
        }
        public int Insert(string Loai)
        {
            return LoaiTin.Insert(Loai);
        }
        public int Delete(int MaLoai)
        {
            return LoaiTin.Delete(MaLoai);
        }
    }
}
