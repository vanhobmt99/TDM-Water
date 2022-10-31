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
    public class LienHeDA
    {
        SqlCommand cmd;

        public SqlDataAdapter LienHe_SelectAll()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LienHe_SelectAll";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter LienHe_SelectMaYeuCau(int MaYeuCau)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LienHe_SelectMaYeuCau";
            cmd.Parameters.AddWithValue("@MaYeuCau", MaYeuCau);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public int Insert(string HoTen, string DiaChi, string DienThoai, string Email, string YeuCau)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LienHe_Insert";
            cmd.Parameters.AddWithValue("@HoTen", HoTen);
            cmd.Parameters.AddWithValue("@DiaChi", DiaChi);
            cmd.Parameters.AddWithValue("@DienThoai", DienThoai);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@YeuCau", YeuCau);
            cmd.Parameters.AddWithValue("@NgayGui", DateTime.Now);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Update(string MaYeuCau, Boolean XuLy, string NoiDungXuLy)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LienHe_Update";
            cmd.Parameters.AddWithValue("@MaYeuCau", MaYeuCau);
            cmd.Parameters.AddWithValue("@XuLy", XuLy);
            cmd.Parameters.AddWithValue("@NoiDungXuLy", NoiDungXuLy);
            cmd.Parameters.AddWithValue("@NgayXuLy", DateTime.Now);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }

    }
}
