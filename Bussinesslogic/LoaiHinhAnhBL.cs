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
    public class LoaiHinhAnhBL
    {
        LoaiHinhAnhDA LoaiHinhAnh = new LoaiHinhAnhDA();
        public SqlDataAdapter Select()
        {
            return LoaiHinhAnh.Select();
        }
        public int Insert(string Loai)
        {
            return LoaiHinhAnh.Insert(Loai);
        }
        public int Update(int MaLoaiHinhAnh, string Loai)
        {
            return LoaiHinhAnh.Update(MaLoaiHinhAnh, Loai);
        }
        public int Delete(int MaLoaiHinhAnh)
        {
            return LoaiHinhAnh.Delete(MaLoaiHinhAnh);
        }
    }
}
