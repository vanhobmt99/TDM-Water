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
    public class AlbumBL
    {
        AlbumDA album = new AlbumDA();
        public SqlDataAdapter SelectAll()
        {
            return album.SelectAll();
        }
        public SqlDataAdapter SelectMaLoaiHinhAnh(int MaLoaiHinhAnh)
        {
            return album.SelectMaLoaiHinhAnh(MaLoaiHinhAnh);
        }
        public int Insert(int MaLoaiHinhANh, string TenAlbum, string Link, DateTime NgayDang, Boolean NgonNgu)
        {
            return album.Insert(MaLoaiHinhANh, TenAlbum, Link, NgayDang, NgonNgu);
        }
        public int Update(int MaAlbum, int MaLoaiHinhANh, string TenAlbum, string Link, DateTime NgayDang, Boolean NgonNgu)
        {
            return album.Update(MaAlbum, MaLoaiHinhANh, TenAlbum, Link, NgayDang, NgonNgu);
        }
        public int Delete(int MaAlbum)
        {
            return album.Delete(MaAlbum);
        }
        public SqlDataAdapter SelectAlbum(int MaAlbum)
        {
            return album.SelectAlbum(MaAlbum);
        }
    }
}
