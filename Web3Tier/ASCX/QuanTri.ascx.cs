using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using BussinessObject;
using Bussinesslogic;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Web3Tier.ASCX
{
    public partial class QuanTri : System.Web.UI.UserControl
    {
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        SqlDataAdapter da;
        DataSet ds;

        public void ClearText()
        {
            txtMKcu.Text = "";
            txtMKlan2.Text = "";
            txtMKmoi.Text = "";

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null && Session["Password"]== null)
                {
                    Response.Redirect("Login.aspx");
                }
                NguoiDungbo.Username = Session["UserName"].ToString();
                NguoiDungbo.Password = Session["Password"].ToString();
                if ((NguoiDungbl.NguoiDung_UserName(NguoiDungbo.Username, NguoiDungbo.Password) == 0))
                {
                    Response.Redirect("Login.aspx");
                }
                lbUserName.Text = NguoiDungbo.Username;
            }
        }

        protected void btCapNhatMK_Click(object sender, EventArgs e)
        {
            NguoiDungbo.Username = Session["UserName"].ToString();
            NguoiDungbo.Password = Session["Password"].ToString();
            if (txtMKmoi.Text.Trim() != txtMKlan2.Text.Trim())
            {
                ClearText();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Mật khẩu mới và nhập lại không giống nhau !!')", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Mật khẩu mới và nhập lại không giống nhau !!');", true);
                txtMKcu.Focus();
            }
            else
            {
                if ((NguoiDungbl.NguoiDung_UserName(NguoiDungbo.Username, NguoiDungbo.Password) == 1))
                {
                    string Password = "";
                    MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
                    byte[] hash = md5.ComputeHash(System.Text.Encoding.ASCII.GetBytes(txtMKmoi.Text));
                    for (int i = 0; i < hash.Length; i++)
                        Password += hash[i].ToString();
                    NguoiDungbo.Password = Password;
                    if ((NguoiDungbl.NguoiDung_Update(NguoiDungbo.Username, NguoiDungbo.Password) == 1))
                    {
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Cập nhật password thành công !!')", true);
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Cập nhật password thành công !!');", true);

                    }
                    else
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình cập nhật password! Vui lòng kiểm tra lại ')", true);
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Lỗi trong quá trình cập nhật password! Vui lòng kiểm tra lại !!');", true);
                }
            }
        }

        protected void btQuanTriBaiViet_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTriTinTuc.aspx");
        }

        protected void btQuanTriVideos_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTriVideos.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTriLienHe.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTriAlbum.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTriTinCK.aspx");
        }
    }
}