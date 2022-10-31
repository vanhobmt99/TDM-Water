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
    public partial class Index : System.Web.UI.UserControl
    {

        TinTucBL blTinTuc = new TinTucBL();
        TinTucBO boTinTuc = new TinTucBO();
        VideosBL blVideos = new VideosBL();
        VideosBO boVideos = new VideosBO();
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
        public void XuatTinCoDong()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(6, 24);
            daTinTuc.Fill(ds, "TinTucHoatDong");
            dlTinTucCoDong.DataSource = ds.Tables[0];
            dlTinTucCoDong.DataBind();
            foreach (DataListItem Item in dlTinTucCoDong.Items)
            {
                HyperLink hpltinnoibo = ((HyperLink)(Item.FindControl("hlTinTucCoDong")));
                if (hpltinnoibo.Text.Length > 47)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(47);
                    hpltinnoibo.Text = tieudetinnoibo.ToString();
                }
            }
        }
        public void XuatTinHoatDong()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(3, 23);
            daTinTuc.Fill(ds, "TinTucHoatDong");
            dlTinTucHoatDong.DataSource = ds.Tables[0];
            dlTinTucHoatDong.DataBind();
            foreach (DataListItem Item in dlTinTucHoatDong.Items)
            {
                HyperLink hpltinnoibo = ((HyperLink)(Item.FindControl("hlTieuDe")));
                //if (Item.ItemIndex == 2)
                //{
                //    imgTinHoatDong.visible = false;
                //}
                if (hpltinnoibo.Text.Length > 70)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(70);
                    hpltinnoibo.Text = tieudetinnoibo.ToString();
                }
                Label lbltinnoibo2 = ((Label)(Item.FindControl("lbNoiDungTomTat")));
                if (lbltinnoibo2.Text.Length > 90)
                {
                    string tomtattinnoibo = lbltinnoibo2.Text.catChuoi(90);
                    lbltinnoibo2.Text = tomtattinnoibo.ToString();
                }
            }
        }
        public void XuatVideos()
        {
            ds = new DataSet();
            daTinTuc = blVideos.Videos_SoLuong(3);
            daTinTuc.Fill(ds, "Videos");
            dlVideos.DataSource = ds.Tables[0];
            dlVideos.DataBind();
            foreach (DataListItem Item in dlVideos.Items)
            {
                LinkButton hpltinnoibo = ((LinkButton)(Item.FindControl("linkbVideos")));
                if (hpltinnoibo.Text.Length > 25)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(25);
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
                XuatTinHoatDong();
                XuatTinCoDong();
                XuatVideos();
            }
        }

        protected void dlVideos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //LinkButton lnkid = (LinkButton)e.Item.FindControl("linkbVideos");
            //Label link = (Label)e.Item.FindControl("lbVideos");
            //string innerHTML =
            //    "<source src='../Movies/" + link.Text + ".mp4' type='video/mp4'></source>";
            //video.InnerHtml = innerHTML;
            //((LinkButton)e.Item.FindControl("linkbVideos")).ForeColor = System.Drawing.ColorTranslator.FromHtml("#046ec5");
            //foreach (DataListItem Item in dlVideos.Items)
            //{
            //    LinkButton hpltinnoibo = ((LinkButton)(Item.FindControl("linkbVideos")));
            //    if (hpltinnoibo.Text != ((LinkButton)e.Item.FindControl("linkbVideos")).Text)
            //    {
            //        hpltinnoibo.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //    }
            //}
        }
    }
}