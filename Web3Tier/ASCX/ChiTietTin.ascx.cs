using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessObject;
using Bussinesslogic;
using System.Data.SqlClient;
using System.Data;

namespace Web3Tier.ASCX
{
    public partial class ChiTietTin : System.Web.UI.UserControl
    {
        TinTucBL blTinTuc = new TinTucBL();
        TinTucBO boTinTuc = new TinTucBO();
        LoaiTinBL blLoaiTin = new LoaiTinBL();
        SqlDataAdapter daTinTuc;
        DataSet ds;

        public void XuatThongBao()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(3, 25);
            daTinTuc.Fill(ds, "TinTuc_ThongBao");
            dlThongBao.DataSource = ds.Tables[0];
            dlThongBao.DataBind();

            foreach (DataListItem Item in dlThongBao.Items)
            {
                HyperLink hpltinnoibo = ((HyperLink)(Item.FindControl("hlThongbao")));

                if (hpltinnoibo.Text.Length > 65)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(65);
                    hpltinnoibo.Text = tieudetinnoibo.ToString();
                }

            }
        }
        public void XuatVanBao()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(3, 26);
            daTinTuc.Fill(ds, "TinTuc_VanBan");
            dlVanBan.DataSource = ds.Tables[0];
            dlVanBan.DataBind();

            foreach (DataListItem Item in dlVanBan.Items)
            {
                HyperLink hpltinnoibo = ((HyperLink)(Item.FindControl("hlVanBan")));

                if (hpltinnoibo.Text.Length > 50)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(50);
                    hpltinnoibo.Text = tieudetinnoibo.ToString();
                }

            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                XuatThongBao();
                XuatVanBao();
                string matin = Page.RouteData.Values["matin"] as string;
                ds = new DataSet();
                daTinTuc = blTinTuc.TinTuc_MaTin(int.Parse(matin));
                daTinTuc.Fill(ds, "TinTuc_MaTin");
                //ds.Tables[0].Rows[0]["tieude"].ToString();
                lbTieuDe.Text = ds.Tables[0].Rows[0]["tieude"].ToString();
                lbNoiDung.Text = ds.Tables[0].Rows[0]["BANTINCHITIET"].ToString();
                lbNgayDang.Text = "Ngày đăng tin: " + DateTime.Parse(ds.Tables[0].Rows[0]["ngaydang"].ToString()).ToString("dd/MM/yyyy");

                DataTable dt = new DataTable();
                SqlDataAdapter daLoaiTin = blLoaiTin.LoaiTin_MaLoai(int.Parse(ds.Tables[0].Rows[0]["MaLoai"].ToString()));
                daLoaiTin.Fill(dt);
                TieuDe.InnerText=dt.Rows[0]["LOAI"].ToString();
                if (ds.Tables[0].Rows[0]["MaLoai"].ToString() == "25" || ds.Tables[0].Rows[0]["MaLoai"].ToString() == "26")
                    tintucsukien.Visible = false;
                
            }
        }
    }
}