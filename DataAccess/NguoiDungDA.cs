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
    public class NguoiDungDA
    {
        SqlCommand cmd;

        public SqlDataAdapter NguoiDung_SelectAll()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "NguoiDung_SelectALL";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public int NguoiDung_UserName(String UserName, string PassWord)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "NguoiDung_User";
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@PassWord", PassWord);
            int result = (int)cmd.ExecuteScalar();
            return result;
        }
        public int NguoiDung_VaiTro(String UserName, string PassWord)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "NguoiDung_VaiTro";
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@PassWord", PassWord);
            int result = (int)cmd.ExecuteScalar();
            return result;
        }
        public int NguoiDung_Update(String UserName, string PassWord)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "NguoiDung_Update";
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@PassWord", PassWord);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int NguoiDung_Insert(string UserName, string Password)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "NguoiDung_Insert";
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@PassWord", Password);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int NguoiDung_Delete(string UserName)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "NguoiDung_Delete";
            cmd.Parameters.AddWithValue("@UserName", UserName);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
    }
}
