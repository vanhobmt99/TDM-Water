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
namespace Web3Tier.ASCX
{
    public partial class LienHe : System.Web.UI.UserControl
    {
        TinTucBL blTinTuc = new TinTucBL();
        TinTucBO boTinTuc = new TinTucBO();
        LienHeBO boLienHe = new LienHeBO();
        LienHeBL blLienHe = new LienHeBL();
        SqlDataAdapter daTinTuc;
        DataSet ds;

        public void XuatThongBao()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(3, 25);
            daTinTuc.Fill(ds, "TinTuc_ThongBao");
            dlThongBao.DataSource = ds.Tables[0];
            dlThongBao.DataBind();

            foreach (DataListItem Item in dlThongBao.Items)
            {
                HyperLink hpltinnoibo = ((HyperLink)(Item.FindControl("hlThongbao")));

                if (hpltinnoibo.Text.Length > 65)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(65);
                    hpltinnoibo.Text = tieudetinnoibo.ToString();
                }

            }
        }
        public void XuatVanBao()
        {
            ds = new DataSet();
            daTinTuc = blTinTuc.TinTuc_SoLuong_Maloai(3, 26);
            daTinTuc.Fill(ds, "TinTuc_VanBan");
            dlVanBan.DataSource = ds.Tables[0];
            dlVanBan.DataBind();

            foreach (DataListItem Item in dlVanBan.Items)
            {
                HyperLink hpltinnoibo = ((HyperLink)(Item.FindControl("hlVanBan")));

                if (hpltinnoibo.Text.Length > 50)
                {
                    string tieudetinnoibo = hpltinnoibo.Text.catChuoi(50);
                    hpltinnoibo.Text = tieudetinnoibo.ToString();
                }

            }
        }
        void cleartext()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                XuatThongBao();
                XuatVanBao();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            int xuly = 0;
            boLienHe.HoTen = TextBox1.Text.Replace("<", " ");
            boLienHe.DiaChi = TextBox2.Text.Replace("<", " ");
            boLienHe.DienThoai = TextBox3.Text.Replace("<", " ");
            boLienHe.Email = TextBox4.Text.Replace("<", " ");
            boLienHe.YeuCau = TextBox5.Text.Replace("<", " ");
            string test = TextBox1.Text.Contains("display:none").ToString();
            if (TextBox1.Text.CompareTo("display:none") == 0)
            {
                Label1.Text = "Số điện thoại bị sai vui lòng kiểm tra lại !!!!";
            }
            if (blLienHe.Insert(boLienHe.HoTen, boLienHe.DiaChi, boLienHe.DienThoai, boLienHe.Email, boLienHe.YeuCau) == 1)
            {
                cleartext();
                Label1.Text = "Yêu cầu gửi thành công. Chúng tôi sẽ liên hệ với " + boLienHe.HoTen + " trong thời gian sớm nhất. Chân thành cảm ơn !";
            }
            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    UseDefaultCredentials = false,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new NetworkCredential("bpnghiencuu@gmail.com", "Biw@se1802-bpnc"),
                    EnableSsl = true,
                    Timeout = 10000
                };
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("bpnghiencuu@gmail.com", "Bộ phận nghiên cứu");
                mail.To.Add(new MailAddress("bpnghiencuu@gmail.com"));
                mail.CC.Add(new MailAddress("hienit030688@gmail.com"));

                mail.Body = "Họ tên: " + boLienHe.HoTen + "\nĐịa chỉ: " + boLienHe.DiaChi + "\nĐiện thoại: " + boLienHe.DienThoai + "\nEmail: " + boLienHe.Email + "\nYêu cầu: " + boLienHe.YeuCau;
                mail.Subject = "Xử lý yêu cầu liên hệ từ website CP Nước TDM ngày " + DateTime.Now.ToString("dd/MM/yyyy");
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                Label1.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cleartext();
            Label1.Text = "";
        }
    }
}