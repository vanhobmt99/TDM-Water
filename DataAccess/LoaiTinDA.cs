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
    public class LoaiTinDA
    {
        SqlCommand cmd;

        public SqlDataAdapter LoaiTin_SelectALL()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiTin_SelectALL";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter LoaiTin_MaLoai(int MaLoai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiTin_MaLoai";
            cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd);
            cn.Close();
            return da2;
        }
        public int Insert(string Loai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiTin_Insert";
            cmd.Parameters.AddWithValue("@Loai", Loai);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int Delete(int MaLoai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoaiTin_Delete";
            cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
    }
}
