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
    public class TinCKDA
    {
        SqlCommand cmd;
        SqlConnection cn = Connect.Connection();
        DataTable dt;
        public DataTable SelectAll()
        {
            SqlConnection cn = Connect.Connection();
            dt=new DataTable();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinCK_SelectAll";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cn.Close();
            return dt;
        }
        public DataTable SelectMaTin(TinCKBO boTinCK)
        {
            SqlConnection cn = Connect.Connection();
            dt = new DataTable();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinCK_MaTin";
            cmd.Parameters.AddWithValue("@MaTin", boTinCK.MaTin);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cn.Close();
            return dt;
        }
        public int Update(TinCKBO boTinCK)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinCK_Update";
            cmd.Parameters.AddWithValue("@MaTin", boTinCK.MaTin);
            cmd.Parameters.AddWithValue("@TieuDe", boTinCK.TieuDe);
            cmd.Parameters.AddWithValue("@ChiTiet", boTinCK.ChiTiet);
            //cmd.Parameters.AddWithValue("@FileScan", boTinCK.FileScan);
            cmd.Parameters.AddWithValue("@NgayDang", boTinCK.NgayDang);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int Insert(TinCKBO boTinCK)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TinCK_Insert";
            cmd.Parameters.AddWithValue("@TieuDe", boTinCK.TieuDe);
            cmd.Parameters.AddWithValue("@ChiTiet", boTinCK.ChiTiet);
            //cmd.Parameters.AddWithValue("@FileScan", boTinCK.FileScan);
            cmd.Parameters.AddWithValue("@NgayDang", boTinCK.NgayDang);
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
            cmd.CommandText = "TinCK_Delete";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
    }
}
