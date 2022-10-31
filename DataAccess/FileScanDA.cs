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
    public class FileScanDA
    {
        SqlCommand cmd;
        DataTable dt;
        public DataTable SelectMaTin(int MaTin)
        {
            SqlConnection cn = Connect.Connection();
            dt = new DataTable();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "FileScanCK_SelectMaTin";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cn.Close();
            return dt;
        }
        public int Insert(int MaTin, string FileScan)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "FileScanCK_Insert";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            cmd.Parameters.AddWithValue("@FileScan", FileScan);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Update(int MaFileScan,int MaTin, string FileScan)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "FileScanCK_Update";
            cmd.Parameters.AddWithValue("@MaFileScan", MaFileScan);
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            cmd.Parameters.AddWithValue("@FileScan", FileScan);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
        public int Delete(int MaTin)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "FileScanCK_Delete";
            cmd.Parameters.AddWithValue("@MaTin", MaTin);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
        }
    }
}
