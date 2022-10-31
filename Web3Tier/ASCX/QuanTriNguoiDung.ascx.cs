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
    public partial class QuanTriNguoiDung : System.Web.UI.UserControl
    {
        NguoiDungBL NguoiDungbl = new NguoiDungBL();
        NguoiDungBO NguoiDungbo = new NguoiDungBO();
        SqlDataAdapter da;
        DataSet ds;

        public void ClearText()
        {
            txtUserName.Text = "";
            txtMKlan2.Text = "";
            txtMKmoi.Text = "";

        }
        private void XuatUser()
        {
            ds = new DataSet();
            da = NguoiDungbl.NguoiDung_SelectAll();
            da.Fill(ds, "NguoiDung_SelectAll");
            ddlUserName.DataSource = ds.Tables[0];
            ddlUserName.DataTextField = "UserName";
            ddlUserName.DataValueField = "UserName";
            ddlUserName.DataBind();
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
                XuatUser();
            }
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            txtUserName.Visible = true;
            ddlUserName.Visible = false;
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            NguoiDungbo.Username = txtUserName.Text;
            NguoiDungbo.Password = Session["Password"].ToString();
            if (txtMKmoi.Text.Trim() != txtMKlan2.Text.Trim())
            {
                ClearText();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Mật khẩu mới và nhập lại không giống nhau !!')", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Mật khẩu mới và nhập lại không giống nhau !!');", true);
            }
            else
            {
                if ((NguoiDungbl.NguoiDung_Insert(NguoiDungbo.Username, NguoiDungbo.Password) == 1))
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
                        txtUserName.Visible = false;
                        ddlUserName.Visible = true;
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thêm thành công !!');", true);

                    }
                    else
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình cập nhật password! Vui lòng kiểm tra lại ')", true);
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Lỗi trong quá trình cập nhật password! Vui lòng kiểm tra lại !!');", true);
                }
            }
        }

        protected void btCapNhatMK_Click(object sender, EventArgs e)
        {
            NguoiDungbo.Username = ddlUserName.SelectedValue.ToString();
            NguoiDungbo.Password = Session["Password"].ToString();
            if (txtMKmoi.Text.Trim() != txtMKlan2.Text.Trim())
            {
                ClearText();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Mật khẩu mới và nhập lại không giống nhau !!')", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Mật khẩu mới và nhập lại không giống nhau !!');", true);
            }
            else
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

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            NguoiDungbo.Username = ddlUserName.SelectedValue.ToString();
            if((NguoiDungbl.NguoiDung_Delete(NguoiDungbo.Username)==1))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa thành công !!');", true);
                XuatUser();
            }
            else
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + "Lỗi trong quá trình cập nhật password! Vui lòng kiểm tra lại ')", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa người dùng thất bại! Vui lòng kiểm tra lại !!');", true);
        }
    }
}