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
    public class LoaiHinhAnhDA
    {
        SqlCommand cmd;

        public SqlDataAdapter Select()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiHinhAnh_Select";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }

        public int Insert(string Loai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiHinhAnh_Insert";
            cmd.Parameters.AddWithValue("@Loai", Loai);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Update(int MaLoaiHinhAnh, string Loai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiHinhAnh_Update";
            cmd.Parameters.AddWithValue("@MaLoaiHinhAnh", MaLoaiHinhAnh);
            cmd.Parameters.AddWithValue("@Loai", Loai);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Delete(int MaLoaiHinhAnh)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiHinhAnh_Delete";
            cmd.Parameters.AddWithValue("@MaLoaiHinhAnh",MaLoaiHinhAnh);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
    }
}
