using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessObject;
using Bussinesslogic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Xml.Linq;

namespace Web3Tier.ASCX
{
    public partial class TinChatLuongNuoc : System.Web.UI.UserControl
    {
        TinTucBL blTinTuc = new TinTucBL();
        TinTucBO boTinTuc = new TinTucBO();
        VideosBL blVideos = new VideosBL();
        VideosBO boVideos = new VideosBO();
        SqlDataAdapter daTinTuc;
        DataSet ds;
        public void XuatThongBao2()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(100, 27);
            daTinTuc.Fill(ds, "TinTuc_ThongBao");
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();


        }
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
                XuatThongBao2();
            }
        }
    }
}