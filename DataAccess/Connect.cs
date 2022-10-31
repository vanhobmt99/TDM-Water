using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;

namespace DataAccess
{
    class Connect
    {
        public static SqlConnection Connection()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn != null)
                conn.Open();
            return conn;
        }
    }
}
