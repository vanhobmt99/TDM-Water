<%@ Control Language="C#" AutoEventWireup="true" Inherits="Web3Tier.ASCX.LienHe" %>
<script src="../Jquery/jquery-1.9.1.js" type="text/javascript"></script>
<script type="text/javascript" >
    $(document).ready(function () {
        $(window).load(function () {
            document.getElementById("ContentPlaceHolder1_ChiTietTin1_dlVanBan_imgSrcVanBan_2").setAttribute('src', '../Hinh/trangchu/thongbao3-icon.png');
            document.getElementById("ContentPlaceHolder1_ChiTietTin1_dlVanBan_imgSrcVanBan_1").setAttribute('src', '../Hinh/trangchu/thongbao2-icon.png');
            document.getElementById("ContentPlaceHolder1_ChiTietTin1_dlVanBan_imgSrcVanBan_0").setAttribute('src', '../Hinh/trangchu/thongbao1-icon.png');
        });
    });
</script>
<link href="../CSS/khungTinchitiet.css" rel="stylesheet" type="text/css" />

<style type="text/css">
    .tieudeTinchitiet {
        line-height: 160%;
        font-family: Arial;
        font-size: 16px;
        color: #0036CF;
        font-weight: normal;
        text-decoration: none;
     }
    .ngaydangtin {
        line-height: 160%;
        font-family: Arial;
        font-size: 12px;
        color: #2d2d2d;
        font-style: italic;
        text-decoration: none;
    }
    .noidungTinchitiet {
        font-family: Arial;
        color: #000;
        font-size: 13px;
        text-align: justify;
        line-height: 180%;
        text-indent: 18px;
        text-decoration: none;
    }
    .khungtin
    {
        border: 1px solid #b2b4b6;
        border-radius: 6px;
        padding: 10px;
        background-color: #FFF;
        text-decoration: none;
        margin-bottom: 5px;
        margin-top: 5px;
    }
    .tieude:hover
    {
        color: #006dd2 !important;
    }
    .style2
    {
        text-align: center;
        width: 31px;
    }
    .style4
    {
        height: 21px;
        padding-left:5px;
        padding-right:5px;
    }
    .style5
    {
        text-align: center;
        font-weight: bold;
        color: White;
        font-size: 15px;
        width: 31px;
    }
    .manganh {text-align: center; font-style: italic;}
    .table-linhvuckinhdoanh
    {
        border-collapse:collapse;
        margin: 5px 0 0px 4px;
        font-family: arial; 
        font-size: 13px; 
        width: 699px;
    }
    .table-linhvuckinhdoanh td
    {
        border:1px solid #089ed0;
        padding: 10px;
    }
    .style6
    {
        text-align: center;
        font-weight: bold;
        color: White;
        font-size: 15px;
    }
</style>
</head>
<body onload="load('1');" onunload="GUnload()" >
    <tr>
        <td style="vertical-align: top; width: 220px; table-layout: fixed; padding-left: 5px;">
            <%-- Cột Trái --%>
            <table cellpadding="0" cellspacing="0" style="margin-bottom: 5px;">
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
                                                    <td style="width: 50px; height: 50px;"><img id="imgSrcVanBan" runat="server" src="../Hinh/trangchu/thongbao3-icon.png"/></td>
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
                                            <td><a href="http://biwase.com.vn" target="_blank" class="tieude" style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%; color: black;">BIWASE</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td></tr>
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td><a href="http://www.cphaco.vn/" target="_blank" class="tieude"  style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%; color: black;">Hoa viên nghĩa trang Bình Dương</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png" /></td></tr>
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td><a href="http://binhduongnewcity.com.vn/" target="_blank"  class="tieude" style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%; color: black;">Thành phố mới Bình Dương</a></td>
                                        </tr>
                                        <tr><td colspan="2" style="width: 210px;"><img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td></tr>
                                        <tr>
                                            <td style="width: 13px;"><img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                            <td><a href="http://www.sawaco.com.vn/wps/portal" target="_blank"  class="tieude"  style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%; color: black;">Tổng công ty Cấp nước Sài Gòn</a></td>
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
        <td style="vertical-align: top; width: 725px; table-layout: fixed; padding-left: 5px; padding-right: 5px;">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding-top: 5px; text-align: center;">
                        <img src="../Hinh/sitecon/tieude-gioithieu.png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" class="khungtin">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0>
                                        <tr>
                                            <td align="center" colspan="5" style="font-family: arial; font-size: 20px; line-height: 160%; color: #b2b4b6; padding-top: 10px; padding-bottom: 10px; font-weight: bold"></td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <img src="../hinh/nguyenvanthien.png"/>
                                                <p style="color: Black ; line-height: 150%; margin-top: 8px; margin-bottom: 10px">
                                                    <b>Nguyễn Văn Thiền</b>
                                                    <br />Chủ Tịch Hội đồng quản trị
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <img src="../hinh/tranthehung.png"/>
                                                <p style="color: Black ; line-height: 150%; margin-top: 8px; margin-bottom: 10px">
                                                    <b>Trần Thế Hưng</b>
                                                    <br />Tổng giám đốc
                                                </p>
                                            </td>
                                        </tr>
                                    </table> 
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                    
            </table>
        </td>
        </tr>
</body>






