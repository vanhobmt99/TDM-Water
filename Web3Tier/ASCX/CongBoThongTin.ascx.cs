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

namespace Web3Tier.ASCX
{
    public partial class CongBoThongTin2 : System.Web.UI.UserControl
    {
        TinCKBL blTinCK = new TinCKBL();
        TinCKBO boTinCK = new TinCKBO();

        DataTable dtTinTuc;
        DataSet ds;

        PagedDataSource pds = new PagedDataSource();
        PagedDataSource _PageDataSource = new PagedDataSource();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ds = new DataSet();
            //dtTinTuc = blTinCK.SelectAll();
            //gvLoaiTin.DataSource = dtTinTuc;
            //gvLoaiTin.DataBind();
            if (!IsPostBack)
            {
                xuattin();
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
                //if (lbltinhoatdongxahoi.Text.Length > 300)
                //{
                //    string tomtattinhoatdongxahoi = lbltinhoatdongxahoi.Text.catChuoi(300);
                //    lbltinhoatdongxahoi.Text = tomtattinhoatdongxahoi.ToString();
                //}

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

        protected void gvLoaiTin_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    LinkButton myHyperLink = e.Row.FindControl("lnkDownload") as LinkButton;
            //    Image imgFileScan = e.Row.FindControl("imgFileScan") as Image;
            //    string test = myHyperLink.CommandArgument;
            //    if (myHyperLink.CommandArgument != "")
            //    {
            //        imgFileScan.ImageUrl = "../Hinh/att.png";
            //    }
            //}
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {


                    LinkButton lnk = (LinkButton)e.Row.FindControl("lnk_productid");
                    LinkButton _matin = (LinkButton)e.Row.FindControl("MATIN");
                    string url = "Popup.aspx?MATIN=" + _matin.Text;

                    lnk.Attributes.Add("onClick", "JavaScript: window.open('" + url + "','','_blank','width=500,height=245,left=350,top=400')");
                }
            }
            catch (Exception)
            { }
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            try
            {
                string filePath = (sender as LinkButton).CommandArgument;
                //Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName("~/FileScan/" + filePath));
                Response.WriteFile("~/FileScan/" + filePath);
                Response.End();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('File bị lỗi !! ')</script>");
               
            }
           
        }
    }
}