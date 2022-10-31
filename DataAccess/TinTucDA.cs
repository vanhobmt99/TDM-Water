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
    public class TinTucDA
    {
        SqlCommand cmd;
        public SqlDataAdapter TinTuc_SelectAll_Matin()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_SelectAll_Matin";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }

        public SqlDataAdapter TinTuc_SelectAll_NgayDang()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_SelectAll_NgayDang";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter TinTuc_SelectLoai_Matin(int MaLoai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_SelectLoai_Matin";
            cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter TinTuc_MaTin(int MaTin)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_MaTin";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter TinTuc_SoLuong_Maloai(int SoLuong, int Maloai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_SoLuong_Maloai";
            cmd.Parameters.AddWithValue("@SoLuong", SoLuong);
            cmd.Parameters.AddWithValue("@Maloai", Maloai);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter TinTuc_MaLoai(int MaLoai)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_MaLoai";
            cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public int Update(int MaTin, int MaLoai, string TieuDe, string BanTinTomTat, string BanTinChiTiet, string HinhAnh, DateTime NgayDang, Boolean NgonNgu)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_Update";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
            cmd.Parameters.AddWithValue("@TieuDe", TieuDe);
            cmd.Parameters.AddWithValue("@BanTinTomTat", BanTinTomTat);
            cmd.Parameters.AddWithValue("@BanTinChiTiet", BanTinChiTiet);
            cmd.Parameters.AddWithValue("@HinhAnh", HinhAnh);
            cmd.Parameters.AddWithValue("@NgayDang", NgayDang);
            cmd.Parameters.AddWithValue("@NgonNgu", NgonNgu);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int Insert(int MaLoai, string TieuDe, string BanTinTomTat, string BanTinChiTiet, string HinhAnh, DateTime NgayDang, Boolean NgonNgu)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_Insert";
            cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
            cmd.Parameters.AddWithValue("@TieuDe", TieuDe);
            cmd.Parameters.AddWithValue("@BanTinTomTat", BanTinTomTat);
            cmd.Parameters.AddWithValue("@BanTinChiTiet", BanTinChiTiet);
            cmd.Parameters.AddWithValue("@HinhAnh", HinhAnh);
            cmd.Parameters.AddWithValue("@NgayDang", NgayDang);
            cmd.Parameters.AddWithValue("@NgonNgu", NgonNgu);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }

        public int Delete(int MaTin)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinTuc_Delete";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }

    }
}
