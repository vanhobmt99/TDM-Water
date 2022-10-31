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
    public partial class Popup : System.Web.UI.UserControl
    {
        FileScanBL blFileScan = new FileScanBL();
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    string productid = Request.QueryString["MATIN"];

                    //lbl_productid.Text = "Product Id is: " + productid;
                    dt = new DataTable();
                    dt = blFileScan.SelectMaTin(int.Parse(productid));
                    gvLoaiTin.DataSource = dt;
                    gvLoaiTin.DataBind();
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