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
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Drawing;
namespace Web3Tier.ASCX
{
    public partial class QuanTriYeuCauLienHe : System.Web.UI.UserControl
    {
        LienHeBO boLienHe = new LienHeBO();
        LienHeBL blLienHe = new LienHeBL();
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        DataSet ds;
        SqlDataAdapter da;
        public void XuatLuoi()
        {
            ds = new DataSet();
            da = blLienHe.LienHe_SelectAll();
            da.Fill(ds, "LienHe_SelectAll");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            GridView2.DataSource = ds.Tables[0];
            GridView2.DataBind();

        }
        //Xuất thông tin bài viết lên Form để edit
        protected void lnkedit_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            ds = new DataSet();
            da = blLienHe.LienHe_SelectMaYeuCau(int.Parse(gvrow.Cells[1].Text));
            da.Fill(ds, "LienHe_SelectMaYeuCau");

            txtDiaChi.Text = ds.Tables[0].Rows[0]["diachi"].ToString();
            txtDienThoai.Text = ds.Tables[0].Rows[0]["dienthoai"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            txtHoTen.Text = ds.Tables[0].Rows[0]["hoten"].ToString();
            txtXuLy.Text = ds.Tables[0].Rows[0]["noidungxuly"].ToString();
            txtYeuCau.Text = ds.Tables[0].Rows[0]["Yeucau"].ToString();
            if (ds.Tables[0].Rows[0]["ngaygui"].ToString().Trim() != "")
                txtNgayGui.Text = DateTime.Parse(ds.Tables[0].Rows[0]["ngaygui"].ToString()).ToString("dd/MM/yyyy");
            else
                txtNgayGui.Text = ds.Tables[0].Rows[0]["ngaygui"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["mayeucau"].ToString();
            if (ds.Tables[0].Rows[0]["xuly"].ToString() == "True")
                ckbXuLy.Checked = true;
            else
                ckbXuLy.Checked = false;
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.XuatLuoi();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean trangthai;
            if (ckbXuLy.Checked == true)
                trangthai = true;
            else
                trangthai = false;
            if (blLienHe.Update(Label1.Text, trangthai, txtXuLy.Text) == 1)
            {
                XuatLuoi();
                Label2.Text = "Cập nhật xử lý thành công!";
            }

        }

        protected void ExportToExcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView2.AllowPaging = false;
                this.XuatLuoi();

                GridView2.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView2.HeaderRow.Cells)
                {
                    cell.BackColor = GridView2.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView2.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView2.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView2.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView2.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { mso-number-format:\@; } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
}