using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BussinessObject;
using System.Data.SqlClient;
using System.Collections;

namespace Bussinesslogic
{
    public class NguoiDungBL
    {
        NguoiDungDA NguoiDung = new NguoiDungDA();

        public SqlDataAdapter NguoiDung_SelectAll()
        {
            return NguoiDung.NguoiDung_SelectAll();
        }

        public int NguoiDung_UserName(string UserName, string PassWord)
        {
            return NguoiDung.NguoiDung_UserName(UserName, PassWord);
        }
        public int NguoiDung_VaiTro(string UserName, string PassWord)
        {
            return NguoiDung.NguoiDung_VaiTro(UserName, PassWord);
        }

        public int NguoiDung_Update(string UserName, string PassWord)
        {
            return NguoiDung.NguoiDung_Update(UserName, PassWord);
        }
        public int NguoiDung_Insert(string UserName, string PassWord)
        {
            return NguoiDung.NguoiDung_Insert(UserName, PassWord);
        }
        public int NguoiDung_Delete(string UserName)
        {
            return NguoiDung.NguoiDung_Delete(UserName);
        }
    }
}
