<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;

public class Upload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        HttpPostedFile uploads = context.Request.Files["upload"];
        //HttpPostedFile uploads1 = context.Request.Files["upload"];
        string CKEditorFuncNum = context.Request["CKEditorFuncNum"];
        string file = System.IO.Path.GetFileName(uploads.FileName);

        string test = context.Server.MapPath(".") + "\\Images\\" + file;
        uploads.SaveAs(context.Server.MapPath(".") + "\\Images\\" + file);
        //uploads.SaveAs("C:\\inetpub\\wwwroot\\website\\Images\\" + file);
        //uploads1.SaveAs("D:\\PhongNCPT\\NHOM-PHANMEM\\ThanhHuong\\WEBSITE\\Images\\" + file);
        //provide direct URL here
        string url = "/Images/" + file;

        context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ", \"" + url + "\");</script>");
        context.Response.End();
    }

    public bool IsReusable 
    {
        get { return false;}
    }

}