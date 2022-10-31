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
    public partial class Album : System.Web.UI.UserControl
    {
        AlbumBL blAlbum = new AlbumBL();
        AlBumBO boAlbum = new AlBumBO();
        LoaiHinhAnhBL blLoaiHinhAnh = new LoaiHinhAnhBL();
        LoaiHinhAnhBO boLoaiHinhAnh = new LoaiHinhAnhBO();
        public SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pds = new PagedDataSource();
        PagedDataSource _PageDataSource = new PagedDataSource();
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
        public void XuatHinhAnh()
        {
            //string sql01 = "select *, (select count(hinhanh.maalbum) from hinhanh where hinhanh.maalbum=album.maalbum) as soluong from Album order by ngaydang desc ";
            //Class_Album bang01 = new Class_Album(sql01);
            ds = new DataSet();
            da = blAlbum.SelectAll();
            da.Fill(ds, "AlbumSelectAll");

            if (CurrentPage < 0)
            {
                CurrentPage = 0;
            }

            _PageDataSource.DataSource = ds.Tables[0].DefaultView;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = 9;
            _PageDataSource.CurrentPageIndex = CurrentPage;

            ViewState["TotalPages"] = _PageDataSource.PageCount;
            this.lblPageInfo.Text = (CurrentPage + 1) + " / " + _PageDataSource.PageCount;
            dlHinhAnh.DataSource = _PageDataSource;
            dlHinhAnh.DataKeyField = "MaAlbum";
            dlHinhAnh.DataBind();
            int dong = ds.Tables[0].Rows.Count;

            this.doPaging(dong);

        }
        public void XuatHinhAnh(int MaLoaiHinhAnh)
        {
            //string sql01 = "select *, (select count(hinhanh.maalbum) from hinhanh where hinhanh.maalbum=album.maalbum) as soluong from Album where maloaihinhanh = '" + MaLoaiHinhAnh + "' order by ngaydang desc ";
            //Class_Album bang01 = new Class_Album(sql01);
            ds = new DataSet();
            da = blAlbum.SelectMaLoaiHinhAnh(MaLoaiHinhAnh);
            da.Fill(ds, "AlbumSelectMaLoaiHinhAnh");
            if (CurrentPage < 0)
            {
                CurrentPage = 0;
            }

            _PageDataSource.DataSource = ds.Tables[0].DefaultView;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = 9;
            _PageDataSource.CurrentPageIndex = CurrentPage;

            ViewState["TotalPages"] = _PageDataSource.PageCount;
            this.lblPageInfo.Text = (CurrentPage + 1) + " / " + _PageDataSource.PageCount;
            dlHinhAnh.DataSource = _PageDataSource;
            dlHinhAnh.DataKeyField = "MaAlbum";
            dlHinhAnh.DataBind();
            int dong = ds.Tables[0].Rows.Count;

            this.doPaging(dong);
        }
        private void doPaging(int dong)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            fistIndex = CurrentPage - 2;

            DataTable dtItems = new DataTable();

            if (CurrentPage < 9)
            {
                lastIndex = CurrentPage + 9;
            }
            else
            {
                lastIndex = dong / 9 + 1;
            }
            string test = ViewState["TotalPages"].ToString();
            if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                //fistIndex = lastIndex - 5;
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
            pds.PageSize = 9;
            this.dlPaging.DataSource = pds;
            this.dlPaging.DataBind();
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
        public void XuatLoaiHinhAnh()
        {
            ds = new DataSet();
            da = blLoaiHinhAnh.Select();
            da.Fill(ds, "LoaiHinhAnhSelect");
            ddlLoaiHinh.DataSource = ds.Tables[0];
            ddlLoaiHinh.DataTextField = "Loai";
            ddlLoaiHinh.DataValueField = "MaLoaiHinhAnh";
            ddlLoaiHinh.DataBind();
            ddlLoaiHinh.Items.Insert(0, "Tất cả");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                XuatHinhAnh();
                XuatLoaiHinhAnh();


            }
        }

        protected void ddlLoaiHinh_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentPage = 0;
            if (ddlLoaiHinh.SelectedValue == "Tất cả")
                XuatHinhAnh();
            else
                XuatHinhAnh(int.Parse(ddlLoaiHinh.SelectedValue));
        }
        private DataTable GetDataTable()
        {
            DataTable dtItems = new DataTable();
            SqlDataAdapter daAlbum = new SqlDataAdapter();
            if (ddlLoaiHinh.SelectedValue == "Tất cả")
            {
                daAlbum = blAlbum.SelectAll();
            }
            else
                daAlbum = blAlbum.SelectMaLoaiHinhAnh(int.Parse(ddlLoaiHinh.SelectedValue));
            daAlbum.Fill(dtItems);
            int dong = dtItems.Rows.Count;
            DataRow row;
            for (int i = 1; i <= dong; i++)
            {
                row = dtItems.NewRow();
                row["MaHinhAnh"] = i;
                dtItems.Rows.Add(row);
            }
            return dtItems;
        }
        protected void lbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            if (CurrentPage == lastIndex)
            {
                CurrentPage = lastIndex - 1;
            }
            this.XuatHinhAnh();
        }
        protected void lbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            this.XuatHinhAnh();
        }
        protected void lbtnLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            if (ddlLoaiHinh.SelectedValue == "Tất cả")
                this.XuatHinhAnh();
            else
                this.XuatHinhAnh(int.Parse(ddlLoaiHinh.SelectedValue));
        }
        protected void lbtnFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            if (ddlLoaiHinh.SelectedValue == "Tất cả")
                this.XuatHinhAnh();
            else
                this.XuatHinhAnh(int.Parse(ddlLoaiHinh.SelectedValue));
        }
        protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Paging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                if (ddlLoaiHinh.SelectedValue == "Tất cả")
                    this.XuatHinhAnh();
                else
                    this.XuatHinhAnh(int.Parse(ddlLoaiHinh.SelectedValue));
            }
        }
        protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.Style.Add("fone-size", "12px");
                //lnkbtnPage.Font.Bold = true;
                //lnkbtnPage.BackColor = System.Drawing.ColorTranslator.FromHtml("#1a80d3");
                lnkbtnPage.CssClass = "highlight";
                //lnkbtnPage.ForeColor = System.Drawing.Color.Cyan;
                lnkbtnPage.Attributes.Add("OnMouseOut", "border-style: groove; border-width: 1px; border-color: #454545");
            }
            else
            {
                //lnkbtnPage.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#00FFFF'");
                //lnkbtnPage.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#3399FF'");
                lnkbtnPage.CssClass = "normal";
            }
        }
    }
}