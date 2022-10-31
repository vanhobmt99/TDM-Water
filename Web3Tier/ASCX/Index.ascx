<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Index.ascx.cs" Inherits="Web3Tier.ASCX.Index" %>

<script type="text/javascript" src="http://www.skypeassets.com/i/scom/js/skype-uri.js"></script>
<style type="text/css">
    .KhungIndex
    {
        width: 960px;
    }
    #viewport-logo
    {
      width: 960px;   
    }
    #slider1 {
	    padding: 0;
	    margin: 0;
	    list-style: none;
    }
    #slider1 li {
	    padding: 0;
	    margin: 0;
	    zoom: 0;
	    background: 255,255,255,1;
	
    } 
    #slide2
    {
        text-align:center;
        height: 123px;
    }
    a:link {
        text-decoration: none;
        color: #000;
    }

    a:visited {
        text-decoration: none;
        color: #000;
    }

    a:hover {
        text-decoration: none;
        color: #000;
    }

    a:active {
        text-decoration: none;
        color: #000;
    }
    .imgTinTucHoatDong
    {
        width: 172px;
        height: 100px;
    }

    #video-bg
    {
        background-color: #454545;
    }

    .TenVideo
    {
        color: black;
        font-family: Arial;
        font-size: 12px;
        font-weight: normal;
        text-align: justify;
        text-decoration:none;
    }

    .TenVideo:hover
    {
        color: #006dd2 !important;
    }

    .tieude:hover
    {
        color: #006dd2 !important;
    }

    .tieude-tintuchoatdong:hover
    {
        text-decoration: underline !important;
    }

    #kienthucnganhnuoc:hover
    {
        border: 5px solid #ffbebe !important;
    }

    .bx-pager-itemlogo
    {
        display: none;
    }
    .bx-controls-directionlogo
    {
        position: absolute;
        top: 50%;
    }
    .bx-pager-itemRight
    {
       display: none;
    }
    .bx-controls-directionRight
    {
        position: relative;
        left: 50%;
    }

    .bx-captionRight {
        position: absolute;
        bottom: 0px;
        left: 0px;
        background: none repeat scroll 0% 0% rgba(80, 80, 80, 0.75);
        width: 100%;
        }

    .bx-wrapper .bx-captionRight span {
        color: #FFF;
        font-family: Arial;
        display: block;
        font-size: 0.85em;
        padding: 10px;}
    #ContentPlaceHolder1_Index1_dlTinTucHoatDong_imgTinHoatDong_2
    {
        display: none;   
    }
    #ContentPlaceHolder1_Index1_dlThongBao_imgThongBao_2
    {
        display: none;   
    }
    #ContentPlaceHolder1_Index1_dlVanBan_imgVanBan_2
    {
        display: none;   
    }
    #ContentPlaceHolder1_Index1_dlTinTucCoDong_imgTinCoDong_2
    {
        display: none; 
    }
     #ContentPlaceHolder1_Index1_dlTinTucCoDong_imgTinCoDong_5
    {
        display: none;
    }
    #ContentPlaceHolder1_Index1_dlVideos_imgVideo_2
    {
        display: none;
    }
    .slide
    {
        margin-bottom: 7px !important;
    }
    .slide img
    {
        height: 118px !important;
    }
    </style>
<script src="../Jquery/jquery-1.9.1.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.bxslider.min.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.bxslider.js" type="text/javascript"></script>
<link href="../jquery.bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css" />
<script src="../jquery.bxslider/jquery.bxsliderlogo.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.bxsliderlogo.min.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.easing.compatibility.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.bxsliderRight.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.bxsliderRight.min.js" type="text/javascript"></script>
<script src="../jquery.bxslider/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript" >
    $(document).ready(function () {
        
        $('#slider1').bxSlider({
            mode: 'fade',
            captions: true,
            easing: 'easeOutElastic',
            speed: 2000,
        });
        $('.slider8').bxSliderRight({
            mode: 'vertical',
            slideWidth: 200,
            minSlides: 3,
            slideMargin: 10,
            captions: true,
           
        });
        $('.logo').bxSliderlogo({
            slideWidth: 240,
            minSlides: 2,
            maxSlides: 4,
            slideMargin: 20,
        });
         $(window).load(function () {
            document.getElementById("ContentPlaceHolder1_Index1_dlVanBan_imgSrcVanBan_2").setAttribute('src','../Hinh/trangchu/thongbao3-icon.png');
            document.getElementById("ContentPlaceHolder1_Index1_dlVanBan_imgSrcVanBan_1").setAttribute('src','../Hinh/trangchu/thongbao2-icon.png');
            document.getElementById("ContentPlaceHolder1_Index1_dlVanBan_imgSrcVanBan_0").setAttribute('src','../Hinh/trangchu/thongbao1-icon.png');
            });
    });
</script>

<table cellpadding="0" cellspacing="0" class="KhungIndex">
<%-- Slider --%>
<table id="slider" cellspacing="0" cellpadding="0">
    <tr>
        <td>
        <img src="../Hinh/trangchu/light-left.png" style="position: absolute; left: 120px;" />
        <img src="../Hinh/trangchu/light-right.png" style="position: absolute; right: 120px;" />
          <div class="bx-viewport" style="width: 960px; height: 354px;">
            <ul id="slider1" class="bxslider">
                <li style="height: 354px; width: 960px;">
                     <img src="../Hinh/slider/slider-tencty.png" style="position: absolute; left: 50px; top: 15px; z-index: 4;"/>  
                     <p style="text-align:justify; padding-left: 20px; line-height: 180%; font-size: 15px; width: 300px; 
                        height: 232px; color: white; z-index: 3; position: absolute; bottom: 10px;">
                             Công ty Cổ phần Nước Thủ Dầu Một là doanh nghiệp được thành lập bởi các cổ đông đồng sáng lập gồm: 
                             Công ty TNHH Một Thành Viên Cấp Thoát Nước Môi Trường Bình Dương, Công ty TNHH Thương Mại N.T.P, Công ty TNHH Thương mại Dịch vụ Kỹ Thuật D&B, 
                             Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc.</p>
                    <img src="../Hinh/slider/slider-bg.png" style="position: absolute; left: 0; z-index: 2;"/>
                    <img src="../Hinh/slider/slider-hinh1.png" style="position: absolute; right: 0; z-index: 1;"/>
                    <img src="../Hinh/slider/slider-nutchitiet.png" style="position: absolute; left: 20px; bottom: 20px; z-index:3;"/>
                </li>

               <%--<li style="height: 354px; width: 960px;">
                <p style="padding-left: 40px; color: white; z-index: 3; position: absolute; left: 10px; font-size: 24px; text-align: center;">
                                TDMWATER CO</p>
                     <p style="text-align: justify; padding-left: 20px; line-height: 180%; font-family: Arial; font-size: 15px; width: 300px; 
                            height: 232px; color: white; z-index: 3; position: absolute; bottom: 10px;">
                             Công ty Cổ phần Nước Thủ Dầu Một là doanh nghiệp được thành lập bởi các cổ đông đồng sáng lập gồm: 
                             Công ty TNHH Một Thành Viên Cấp Thoát Nước Môi Trường Bình Dương, Công ty TNHH Thương Mại N.T.P, Công ty TNHH Thương mại Dịch vụ Kỹ Thuật D&B, 
                             Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc.
                     </p>
                    <img src="../Hinh/slider/slider-bg.png" style="position: absolute; left: 0; z-index: 2;"/>
                    <img src="../Hinh/slider/slider-hinh2.png" style="position: absolute; right: 0; z-index: 1;"/>
                    <img src="../Hinh/slider/slider-nutchitiet.png" style="position: absolute; left: 10px; bottom: 10px; z-index: 3;"/>
                </li>

                <li style="height: 354px; width: 960px;">
                    <img src="../Hinh/slider/slider-bg.png" style="position: absolute; left: 0; z-index: 2;"/>
                    <img src="../Hinh/slider/slider-hinh3.png" style="position: absolute; right: 0; z-index: 1;"/>
                </li>

                <li style="height: 354px; width: 960px;">
                    <img src="../Hinh/slider/slider-bg.png" style="position: absolute; left: 0; z-index: 2;"/>
                    <img src="../Hinh/slider/slider-hinh4.png" style="position: absolute; right: 0; z-index: 1;"/>
                </li> --%>

           </ul>
       </div>                                                          
        </td>
    </tr>
</table>
<table id="TinTuc" cellspacing="0" cellpadding="0" style="background-color: #FFFFFF; width: 100%;">
    <tr>
        <td style="vertical-align: top; width: 225px; table-layout: fixed; padding-left: 5px;">
        <%-- Cột Trái --%>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="padding-top: 5px; padding-bottom: 5px">
                                    <img src="../Hinh/trangchu/tieude-thongbao.png" /></td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px; width: 220px;">
                                   <asp:DataList ID="dlThongBao" runat="server">
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 65px; height: 60px;">
                                                        <table cellpadding="0" cellspacing="0" style="border: 1px solid #616371; text-align: center; border-radius: 6px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lbNgayThongBao" runat="server" 
                                                                        Font-Size="20px" Font-Bold="True" Font-Italic="False" ForeColor="#d70700"
                                                                        style="text-align: justify; font-family: Georgia,times new roman;" 
                                                                        Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 4px;">
                                                                    <asp:Label ID="lbThangNamThongBao" runat="server" 
                                                                        Font-Bold="True" Font-Size="11px" Font-Italic="False" ForeColor="#000"
                                                                        style="text-align: justify; font-family: Georgia,times new roman; border-top: 1px solid #d70700; line-height: 28px;" 
                                                                        Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("MM - yyyy") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="padding-left: 5px; vertical-align: top;">
                                                        <asp:HyperLink ID="hlThongbao" runat="server"
                                                            Font-Names="Arial" Font-Size="12px" Font-Underline="False" ForeColor="#000" 
                                                            style="text-align: justify; line-height: 160%;"
                                                            CssClass="tieude"
                                                            NavigateUrl='<%# GetRouteUrl("ClientRoute", new {matin = Eval("matin")}) %>'
                                                            Text=' <%# Eval("tieude") %>'>
                                                        </asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <img id="imgThongBao" runat="server" style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png">
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 10px; padding-bottom: 5px"><img src="../Hinh/trangchu/tieude-thutucvanban.png" /></td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px;">
                                    <asp:DataList ID="dlVanBan" runat="server" >
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 50px; height: 50px;"><img id="imgSrcVanBan" runat="server" /></td>
                                                    <td style="padding-left: 3px;">
                                                        <asp:HyperLink ID="hlVanBan" runat="server"
                                                            Font-Names="Arial" Font-Size="12px" Font-Underline="False" ForeColor="#000" 
                                                            NavigateUrl='<%# GetRouteUrl("ClientRoute", new {matin = Eval("matin")}) %>' 
                                                            style="text-align: justify; line-height: 180%;"
                                                            CssClass="tieude"
                                                            Text=' <%# Eval("tieude") %>'>
                                                        </asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr><td colspan="2"><img id="imgVanBan" runat="server" style="padding-top: 8px; padding-bottom: 8px; width: 100%" src="../Hinh/trangchu/gachngang-thongbao.png"/></td></tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                               <td style="padding-top: 10px; padding-bottom: 5px"><img src="../Hinh/trangchu/tieude-lienketweb.png" /></td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px; padding-bottom: 4px;">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://biwase.com.vn" target="_blank" class="tieude">BIWASE</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td></tr>
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.cphaco.vn/" target="_blank" class="tieude">Hoa viên nghĩa trang Bình Dương</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td></tr>
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://binhduongnewcity.com.vn/" target="_blank"  class="tieude">Thành phố mới Bình Dương</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td></tr>
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.sawaco.com.vn/wps/portal" target="_blank"  class="tieude">Tổng công ty Cấp nước Sài Gòn</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td></tr>
                                        <tr><td colspan="2" style="text-align: center; padding-top: 2px"><img src="../Hinh/trangchu/muitenden-tren.png"></td></tr>
                                        <tr><td colspan="2" style="text-align: center; padding-top: 2px"><img src="../Hinh/trangchu/muitenden-duoi.png"></td></tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
       <%-- Cột giữa--%>
        <td style="width: 510px; table-layout: fixed; padding-left: 5px; padding-right: 5px; vertical-align: top; ">
            <table cellpadding="0" cellspacing="0" style="width: 500px; table-layout: fixed;">
                <tr>
                    <td style="padding-top: 5px; padding-bottom: 5px;">
                        <img width="500px" height="30px" src="../Hinh/trangchu/tieude-tintuchoatdong.png" />
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px; table-layout: fixed;">
                        <asp:DataList ID="dlTinTucHoatDong" runat="server">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align: top; padding-top: 5px;">
                                            <asp:Image ID="Image1" runat="server" CssClass="imgTinTucHoatDong"  ImageUrl='<%# "~/uploads/"+Eval("hinhanh") %>'/>
                                        </td>
                                        <td>
                                            <table style="padding-left: 5px; text-align: justify; line-height: 120%;">
                                                <tr>
                                                    <td style="vertical-align: top;">
                                                        <asp:HyperLink ID="hlTieuDe" runat="server" Font-Bold="False" 
                                                            Font-Names="Arial" Font-Size="14px" Font-Underline="False" ForeColor="#006dd2" 
                                                            NavigateUrl='<%# GetRouteUrl("ClientRoute", new {matin = Eval("matin")}) %>' 
                                                            CssClass="tieude-tintuchoatdong"
                                                            Text='<%# Eval("tieude") %>'>
                                                        </asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a style="font-size: 11px; font-family: Arial; font-style: italic; color: #2d2d2d;">Cập nhật:</a>
                                                        <asp:Label ID="lbNgay" runat="server" 
                                                            Font-Bold="False" Font-Names="Arial" Font-Size="11px" Font-Italic="True" ForeColor="#2d2d2d"
                                                            Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>' >
                                                        </asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbNoiDungTomTat" runat="server" 
                                                            Font-Bold="False" Font-Names="Arial" Font-Size="12px" ForeColor="#000"
                                                            Text='<%# Eval("BANTINTOMTAT") %>' >
                                                        </asp:Label>
                                                    </td>
                                                </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <img id="imgTinHoatDong" runat="server" style="padding-top: 6px; padding-bottom: 6px;" src="../Hinh/trangchu/gachngang-tintuchoatdong.png">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td  style="padding-top: 10px; padding-bottom: 5px;">
                    <img src="../Hinh/trangchu/tieude-tintuccodong.png" />
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 6px 5px 6px 5px;">
                    <asp:DataList ID="dlTinTucCoDong" runat="server" RepeatColumns="2">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top;">
                                        <asp:Image ID="imgTinTucCoDong" runat="server" Width="70px" Height="70px" ImageUrl='<%# "~/uploads/"+Eval("hinhanh") %>'/>
                                    </td>
                                    <td style="padding-left: 7px; padding-right: 3px; text-align: justify; line-height: 120%;">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:HyperLink ID="hlTinTucCoDong" runat="server"
                                                        Font-Names="Arial" Font-Size="12px" Font-Underline="False" ForeColor="#000" 
                                                        NavigateUrl='<%# GetRouteUrl("ClientRoute", new {matin = Eval("matin")}) %>'
                                                        CssClass="tieude" 
                                                        Text='<%# Eval("tieude") %>'>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a style="font-size: 11px; font-family: Arial; font-style: italic; color: #2d2d2d;">Cập nhật:</a>
                                                    <asp:Label ID="lbNgay" runat="server" 
                                                        Font-Bold="False" Font-Names="Arial" Font-Size="11px" Font-Italic="True" ForeColor="#2d2d2d"
                                                        Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>' >
                                                    </asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <img id="imgTinCoDong" runat="server" style="width: 100%; padding-top: 8px; padding-bottom: 7px; width: 239px;" src="../Hinh/trangchu/gachngang-tintuccodong.png">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            </table>
        </td>
        <%--Cột phải--%>
        <td style="width: 225px; vertical-align: top; padding-right: 5px; table-layout: fixed;">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding-top: 5px; padding-bottom: 5px"><img src="../Hinh/trangchu/tieude-khovideo.png" /></td>
                </tr>
                </tr>
                <tr>
                    <td>
                        <table style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 3px; width: 220px; table-layout: fixed;">
                            <tr>
                                <%--<td id="video-bg">
                                    <video id="video" runat="server" width="205px" height="140px" controls>
                                            <source type="video/mp4" src="../Movies/Du_an_xd_xn_nuoc_thai.mp4"></source>
                                    </video>
                                </td>--%>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DataList ID="dlVideos" runat="server" onitemcommand="dlVideos_ItemCommand">
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><asp:Image ID="Image1" runat="server" ImageUrl="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px">
                                                         <asp:LinkButton ID="linkbVideos" CssClass="TenVideo" runat="server"  Text='<%# Eval("TenVideo") %>'></asp:LinkButton>
                                                         <asp:Label ID="lbVideos" runat="server" Text='<%# Eval("LinkVideo") %>' Visible="false"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><img id="imgVideo" runat="server" style="padding-top: 7px; padding-bottom: 5px; width: 100%" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px; padding-bottom: 5px"><img src="../Hinh/trangchu/tieude-hinhanhhoatdong.png"/></td>
                </tr>
                <tr>
                    <td>
                        <table style="text-align: center; border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px; padding-top: 3px; width: 220px; table-layout: fixed;">
                            <tr><td>
                                <div class="slider8" >
                                  <div class="slide"><img src="../Hinh/slider/sliderRight-hinh1.png"></div>
                                  <div class="slide"><img src="../Hinh/slider/sliderRight-hinh2.png"></div>
                                  <div class="slide"><img src="../Hinh/slider/sliderRight-hinh3.png"></div>
                                  <div class="slide"><img src="../Hinh/slider/sliderRight-hinh4.png"></div>
                                </div>    
                            </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table cellpadding="0" cellspacing="0" style="background: #fff;">
    <tr>
        <td style="padding-right: 5px; padding-left: 5px;"><img style="padding-top: 10px; padding-bottom: 10px; width: 100%;" src="../Hinh/trangchu/gachngang-max.png"></td>
    </tr>
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td style="padding-left: 5px; width: 284px;"><a href="#"><img id="kienthucnganhnuoc" src="../Hinh/trangchu/kienthucnganhnuoc-logo.png" style="border: 5px solid #ffcdcd;" /></a></td>
                    <td style="padding-left: 11px; padding-right: 10px; width: 391px;"><img src="../Hinh/trangchu/hotrokhachhang-logo.png"/></td>
                    <td>
                        <table cellpadding="0" cellspacing="0" style="border: 5px solid #ffcdcd; width: 279px; height: 102px; margin-right: 5px;">
                            <tr>
                                <td colspan="3" style="text-align: center;"><img src="../Hinh/trangchu/hotrotructuyen-text.png" /></td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px; font-family: Arial; font-size: 14px; line-height: 200%;">PHÒNG </br> KINH DOANH</td>
                                <td style="padding-right: 10px;">
                                    <a href="http://messenger.yahoo.com/edit/send/?.target=changtrai_it1988">
                                            <img border=0 src="../Hinh/trangchu/yahoo-icon.png"></a>
                                    <%--<img src="../Hinh/trangchu/yahoo-icon.png" />--%>

                                </td>
                                <td>
                                    <a href="skype:anh_tanghien?chat"><img src="../Hinh/trangchu/skype-icon.png"/></a>
                                    <%--<img src="../Hinh/trangchu/skype-icon.png" />--%>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="padding-right: 5px; padding-left: 5px;">
            <img style="padding-top: 10px; padding-bottom: 10px; width: 100%;" src="../Hinh/trangchu/gachngang-max.png">
        </td>
    </tr>
    <tr>
        <td style="padding-bottom: 5px;">
            <table style="border: 5px solid #ffcdcd; border-left-width: 8px; border-right-width: 8px; width: 950px; height: 100px; margin-left: 5px; margin-right: 5px;">
                <tr>
                    <td>
                        <div class="logo">
                            <div style=""><a href="http://www.biwase.com.vn"><img src="../hinh/trangchu/logo-biwase.png"></a></div>
                            <div style="padding-top: 25px;"><a href="#"><img src="../hinh/trangchu/logo-ntp.png"></a></div>
                            <div style="padding-top: 10px;"><a href="#"><img src="../hinh/trangchu/logo-db.png"></a></div>
                            <div style="padding-top: 10px;"><a href="#"><img src="../hinh/trangchu/logo-db.png"></a></div>
                        </div>  
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

