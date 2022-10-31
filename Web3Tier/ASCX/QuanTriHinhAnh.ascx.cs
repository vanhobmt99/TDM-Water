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
    public partial class QuanTriHinhAnh1 : System.Web.UI.UserControl
    {
        HinhAnhBL blHinhAnh = new HinhAnhBL();
        HinhAnhBO boHinhAnh = new HinhAnhBO();
        AlbumBL blAlbum = new AlbumBL();
        AlBumBO boAlbum = new AlBumBO();
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        DataSet ds;
        SqlDataAdapter da;
        SqlDataAdapter daAlbum;

        public void XuatAlbum()
        {
            ds = new DataSet();
            da = blAlbum.SelectAll();
            da.Fill(ds, "AlbumSelectAll");
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = "TenAlbum";
            DropDownList1.DataValueField = "MaAlbum";
            DropDownList1.DataBind();
        }
        public void XuatLuoiHinh(int MaAlbum)
        {
            ds = new DataSet();
            daAlbum = blHinhAnh.SelectAlBum(MaAlbum);
            daAlbum.Fill(ds, "HinhAnh_SelectAlBum");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
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
                    XuatAlbum();
                    XuatLuoiHinh(int.Parse(DropDownList1.SelectedValue));
                }
            }
        }
        protected void uploadFile_Click(object sender, EventArgs e)
        {
            listofuploadedfiles.Text = "";
            if (UploadImages.HasFiles)
            {
                foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                {
                    uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/HinhAnhHoatDong/"),
                    uploadedFile.FileName)); listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                    if (blHinhAnh.Insert(int.Parse(DropDownList1.SelectedValue), uploadedFile.FileName) == 1)
                    {
                        XuatLuoiHinh(int.Parse(DropDownList1.SelectedValue));
                    }
                }
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            XuatLuoiHinh(int.Parse(DropDownList1.SelectedValue));
        }
        protected void lnkdeleteLA_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            boHinhAnh.MaHinhAnh = int.Parse(gvrow.Cells[1].Text);
            boHinhAnh.Link = gvrow.Cells[2].Text;
            if (blHinhAnh.Delete(boHinhAnh.MaHinhAnh) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Loại hình ảnh " + boHinhAnh.Link + " đã được xóa ')", true);
                XuatLuoiHinh(int.Parse(DropDownList1.SelectedValue));
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Link"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdeleteLA");
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }
    }
}