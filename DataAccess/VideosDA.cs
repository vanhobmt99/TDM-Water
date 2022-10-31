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
    public class VideosDA
    {
        SqlCommand cmd;

        public SqlDataAdapter Videos_SelectALL()
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Videos_SelectALL";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter Videos_SoLuong(int SoLuong)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Videos_SoLuong";
            cmd.Parameters.AddWithValue("@SoLuong", SoLuong);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public SqlDataAdapter Videos_MaVideo(int MaVideo)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Videos_MaVideo";
            cmd.Parameters.AddWithValue("@MaVideo", MaVideo);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cn.Close();
            return da;
        }
        public int Insert(string TenVideo, string LinkVideo, string PosterVideo)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Videos_Insert";
            cmd.Parameters.AddWithValue("@TenVideo", TenVideo);
            cmd.Parameters.AddWithValue("@LinkVideo", LinkVideo);
            cmd.Parameters.AddWithValue("@PosterVideo", PosterVideo);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int Delete(int MaVideo)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Videos_Delete";
            cmd.Parameters.AddWithValue("@MaVideo", MaVideo);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
        public int Update(int MaVideo, string TenVideo, string LinkVideo, string PosterVideo)
        {
            SqlConnection cn = Connect.Connection();
            cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Videos_Update";
            cmd.Parameters.AddWithValue("@MaVideo", MaVideo);
            cmd.Parameters.AddWithValue("@TenVideo", TenVideo);
            cmd.Parameters.AddWithValue("@LinkVideo", LinkVideo);
            cmd.Parameters.AddWithValue("@PosterVideo", PosterVideo);
            int kq = cmd.ExecuteNonQuery();
            cn.Close();
            return kq;
            /* ==1 adding success || ==0 adding fail */
        }
    }
}
