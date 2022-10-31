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
using System.Net.Mime;
using System.Globalization;
using System.Text.RegularExpressions;

namespace Web3Tier.ASCX
{
    public partial class QuanTriTinCK : System.Web.UI.UserControl
    {
        TinCKBL blTinCK = new TinCKBL();
        TinCKBO boTinCK = new TinCKBO();
        FileScanBL blFileScan = new FileScanBL();
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();

        DataTable dtTinTuc;
        DataSet ds;

        PagedDataSource pds = new PagedDataSource();
        PagedDataSource _PageDataSource = new PagedDataSource();

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
                    xuattin();
                    txtNgayDang_CalendarExtender.SelectedDate = DateTime.Now;
                    txtTIme.Text = DateTime.Now.ToString("HH:mm");
                }
            }
        }
        public void xuattin()
        {
            ds = new DataSet();
            dtTinTuc = blTinCK.SelectAll();

            if (CurrentPage < 0)
            {
                CurrentPage = 0;
            }

            _PageDataSource.DataSource = dtTinTuc.DefaultView;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = 20;
            _PageDataSource.CurrentPageIndex = CurrentPage;

            ViewState["TotalPages"] = _PageDataSource.PageCount;
            this.lblPageInfo.Text = (CurrentPage + 1) + " / " + _PageDataSource.PageCount;
            gvLoaiTin.DataSource = _PageDataSource;
            gvLoaiTin.DataBind();
            foreach (GridViewRow row in gvLoaiTin.Rows)
            {
                string accessType = row.Cells[3].Text;
            }
            int dong = dtTinTuc.Rows.Count;

            this.doPaging(dong);
        }
        private int CurrentPage
        {
            get
            {
                object objPage = ViewState["_CurrentPage"];
                int _CurrentPage = 0;
                if (objPage == null)
                {
                    _CurrentPage = 0;
                }
                else
                {
                    _CurrentPage = (int)objPage;
                }
                return _CurrentPage;
            }
            set { ViewState["_CurrentPage"] = value; }
        }
        private int fistIndex
        {
            get
            {

                int _FirstIndex = 0;
                if (ViewState["_FirstIndex"] == null)
                {
                    _FirstIndex = 0;
                }
                else
                {
                    _FirstIndex = Convert.ToInt32(ViewState["_FirstIndex"]);
                }
                return _FirstIndex;
            }
            set { ViewState["_FirstIndex"] = value; }
        }
        private int lastIndex
        {
            get
            {

                int _LastIndex = 0;
                if (ViewState["_LastIndex"] == null)
                {
                    _LastIndex = 0;
                }
                else
                {
                    _LastIndex = Convert.ToInt32(ViewState["_LastIndex"]);
                }
                return _LastIndex;
            }
            set { ViewState["_LastIndex"] = value; }
        }
        private DataTable GetDataTable()
        {
            DataTable dtItems = new DataTable();
            ds = new DataSet();
            dtItems = blTinCK.SelectAll();
            int dong = dtItems.Rows.Count;
            DataRow row;
            for (int i = 1; i <= dong; i++)
            {
                row = dtItems.NewRow();
                row["matin"] = i;
                dtItems.Rows.Add(row);
            }
            return dtItems;
        }
        private void doPaging(int dong)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            fistIndex = CurrentPage - 2;

            DataTable dtItems = new DataTable();

            if (CurrentPage < 20)
            {
                lastIndex = CurrentPage + 20;
            }
            else
            {
                lastIndex = dong / 20 + 1;
            }
            if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                fistIndex = lastIndex - 20;
            }
            if (fistIndex < 0)
            {
                fistIndex = 0;
            }

            for (int i = fistIndex; i < lastIndex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 20;
            this.dlPaging.DataSource = pds;
            this.dlPaging.DataBind();
        }
        protected void lbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            if (CurrentPage == lastIndex)
            {
                CurrentPage = lastIndex - 1;
            }
            this.xuattin();
        }
        protected void lbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            this.xuattin();
        }
        protected void lbtnLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            this.xuattin();
        }
        protected void lbtnFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            this.xuattin();
        }
        protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Paging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                this.xuattin();
            }
        }
        protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.Style.Add("fone-size", "12px");
                lnkbtnPage.CssClass = "highlight";
                lnkbtnPage.Attributes.Add("OnMouseOut", "border-style: groove; border-width: 1px; border-color: #454545");
            }
            else
            {
                lnkbtnPage.CssClass = "normal";
            }
        }
        void clearText()
        {
            TxtTieuDe.Text = "";
            //CKEditor1.Text = "";
            CKEditor1.Text = "";
            //lbFileScan.Text = "";
            listofuploadedfiles.Text = "";
        }

        protected void imgbtThem_Click(object sender, ImageClickEventArgs e)
        {
            clearText();
        }

        protected void imgbtLuuSua_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                boTinCK.MaTin = int.Parse(lbMaTin.Text);
                boTinCK.TieuDe = TxtTieuDe.Text;
                boTinCK.ChiTiet = CKEditor1.Text;
                string str = CKEditor1.Text;
                string str2 = str.Replace("'", "&#39;");
                string str3 = str.Replace("\r\n", "");
                string str1 = Server.HtmlEncode(str3);
                boTinCK.ChiTiet = Server.HtmlDecode(str1);

                string date = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("MM-dd-yyyy");
                string time = txtTIme.Text;

                //boTinCK.NgayDang = DateTime.ParseExact(date + " " + time, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                //boTinCK.FileScan = lbFileScan.Text;
                boTinCK.NgayDang = new DateTime(int.Parse(Request.Form[txtNgayDang.UniqueID].Substring(6, 4)), int.Parse(Request.Form[txtNgayDang.UniqueID].Substring(3, 2)),
                                                          int.Parse(Request.Form[txtNgayDang.UniqueID].Substring(0, 2)), int.Parse(txtTIme.Text.Substring(0, 2)),
                                                          int.Parse(txtTIme.Text.Substring(3, 2)), 0);
                if (blTinCK.Update(boTinCK) == 1)
                {
                    listofuploadedfiles.Text = "";
                    if (UploadImages.HasFiles)
                    {
                        foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                        {
                            uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/FileScan/"),
                            uploadedFile.FileName)); listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                            blFileScan.Delete(boTinCK.MaTin);
                            blFileScan.Insert(boTinCK.MaTin, uploadedFile.FileName);
                        }
                    }
                    xuattin();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Bài viết đã sửa xong ')", true);
                    lbThongBao.Text = "Thao tác thành công";
                    suatin.Visible = true;
                    clearText();
                    imgbtLuuSua.Visible = false;
                    imgbtLuuThem.Visible = true;
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình sửa bài! Vui lòng kiểm tra lại ')", true);
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + ex.Message, true);
                lbThongBao.Text = ex.Message;
            }

        }

        protected void imgbtLuuThem_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                boTinCK.TieuDe = TxtTieuDe.Text;
                string str = CKEditor1.Text;
                string str2 = str.Replace("'", "&#39;");
                string str3 = str.Replace("\r\n", "");
                string str1 = Server.HtmlEncode(str3);
                boTinCK.ChiTiet = Server.HtmlDecode(str1);
                string date = DateTime.ParseExact((Request.Form[txtNgayDang.UniqueID].ToString()), "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
                string time = txtTIme.Text;

                boTinCK.NgayDang = new DateTime(int.Parse(Request.Form[txtNgayDang.UniqueID].Substring(6, 4)), int.Parse(Request.Form[txtNgayDang.UniqueID].Substring(3, 2)),
                                                          int.Parse(Request.Form[txtNgayDang.UniqueID].Substring(0, 2)), int.Parse(txtTIme.Text.Substring(0, 2)),
                                                          int.Parse(txtTIme.Text.Substring(3, 2)), 0);
                if (blTinCK.Insert(boTinCK) == 1)
                {
                    listofuploadedfiles.Text = "";
                    if (UploadImages.HasFiles)
                    {
                        foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                        {
                            uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/FileScan/"),
                            uploadedFile.FileName)); listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                            blFileScan.Insert(boTinCK.MaTin, uploadedFile.FileName);
                        }
                    }
                    xuattin();
                    lbThongBao.Text = "Thao tác thành công";
                    suatin.Visible = true;
                    clearText();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình thêm bài! Vui lòng kiểm tra lại ')", true);
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + ex.Message, true);
                lbThongBao.Text = ex.Message;
            }

        }

        protected void gvLoaiTin_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvLoaiTin_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton myHyperLink = e.Row.FindControl("lnkDownload") as LinkButton;
                Image imgFileScan = e.Row.FindControl("imgFileScan") as Image;
                string test = myHyperLink.CommandArgument;
                if (myHyperLink.CommandArgument != "")
                {
                    imgFileScan.ImageUrl = "../Hinh/att.png";
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "TieuDe"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
                lnkbtnresult.Attributes.Add("OnClick", "javascript:return ConfirmationBox('" + username + "')");
                //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvLoaiTin, "Select$" + e.Row.RowIndex);
                //e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void lnkedit_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnkbtn = sender as LinkButton;
                GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;

                lbMaTin.Text = gvrow.Cells[0].Text;
                boTinCK.MaTin = int.Parse(gvrow.Cells[0].Text);
                dtTinTuc = blTinCK.SelectMaTin(boTinCK);

                TxtTieuDe.Text = dtTinTuc.Rows[0]["TieuDe"].ToString();
                CKEditor1.Text = dtTinTuc.Rows[0]["ChiTiet"].ToString();

                DateTime dt = Convert.ToDateTime(dtTinTuc.Rows[0]["ngaydang"].ToString());
                txtTIme.Text = dt.ToString("HH:mm");
                txtNgayDang_CalendarExtender.SelectedDate = DateTime.Parse(dt.ToString());
                imgbtLuuSua.Visible = true;
                imgbtLuuThem.Visible = false;

            }
            catch (Exception ex)
            {

                lbThongBao.Text = ex.Message;
            }

        }
        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            boTinCK.MaTin = int.Parse(gvrow.Cells[0].Text);
            string baiviet = gvrow.Cells[2].Text;
            if (blTinCK.Delete(boTinCK.MaTin) == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Bài viết đã được xóa ')", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình đăng bài! Vui lòng kiểm tra lại ')", true);
            xuattin();
        }

        public bool ValidateTime(string time)
        {
            Regex regExp = new Regex(@"(([0-1][0-9])|([2][0-3])):([0-5][0-9])");

            return regExp.IsMatch(time);
        }
    }
}