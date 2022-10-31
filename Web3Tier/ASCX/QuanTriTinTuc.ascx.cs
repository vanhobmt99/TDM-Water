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
    public partial class QuanTriTinTuc : System.Web.UI.UserControl
    {
        //Khai báo biến
        TinTucBL TinTuc = new TinTucBL();
        LoaiTinBL LoaiTin = new LoaiTinBL();
        TinTucBO TinTucbo = new TinTucBO();
        LoaiTinBO LoaiTinbo = new LoaiTinBO();
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        SqlDataAdapter TinTucda;
        SqlDataAdapter LoaiTinda;
        DataSet ds;
        DataSet ds2;
        public static string dk;
        protected string UploadFolderPath = "~/Uploads/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null && Session["Password"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                NguoiDungbo.Username = Session["UserName"].ToString();
                NguoiDungbo.Password = Session["Password"].ToString();
                if ((NguoiDungbl.NguoiDung_UserName(NguoiDungbo.Username, NguoiDungbo.Password) == 0))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    XuatLuoi();
                    XuatLoaiTin();
                    txtNgayDang_CalendarExtender.SelectedDate = DateTime.Now;
                }
            }
        }

        //Xuất lên GirdView
        public void XuatLuoi()
        {
            ds = new DataSet();
            TinTucda = TinTuc.TinTuc_SelectAll_NgayDang();
            TinTucda.Fill(ds,"TinTuc_SelectAll_NgayDang");
            gvTinTuc.DataSource = ds.Tables[0];
            gvTinTuc.DataBind();
        }

        //Lấy dữ liện lên các Dropdownlist
        public void XuatLoaiTin()
        {
            ds = new DataSet();
            LoaiTinda = LoaiTin.LoaiTin_SelectALL();
            LoaiTinda.Fill(ds, "LoaiTin_SelectALL");
            ddlLoaiTin.DataSource = ds.Tables[0];
            ddlLoaiTin.DataTextField = "LOAI";
            ddlLoaiTin.DataValueField = "MALOAI";
            ddlLoaiTin.DataBind();
            ddlLoaiTin.Items.Insert(0, "Tất cả loại tin");

            ddlLoaiTinMaTin.DataSource = ds.Tables[0];
            ddlLoaiTinMaTin.DataTextField = "LOAI";
            ddlLoaiTinMaTin.DataValueField = "MALOAI";
            ddlLoaiTinMaTin.DataBind();
            ddlLoaiTinMaTin.Items.Insert(0, "Tất cả loại tin");
        }

        //Lọc theo loại tin trên lưới
        protected void ddlLoaiTin_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLoaiTin.SelectedIndex == 0)
                XuatLuoi();
            else
            {
                dk = ddlLoaiTin.SelectedValue;
                ds = new DataSet();
                TinTucda = TinTuc.TinTuc_SelectLoai_Matin(int.Parse(dk));
                TinTucda.Fill(ds, "TinTuc_SelectLoai_Matin");
                gvTinTuc.DataSource = ds.Tables[0];
                gvTinTuc.DataBind();
            }
        }

        //Xuất thông tin bài viết lên Form để edit
        protected void lnkedit_Click(object sender, EventArgs e)
        {

            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;

            ds = new DataSet();
            TinTucda = TinTuc.TinTuc_MaTin(int.Parse(gvrow.Cells[1].Text));
            TinTucda.Fill(ds, "TinTuc_MaTin");

            ds2 = new DataSet();
            LoaiTinda = LoaiTin.LoaiTin_SelectALL();
            LoaiTinda.Fill(ds2, "LoaiTin_MaLoai");
            ddlLoaiTinMaTin.DataSource = ds2.Tables[0];
            ddlLoaiTinMaTin.DataTextField = "LOAI";
            ddlLoaiTinMaTin.DataValueField = "MALOAI";
            ddlLoaiTinMaTin.DataBind();

            ddlLoaiTinMaTin.SelectedValue = ds.Tables[0].Rows[0]["maloai"].ToString();
            ddlNgonNgu.SelectedValue = ds.Tables[0].Rows[0]["ngonngu"].ToString();

            TxtTieuDe.Text = ds.Tables[0].Rows[0]["tieude"].ToString();
            TxtBanTinTomTat.Text = ds.Tables[0].Rows[0]["BANTINTOMTAT"].ToString();
            string linkhinh = "~/Uploads/" + ds.Tables[0].Rows[0]["HINHANH"].ToString();
            lbHinhAnh.Text = ds.Tables[0].Rows[0]["HINHANH"].ToString();
            img.Src = linkhinh;
            CKEditor1.Text = ds.Tables[0].Rows[0]["BANTINCHITIET"].ToString();
            DateTime dt = Convert.ToDateTime(ds.Tables[0].Rows[0]["ngaydang"].ToString());
            txtNgayDang.Text = dt.ToString("dd/MM/yyyy");
            suatin.Visible = true;
            lbMaTin.Visible = false;
            lbMaTin.Text = ds.Tables[0].Rows[0]["matin"].ToString();
            imgbtLuuSua.Visible = true;
            imgbtLuuThem.Visible = false;
            //string maTin = gvrow.Cells[1].Text;
            //string baiviet = gvrow.Cells[2].Text;

        }

        //Upload hình làm Poster
        protected void FileUploadComplete(object sender, EventArgs e)
        {
            string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            AsyncFileUpload1.SaveAs(Server.MapPath(this.UploadFolderPath) + filename);
        }

        //Xóa hình poster
        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        //Sửa bài viết
        protected void imgbtLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            TinTucbo.Matin = int.Parse(lbMaTin.Text);
            TinTucbo.MaLoai = int.Parse(ddlLoaiTinMaTin.SelectedValue);
            TinTucbo.Tieude = TxtTieuDe.Text;
            TinTucbo.BanTinTomTat =TxtBanTinTomTat.Text;
            string str = CKEditor1.Text;
            string str2 = str.Replace("'", "&#39;");
            string str1 = Server.HtmlEncode(str2);
            TinTucbo.BanTinChiTiet =Server.HtmlDecode(str1);

            if (AsyncFileUpload1.HasFile)
            {
                TinTucbo.HinhAnh = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            }
            else
            {
                TinTucbo.HinhAnh = lbHinhAnh.Text;
            }

            TinTucbo.NgayDang = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            TinTucbo.NgonNgu = Boolean.Parse(ddlNgonNgu.SelectedValue);
            if (TinTuc.Update(TinTucbo.Matin, TinTucbo.MaLoai, TinTucbo.Tieude, TinTucbo.BanTinTomTat, TinTucbo.BanTinChiTiet, TinTucbo.HinhAnh, TinTucbo.NgayDang, TinTucbo.NgonNgu) == 1)
            {
                XuatLuoi();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Bài viết đã sửa xong ')", true);
                suatin.Visible = true;
                clearText();

               
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình sửa bài! Vui lòng kiểm tra lại ')", true);
            LuoiQuanTriTinTuc.Visible = true;

        }

        //Chuyển datetime thành dạng MM/dd/yyyy
        public string Convert_Date(string date)
        {
            int day = int.Parse(date.Substring(0, 2));
            int mon = int.Parse(date.Substring(3, 2));
            int year = int.Parse(date.Substring(6, 4));
            DateTime Date = new DateTime(year, mon, day);
            return Date.ToString("MM/dd/yyyy");
        }

        //Clear tất cả textbox
        void clearText()
        {
            TxtBanTinTomTat.Text = "";
            TxtTieuDe.Text = "";
            CKEditor1.Text = "";
        }

        //Hiện lưới quản trị tin tức
        protected void imgHienLuoi_Click(object sender, ImageClickEventArgs e)
        {
            LuoiQuanTriTinTuc.Visible = true;
            suatin.Visible = false;
        }

        //Hiện form post tin
        protected void imgbtThem_Click(object sender, ImageClickEventArgs e)
        {
            LuoiQuanTriTinTuc.Visible = false;
            suatin.Visible = true;
            clearText();
            XuatLoaiTin();
            img.Src = "";
        }

        //Thêm tin
        protected void imgbtLuuThem_Click(object sender, ImageClickEventArgs e)
        {
            if (int.Parse(ddlLoaiTinMaTin.SelectedValue.ToString()) != 0)
            {
                TinTucbo.MaLoai = int.Parse(ddlLoaiTinMaTin.SelectedValue);
                TinTucbo.Tieude = TxtTieuDe.Text;
                TinTucbo.BanTinTomTat = TxtBanTinTomTat.Text;
                string str = CKEditor1.Text;
                string str2 = str.Replace("'", "&#39;");
                string str1 = Server.HtmlEncode(str2);
                TinTucbo.BanTinChiTiet = Server.HtmlDecode(str1);

                if (AsyncFileUpload1.HasFile)
                {
                    TinTucbo.HinhAnh = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
                }
                else
                {
                    TinTucbo.HinhAnh = lbHinhAnh.Text;
                }
                string test = Request.Form[txtNgayDang.UniqueID];
                TinTucbo.NgayDang = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()),"dd/MM/yyyy", CultureInfo.InvariantCulture);
                TinTucbo.NgonNgu = Boolean.Parse(ddlNgonNgu.SelectedValue);
                if (TinTuc.Insert(TinTucbo.MaLoai, TinTucbo.Tieude, TinTucbo.BanTinTomTat, TinTucbo.BanTinChiTiet, TinTucbo.HinhAnh, TinTucbo.NgayDang, TinTucbo.NgonNgu) == 1)
                {
                    clearText();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Đăng tin thành công !!')", true);
                    suatin.Visible = true;
                    XuatLuoi();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình đăng bài! Vui lòng kiểm tra lại ')", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng chọn loại tin !!');", true);
        }

        //Xóa bài viết
        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            TinTucbo.Matin = int.Parse(gvrow.Cells[1].Text);
            string baiviet = gvrow.Cells[2].Text;
            if (TinTuc.Delete(TinTucbo.Matin) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Bài viết đã được xóa ')", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình đăng bài! Vui lòng kiểm tra lại ')", true);
            XuatLuoi();
            LuoiQuanTriTinTuc.Visible = true;
        }

        //Hiện thông báo Yes/No trước khi xóa
        protected void gvTinTuc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "tieude"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }
        public void XuatLuoiLoaiTin()
        {
            ds = new DataSet();
            LoaiTinda = LoaiTin.LoaiTin_SelectALL();
            LoaiTinda.Fill(ds, "LoaiTin_SelectAll");
            gvLoaiTin.DataSource = ds.Tables[0];
            gvLoaiTin.DataBind();

        }
        protected void btThemLT_Click(object sender, EventArgs e)
        {
            if (btThemLT.Text != "Lưu")
            {
                XuatLuoiLoaiTin();
                btThemLT.Text = "Lưu";
                LuoiLoaiTin.Visible = true;
            }
            else
            {
                LoaiTinbo.Loai = txtLoaiTin.Text;
                if (LoaiTin.Insert(LoaiTinbo.Loai) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Thêm loại tin thành công thành công !!')", true);
                    btThemLT.Text = "Thêm loại tin";
                    XuatLuoiLoaiTin();
                    LuoiLoaiTin.Visible = false;
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình thêm loại tin! Vui lòng kiểm tra lại ')", true);
            }
        }

        protected void gvLoaiTin_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string loaitin = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "loai"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdeleteLT");
                lnkbtnresult.Attributes.Add("onclick", "javascript:return XoaLoaiTin('" + loaitin + "')");
            }
        }
        protected void lnkdeleteLT_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            LoaiTinbo.MaLoai = int.Parse(gvrow.Cells[1].Text);
            string loai = gvrow.Cells[2].Text;
            if (LoaiTin.Delete(LoaiTinbo.MaLoai) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Bài viết đã được xóa ')", true);
                LuoiLoaiTin.Visible = false;
                btThemLT.Text = "Thêm loại tin";
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình đăng bài! Vui lòng kiểm tra lại ')", true);
            
        }
    }
}