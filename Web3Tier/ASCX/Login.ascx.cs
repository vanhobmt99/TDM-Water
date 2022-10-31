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
    public partial class Login : System.Web.UI.UserControl
    {
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
        }

        protected void imgbtDangNhap_Click(object sender, ImageClickEventArgs e)
        {
            Session["UserName"] = "";
            Session["Password"] = "";
            NguoiDungbo.Username = txtUserName.Text;
            string Password = "";
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] hash = md5.ComputeHash(System.Text.Encoding.ASCII.GetBytes(txtPassWord.Text));
            for (int i = 0; i < hash.Length; i++)
                Password += hash[i].ToString();
            NguoiDungbo.Password = Password;
            if ((NguoiDungbl.NguoiDung_VaiTro(NguoiDungbo.Username, NguoiDungbo.Password) != 1))
            {
                if ((NguoiDungbl.NguoiDung_UserName(NguoiDungbo.Username, NguoiDungbo.Password) == 1))
                {
                    Session["UserName"] = NguoiDungbo.Username;
                    Session["Password"] = NguoiDungbo.Password;
                    Response.Redirect("QuanTri.aspx");
                }
                else
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Tài khoản không hợp lệ !!')", true);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Tài khoản không hợp lệ !!');", true);
            }
            else
            {
                Session["UserName"] = NguoiDungbo.Username;
                Session["Password"] = NguoiDungbo.Password;
                Response.Redirect("QuanTriNguoiDung.aspx");
            }
        }
    }
}