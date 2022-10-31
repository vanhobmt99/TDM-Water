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
    public partial class HinhAnh : System.Web.UI.UserControl
    {
        HinhAnhBL blHinhAnh = new HinhAnhBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string MaAlbum = Page.RouteData.Values["MaAlbum"] as string;
                SqlDataAdapter da = blHinhAnh.SelectAlBum(int.Parse(MaAlbum));
                DataSet ds = new DataSet();
                da.Fill(ds, "HinhAnhAlbum");
                dlHinhAnh.DataSource = ds.Tables[0];
                dlHinhAnh.DataKeyField = "MaHinhAnh";
                dlHinhAnh.DataBind();
            }

        }
    }
}