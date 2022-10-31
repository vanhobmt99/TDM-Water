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
using System.Globalization;

namespace Web3Tier.ASCX
{
    public partial class QuanTriHinhAnh : System.Web.UI.UserControl
    {
        AlbumBL blAlbum = new AlbumBL();
        AlBumBO boAlbum = new AlBumBO();
        LoaiHinhAnhBL blLoaiHinhAnh = new LoaiHinhAnhBL();
        LoaiHinhAnhBO boLoaiHinhAnh = new LoaiHinhAnhBO();
        HinhAnhBL blHinhAnh = new HinhAnhBL();
        HinhAnhBO boHinhAnh = new HinhAnhBO();
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        SqlDataAdapter da;
        DataSet ds;
        protected string UploadFolderPath = "~/HinhAnhHoatDong/";
        public void XuatLuoiLoaiHinhAnh()
        {
            ds = new DataSet();
            da = blLoaiHinhAnh.Select();
            da.Fill(ds, "LoaiHinhAnh_Select");
            gvLoaiHinhAnh.DataSource = ds.Tables[0];
            gvLoaiHinhAnh.DataBind();
        }
        public void XuatLuoiAlbum()
        {
            ds = new DataSet();
            da = blAlbum.SelectAll();
            da.Fill(ds, "Album_SelectAll");
            gvAlbum.DataSource = ds.Tables[0];
            gvAlbum.DataBind();
        }
        public void XuatLuoiAlbum_LoaiHinhAnh(int MaLoaiHinhAnh)
        {
            ds = new DataSet();
            da = blAlbum.SelectMaLoaiHinhAnh(MaLoaiHinhAnh);
            da.Fill(ds, "Album_LoaiHinhAnh");
            gvAlbum.DataSource = ds.Tables[0];
            gvAlbum.DataBind();
        }
        public void XuatLoaiAnh()
        {
            ds = new DataSet();
            da = blLoaiHinhAnh.Select();
            da.Fill(ds, "LoaiHinhAnh_Select");
            ddlLoaiHinh.DataSource = ds.Tables[0];
            ddlLoaiHinh.DataTextField = "Loai";
            ddlLoaiHinh.DataValueField = "MaLoaiHinhAnh";
            ddlLoaiHinh.DataBind();
            //ddlLoaiHinh.Items.Insert(0, "Tất cả");
        }
        public string Convert_Date(string date)
        {
            int day = int.Parse(date.Substring(0, 2));
            int mon = int.Parse(date.Substring(3, 2));
            int year = int.Parse(date.Substring(6, 4));
            DateTime Date = new DateTime(year, mon, day);
            return Date.ToString("MM/dd/yyyy");
        }
        protected void FileUploadComplete(object sender, EventArgs e)
        {
            string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            AsyncFileUpload1.SaveAs(Server.MapPath(this.UploadFolderPath) + filename);
            //img1.Visible = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //string sessionUserId = Session["TEN_DANG_NHAP"] as string;
            //string pass = Session["MAT_KHAU"] as string;
            //if (sessionUserId != "quantri" && pass != "Biw@se")
            //    Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
            //    if (Session["UserName"] == null && Session["Password"] == null)
            //    {
            //        Response.Redirect("Login.aspx");
            //    }
            //    NguoiDungbo.Username = Session["UserName"].ToString();
            //    NguoiDungbo.Password = Session["Password"].ToString();
            //    if ((NguoiDungbl.NguoiDung_UserName(NguoiDungbo.Username, NguoiDungbo.Password) == 0))
            //    {
            //        Response.Redirect("Login.aspx");
            //    }
            //    else
            //    {
                    XuatLuoiAlbum();
                    XuatLoaiAnh();
                    txtNgayDang_CalendarExtender.SelectedDate = DateTime.Now;
                //}
            }
        }
        protected void imgbtThem_Click(object sender, ImageClickEventArgs e)
        {
            HinhAnh.Visible = true;
            tbLoaiHinhAnh.Visible = false;
            txtTenHinh.Text = "";
        }

        protected void imgbtLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            boAlbum.MaAlbum = int.Parse(Label1.Text);
            boAlbum.MaLoaiHinhAnh = int.Parse(ddlLoaiHinh.SelectedValue);
            boAlbum.TenAlbum = txtTenHinh.Text;
            string NgayDang = "N'" + DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture) +"'";
            boAlbum.NgayDang = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture); ;
            boAlbum.NgonNgu = Boolean.Parse(ddlNgonNgu.SelectedValue);
            if (AsyncFileUpload1.HasFile)
            {
                boAlbum.Link = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            }
            else
            {
                boAlbum.Link = lbMaHinhAnh.Text;
            }
            if (blAlbum.Update(boAlbum.MaAlbum,boAlbum.MaLoaiHinhAnh,boAlbum.TenAlbum,boAlbum.Link,boAlbum.NgayDang,boAlbum.NgonNgu) == 1)
            {
                lbThongBao.Text = "Cập nhật album thành công !";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Cập nhật album thành công ! ')", true);
                XuatLuoiAlbum();
                imgbtLuuThem.Visible = true;
                imgbtLuuSua.Visible = false;
            }
        }

        protected void imgbtLuuThem_Click(object sender, ImageClickEventArgs e)
        {
            //boAlbum.MaAlbum = int.Parse(lbMaHinhAnh.Text);
            boAlbum.MaLoaiHinhAnh = int.Parse(ddlLoaiHinh.SelectedValue);
            boAlbum.TenAlbum = txtTenHinh.Text;
            DateTime NgayDang = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            boAlbum.NgayDang = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            boAlbum.NgonNgu = Boolean.Parse(ddlNgonNgu.SelectedValue);
            if (AsyncFileUpload1.HasFile)
            {
                boAlbum.Link = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
                if (blAlbum.Insert(boAlbum.MaLoaiHinhAnh, boAlbum.TenAlbum, boAlbum.Link, boAlbum.NgayDang, boAlbum.NgonNgu) == 1)
                {
                    txtTenHinh.Text = "";
                    XuatLuoiAlbum();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Thêm album không thành công. Vui lòng kiểm tra lại!!!')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Chưa có hình ảnh!!!')", true);
            }
        }

        protected void btThemLA_Click(object sender, EventArgs e)
        {
            if (btThemLA.Text != "Lưu")
            {
                XuatLuoiLoaiHinhAnh();
                btThemLA.Text = "Lưu";
                tbLoaiHinhAnh.Visible = true;
            }
            else
            {
                boLoaiHinhAnh.Loai = txtLoaiHinhAnh.Text;
                if (blLoaiHinhAnh.Insert(boLoaiHinhAnh.Loai) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Loại hình ảnh thêm thành công ')", true);
                    btThemLA.Text = "Thêm";
                    tbLoaiHinhAnh.Visible = true;
                    XuatLoaiAnh();
                    XuatLuoiLoaiHinhAnh();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Thêm loại hình ảnh không thành công. Vui lòng kiểm tra lại ! ')", true);
            }
        }
        protected void lnkdeleteLA_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            boLoaiHinhAnh.MaLoaiHinhAnh = int.Parse(gvrow.Cells[1].Text);
            boLoaiHinhAnh.Loai=gvrow.Cells[2].Text;
            if (blLoaiHinhAnh.Delete(boLoaiHinhAnh.MaLoaiHinhAnh) == 1)
            {
                lbThongBao.Text = "Xóa loại hình ảnh thành công!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Loại hình ảnh " + boLoaiHinhAnh.Loai + " đã được xóa ')", true);
                XuatLuoiLoaiHinhAnh();
            }
        }
        protected void lnkdeleteHA_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            boAlbum.MaAlbum = int.Parse(gvrow.Cells[1].Text);
            boAlbum.TenAlbum = gvrow.Cells[2].Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Album " + boAlbum.TenAlbum + " đã được xóa ')", true);
            if (blAlbum.Delete(boAlbum.MaAlbum) == 1)
            {
                XuatLuoiAlbum();
                tbLoaiHinhAnh.Visible = true;
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Xóa album " + boAlbum.TenAlbum + " không thành công. Vui lòng kiểm tra lại ')", true);
        }
        protected void lnkedit_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            ds = new DataSet();
            string test = gvrow.Cells[1].Text;
            da = blAlbum.SelectAlbum(int.Parse(gvrow.Cells[1].Text));
            da.Fill(ds, "Album_SelectMaLoaiHinhAnh");

            int MaLoaiHinhAnh = int.Parse(ds.Tables[0].Rows[0]["MaLoaiHinhAnh"].ToString());
            ddlLoaiHinh.SelectedValue = ds.Tables[0].Rows[0]["MaLoaiHinhAnh"].ToString();
            txtTenHinh.Text = ds.Tables[0].Rows[0]["TenAlbum"].ToString();
            img1.Visible = true;
            img1.Src = "~/HinhAnhHoatDong/" + ds.Tables[0].Rows[0]["Link"].ToString();
            DateTime dt = Convert.ToDateTime(ds.Tables[0].Rows[0]["ngaydang"].ToString());
            txtNgayDang_CalendarExtender.SelectedDate = dt;
            lbMaHinhAnh.Text = ds.Tables[0].Rows[0]["link"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["MaAlbum"].ToString();
            boAlbum.MaAlbum = int.Parse(ds.Tables[0].Rows[0]["MaAlbum"].ToString());
            imgbtLuuSua.Visible = true;
            imgbtLuuThem.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTriHinhAnh.aspx");
        }

        protected void gvLoaiHinhAnh_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "loai"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdeleteLT");
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }

        protected void gvAlbum_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "TenAlbum"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdeleteLT");
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }
    }
}