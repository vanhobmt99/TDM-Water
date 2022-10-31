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

namespace Web3Tier.ASCX
{
    public partial class QuanTriVideo : System.Web.UI.UserControl
    {
        //Khai báo biến
        VideosBL Videosbl = new VideosBL();
        VideosBO Videosbo = new VideosBO();
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        SqlDataAdapter da;
        DataSet ds;
        protected string UploadFolderPath = "~/Uploads/";

        //Upload hình làm Poster
        protected void FileUploadComplete(object sender, EventArgs e)
        {
            string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            AsyncFileUpload1.SaveAs(Server.MapPath(this.UploadFolderPath) + filename);
        }

        //Xuất lưới danh sách Videos
        private void XuatLuoi()
        {
            ds = new DataSet();
            da = Videosbl.Videos_SelectAll();
            da.Fill(ds, "Videos_SelectAll");
            gvVideos.DataSource = ds.Tables[0];
            gvVideos.DataBind();
        }

        //Xuất form videos theo mã
        private void XuatVideo(int MaVideo)
        {
            ds = new DataSet();
            da = Videosbl.Videos_MaVideo(MaVideo);
            da.Fill(ds, "Videos_MaVideo");
            string linkhinh = "~/Uploads/" + ds.Tables[0].Rows[0]["PosterVideo"].ToString();
            imgDisplay.Src = linkhinh;
            txtTenVideo.Text = ds.Tables[0].Rows[0]["TenVideo"].ToString();
            txtLink.Text = ds.Tables[0].Rows[0]["LinkVideo"].ToString();
            lbMaVideo.Text = ds.Tables[0].Rows[0]["MaVideo"].ToString();
        }

        //Xóa text
        private void ClearText()
        {
            txtLink.Text = "";
            txtTenVideo.Text = "";
            imgDisplay.Src = "";
        }

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
                }
            }
        }

        //Nút Thêm
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string filename = "N'noPhoto.png'";
            if (AsyncFileUpload1.HasFile)
            {
                filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            }
            Videosbo.TenVideo = txtTenVideo.Text;
            Videosbo.LinkViedo = txtLink.Text;
            Videosbo.PosterVideo = filename;
            if (Videosbl.Insert(Videosbo.TenVideo, Videosbo.LinkViedo, Videosbo.PosterVideo) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Uplods Video thành công thành công !!')", true);
                ClearText();
                XuatLuoi();
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình upload video! Vui lòng kiểm tra lại ')", true);
        }

        //Nút Sửa
        protected void btnSua_Click(object sender, EventArgs e)
        {
            btnLuuSua.Visible = true;
            btnHuy.Visible = true;
            btnThem.Visible = false;
            btnSua.Visible = false;
        }

        //Nút Hủy
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            btnSua.Visible = true;
            btnThem.Visible = true;
            btnLuuSua.Visible = false;
            btnHuy.Visible = false;
        }

        protected void btnLuuSua_Click(object sender, EventArgs e)
        {
            string filename = "N'noPhoto.png'";
            if (AsyncFileUpload1.HasFile)
            {
                filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            }
            Videosbo.TenVideo = txtTenVideo.Text;
            Videosbo.LinkViedo = txtLink.Text;
            Videosbo.PosterVideo = filename;
            Videosbo.MaVideo = int.Parse(lbMaVideo.Text);
            if (Videosbl.Update(Videosbo.MaVideo,Videosbo.TenVideo, Videosbo.LinkViedo, Videosbo.PosterVideo) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Sửa Video thành công thành công !!')", true);
                ClearText();
                XuatLuoi();

            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình sửa video! Vui lòng kiểm tra lại ')", true);
        }

        //Hiện thông báo Yes/No trước khi xóa
        protected void gvVideos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "TenVideo"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }

        //Xuất thông tin lên form
        protected void lnkedit_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            XuatVideo(int.Parse(gvrow.Cells[1].Text));
        }

        //Xóa Video
        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            Videosbo.MaVideo = int.Parse(gvrow.Cells[1].Text);
            string TenVideo = gvrow.Cells[2].Text;
            if (Videosbl.Delete(Videosbo.MaVideo) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Video đã được xóa ')", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình xóa! Vui lòng kiểm tra lại ')", true);
            XuatLuoi();
        }
    }
}