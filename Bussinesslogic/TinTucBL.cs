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
    public class TinTucBL
    {
        TinTucDA TinTuc = new TinTucDA();
        public SqlDataAdapter TinTuc_SelectAll_NgayDang()
        {
            return TinTuc.TinTuc_SelectAll_NgayDang();
        }
        public SqlDataAdapter TinTuc_SelectLoai_Matin(int MaLoai)
        {
            return TinTuc.TinTuc_SelectLoai_Matin(MaLoai);
        }
        public SqlDataAdapter TinTuc_MaTin(int MaTin)
        {
            return TinTuc.TinTuc_MaTin(MaTin);
        }
        public SqlDataAdapter TinTuc_SoLuong_Maloai(int SoLuong,int MaTin)
        {
            return TinTuc.TinTuc_SoLuong_Maloai(SoLuong, MaTin);
        }
        public SqlDataAdapter TinTuc_MaLoai(int MaLoai)
        {
            return TinTuc.TinTuc_MaLoai(MaLoai);
        }
        public int Update(int MaTin, int MaLoai, string TieuDe, string BanTinTomTat, string BanTinChiTiet, string HinhAnh, DateTime NgayDang, Boolean NgonNgu)
        {
            return TinTuc.Update(MaTin, MaLoai, TieuDe, BanTinTomTat, BanTinChiTiet, HinhAnh, NgayDang, NgonNgu);
        }
        public int Insert(int MaLoai, string TieuDe, string BanTinTomTat, string BanTinChiTiet, string HinhAnh, DateTime NgayDang, Boolean NgonNgu)
        {
            return TinTuc.Insert(MaLoai, TieuDe, BanTinTomTat, BanTinChiTiet, HinhAnh, NgayDang, NgonNgu);
        }
        public int Delete(int MaTin)
        {
            return TinTuc.Delete(MaTin);
        }
    }
}
