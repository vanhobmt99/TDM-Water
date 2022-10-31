﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
public class DataBindSQL
{
    public DataBindSQL()
    {
    }
    //Hàm thực thi và trả về DataTable
    public DataTable TableThongKe()
    {
        DataTable dtb = new DataTable();
        // Khai báo chuỗi kết nối
        string ConnectionString =
        @"server=TANGHIEN\\SQLEXPRESS;database=WEBCP;integrated security=true";
        SqlConnection Conn = new SqlConnection(ConnectionString);
        try
        {
            // Mở kết nối
            Conn.Open();
            DataSet ds = new DataSet();
            SqlCommand cmdUpd = new SqlCommand("spThongKe_Edit", Conn);
            cmdUpd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmdUpd);
            // Đổ dữ liệu vào DataSet
            da.Fill(ds);
            dtb = ds.Tables[0];
        }
        catch { }
        finally
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            Conn.Dispose();
        }
        return dtb;
    }
}
