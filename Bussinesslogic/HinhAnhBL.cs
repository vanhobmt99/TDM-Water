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
    public class HinhAnhBL
    {
        HinhAnhDA hinhanh = new HinhAnhDA();
        public int Delete(int MaHinhAnh)
        {
            return hinhanh.Delete(MaHinhAnh);
        }
        public int Insert(int MaAlbum, string Link)
        {
            return hinhanh.Insert(MaAlbum, Link);
        }
        public SqlDataAdapter SelectAll()
        {
            return hinhanh.SelectAll();
        }
        public SqlDataAdapter SelectAlBum(int MaAlbum)
        {
            return hinhanh.SelectAlBum(MaAlbum);
        }
        public int Update(int MaHinhAnh, int MaAlbum, string Link)
        {
            return hinhanh.Update(MaHinhAnh, MaAlbum, Link);
        }
    }
}
