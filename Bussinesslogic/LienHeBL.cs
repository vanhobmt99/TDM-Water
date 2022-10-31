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
    public class LienHeBL
    {
        LienHeDA lienhe = new LienHeDA();

        public SqlDataAdapter LienHe_SelectAll()
        {
            return lienhe.LienHe_SelectAll();
        }
        public SqlDataAdapter LienHe_SelectMaYeuCau(int MaYeuCau)
        {
            return lienhe.LienHe_SelectMaYeuCau(MaYeuCau);
        }
        public int Insert(string HoTen, string DiaChi, string DienThoai, string Email, string YeuCau)
        {
            return lienhe.Insert(HoTen, DiaChi, DienThoai, Email, YeuCau);
        }
        public int Update(string MaYeuCau, Boolean XuLy, string NoiDungXuLy)
        {
            return lienhe.Update(MaYeuCau, XuLy, NoiDungXuLy);
        }
    }
}
