using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BussinessObject;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
namespace DataAccess
{
    public class AlbumDA
    {
        SqlCommand cmd;

        public SqlDataAdapter SelectAll()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Album_SelectAll";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter SelectMaLoaiHinhAnh(int MaLoaiHinhAnh)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Album_SelectMaLoaiHinhAnh";
            cmd.Parameters.AddWithValue("@MaLoaiHinhAnh", MaLoaiHinhAnh);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter SelectAlbum(int MaAlbum)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Album_SelectAlbum";
            cmd.Parameters.AddWithValue("@MaAlbum", MaAlbum);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public int Insert(int MaLoaiHinhANh, string TenAlbum, string Link, DateTime NgayDang, Boolean NgonNgu)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Album_Insert";
            cmd.Parameters.AddWithValue("@MaLoaiHinhAnh", MaLoaiHinhANh);
            cmd.Parameters.AddWithValue("@TenAlbum", TenAlbum);
            cmd.Parameters.AddWithValue("@Link", Link);
            cmd.Parameters.AddWithValue("@NgayDang", NgayDang);
            cmd.Parameters.AddWithValue("@NgonNgu", NgonNgu);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Update(int MaAlbum, int MaLoaiHinhAnh, string TenAlbum, string Link, DateTime NgayDang, Boolean NgonNgu)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Album_Update";
            cmd.Parameters.AddWithValue("@MaAlbum", MaAlbum);
            cmd.Parameters.AddWithValue("@MaLoaiHinhAnh", MaLoaiHinhAnh);
            cmd.Parameters.AddWithValue("@TenAlbum", TenAlbum);
            cmd.Parameters.AddWithValue("@Link", Link);
            cmd.Parameters.AddWithValue("@NgayDang", NgayDang);
            cmd.Parameters.AddWithValue("NgonNgu", NgonNgu);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Delete(int MaAlbum)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Album_Delete";
            cmd.Parameters.AddWithValue("@MaAlbum", MaAlbum);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }

    }
}
