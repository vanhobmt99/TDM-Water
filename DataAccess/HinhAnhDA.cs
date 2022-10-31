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
    public class HinhAnhDA
    {
        SqlCommand cmd;
        public int Delete(int MaHinhAnh)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HinhAnh_Delete";
            cmd.Parameters.AddWithValue("@MaHinhAnh", MaHinhAnh);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Insert(int MaAlbum, string Link)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HinhAnh_Insert";
            cmd.Parameters.AddWithValue("@MaAlbum", MaAlbum);
            cmd.Parameters.AddWithValue("@Link", Link);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public SqlDataAdapter SelectAll()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HinhAnh_Select";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter SelectAlBum(int MaAlbum)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HinhAnh_SelectAlBum";
            cmd.Parameters.AddWithValue("@MaAlbum", MaAlbum);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public int Update(int MaHinhAnh, int MaAlbum, string Link)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HinhAnh_Insert";
            cmd.Parameters.AddWithValue("@MaHinhAnh", MaHinhAnh);
            cmd.Parameters.AddWithValue("@MaAlbum", MaAlbum);
            cmd.Parameters.AddWithValue("@Link", Link);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }

    }
}
