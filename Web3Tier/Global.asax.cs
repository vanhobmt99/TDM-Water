using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.Data;
namespace Web3Tier
{
    public class Global : System.Web.HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            //RouteTable.Routes.MapPageRoute("CT_TinTuc", "{id}", "ChiTietTinTuc");
            RouteTable.Routes.MapPageRoute("ProductDetail", "chi-tiet/{matin}.htm", "~/QLChung/CT_TinTuc.aspx");
            RouteTable.Routes.MapPageRoute("ClientRoute", "TinTuc/{matin}", "~/ASPX/ChiTietTinTuc.aspx");
            RouteTable.Routes.MapPageRoute("News", "News/{matin}", "~/QLChung/CT_TinTuc_en.aspx");
            RouteTable.Routes.MapPageRoute("KhoaHocCongNghe", "KhoaHocCongNghe/{matinkhcn}", "~/QLChung/Khoahoccongnghe.aspx");
            RouteTable.Routes.MapPageRoute("Video", "Video/{mavideo}", "~/QLChung/Video.aspx");
            RouteTable.Routes.MapPageRoute("Album", "HinhAnh/{Maalbum}", "~/ASPX/HinhAnh.aspx");
             //Code that runs on application startup
            Application["HomNay"] = 0;
            Application["HomQua"] = 0;
            Application["TuanNay"] = 0;
            Application["TuanTruoc"] = 0;
            Application["ThangNay"] = 0;
            Application["ThangTruoc"] = 0;
            Application["TatCa"] = 0;
            Application["visitors_online"] = 0;
        }   

        //void Application_Start(object sender, EventArgs e)
        //{
        //    // Code that runs on application startup

        //}

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            Session.Timeout = 150;
            Application.Lock();
            Application["visitors_online"] = Convert.ToInt32(Application["visitors_online"]) + 1;
            Application.UnLock();
            try
            {
                DataBindSQL mThongKe = new DataBindSQL();
                DataTable dtb = mThongKe.TableThongKe();
                if (dtb.Rows.Count > 0)
                {
                    Application["HomNay"] = long.Parse("0" + dtb.Rows[0]["HomNay"]).ToString("#,###");
                    Application["HomQua"] = long.Parse("0" + dtb.Rows[0]["HomQua"]).ToString("#,###");
                    Application["TuanNay"] = long.Parse("0" + dtb.Rows[0]["TuanNay"]).ToString("#,###");
                    Application["TuanTruoc"] = long.Parse("0" + dtb.Rows[0]["TuanTruoc"]).ToString("#,###");
                    Application["ThangNay"] = long.Parse("0" + dtb.Rows[0]["ThangNay"]).ToString("#,###");
                    Application["ThangTruoc"] = long.Parse("0" + dtb.Rows[0]["ThangTruoc"]).ToString("#,###");
                    Application["TatCa"] = long.Parse("0" + dtb.Rows[0]["TatCa"]).ToString("#,###");
                }
                dtb.Dispose();
                mThongKe = null;
            }
            catch { }

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            Application.Lock();
            Application["visitors_online"] = Convert.ToUInt32(Application["visitors_online"]) - 1;
            Application.UnLock();

        }

    }
}
