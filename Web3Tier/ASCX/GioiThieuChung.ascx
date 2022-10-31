<%@ Control Language="C#" AutoEventWireup="true" Inherits="Web3Tier.ASCX.LienHe" %>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/title.css">
<script src="../Jquery/jquery-1.9.1.js" type="text/javascript"></script>
<script type="text/javascript">
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
    * {
        font-family: Arial;
    }

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

    .khungtin {
        border: 1px solid #b2b4b6;
        border-radius: 6px;
        padding: 10px;
        background-color: #FFF;
        text-decoration: none;
        margin-bottom: 5px;
        margin-top: 5px;
        width: 725px;
    }

    .tieude:hover {
        color: #006dd2 !important;
    }

    .manganh {
        text-align: center;
        font-style: italic;
    }
</style>
</head>
<body onload="load('1');" onunload="GUnload()">
    <table cellpadding="0" cellspacing="0" style="background-color: White; width: 100%">
        <tr>
            <td style="vertical-align: top; width: 220px; table-layout: fixed; padding-left: 5px;">
                <%-- Cột Trái --%>
                <table cellpadding="0" cellspacing="0" style="margin-bottom: 5px;">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" class="tieude-muctin">
                                        <a href="../ASPX/thongbao.aspx">Thông báo</a>
                                    </td>
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
                                                                            Style="text-align: justify; font-family: Georgia,times new roman;"
                                                                            Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd") %>'>
                                                                        </asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 4px;">
                                                                        <asp:Label ID="lbThangNamThongBao" runat="server"
                                                                            Font-Bold="True" Font-Size="11px" Font-Italic="False" ForeColor="#000"
                                                                            Style="text-align: justify; font-family: Georgia,times new roman; border-top: 1px solid #d70700; line-height: 28px;"
                                                                            Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("MM - yyyy") %>'>
                                                                        </asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="padding-left: 5px; vertical-align: top;">
                                                            <asp:HyperLink ID="hlThongbao" runat="server"
                                                                Font-Names="Arial" Font-Size="12px" Font-Underline="False" ForeColor="#000"
                                                                Style="text-align: justify; line-height: 160%;"
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
                                    <td align="center" class="tieude-muctin tieude-khonglienket tieude-sau">
                                        <a href="#">Thủ tục - Văn bản</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px;">
                                        <asp:DataList ID="dlVanBan" runat="server">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 50px; height: 50px;">
                                                            <img id="imgSrcVanBan" runat="server" src="../Hinh/trangchu/thongbao3-icon.png" /></td>
                                                        <td style="padding-left: 3px;">
                                                            <asp:HyperLink ID="hlVanBan" runat="server"
                                                                Font-Names="Arial" Font-Size="12px" Font-Underline="False" ForeColor="#000"
                                                                NavigateUrl='<%# GetRouteUrl("ClientRoute", new {matin = Eval("matin")}) %>'
                                                                Style="text-align: justify; line-height: 180%;"
                                                                CssClass="tieude"
                                                                Text=' <%# Eval("tieude") %>'>
                                                            </asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <img id="imgVanBan" runat="server" style="padding-top: 8px; padding-bottom: 8px; width: 100%" src="../Hinh/trangchu/gachngang-thongbao.png" /></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="tieude-muctin tieude-khonglienket tieude-sau">
                                        <a href="#">Liên kết web</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: 1px solid #b2b4b6; border-radius: 6px; padding: 5px; padding-bottom: 4px;">
                                        <div style="height: 136px; overflow-y: hidden;">
                                            <table id="linkwebtable" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://biwase.com.vn" target="_blank" class="tieude">BIWASE</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.cphaco.vn/" target="_blank" class="tieude">Hoa viên nghĩa trang Bình Dương</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://binhduongnewcity.com.vn/" target="_blank" class="tieude">Thành phố mới Bình Dương</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.sawaco.com.vn/wps/portal" target="_blank" class="tieude">Tổng công ty Cấp nước Sài Gòn</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.sawaco.com.vn/wps/portal" target="_blank" class="tieude">Tổng công ty Cấp nước Sài Gòn</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.sawaco.com.vn/wps/portal" target="_blank" class="tieude">Tổng công ty Cấp nước Sài Gòn</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.sawaco.com.vn/wps/portal" target="_blank" class="tieude">Tổng công ty Cấp nước Sài Gòn</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 13px;">
                                                        <img src="../Hinh/trangchu/muitendo-icon.png" /></td>
                                                    <td style="padding-left: 7px; font-family: Arial; font-size: 12px; text-decoration: none; line-height: 160%;"><a href="http://www.sawaco.com.vn/wps/portal" target="_blank" class="tieude">Tổng công ty Cấp nước Sài Gòn</a></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="width: 210px;">
                                                        <img style="padding-top: 7px; padding-bottom: 7px; width: 100%;" src="../Hinh/trangchu/gachngang-thongbao.png"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="text-align: center; padding-top: 2px; padding-left: 100px; cursor: pointer;">
                                                    <img onclick="GoUp();" src="../Hinh/trangchu/muitenden-tren.png"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center; padding-top: 2px; padding-left: 100px; cursor: pointer;">
                                                    <img onclick="GoDown();" src="../Hinh/trangchu/muitenden-duoi.png"></td>
                                            </tr>
                                        </table>
                                        <script type="text/javascript">
                                            function GoUp() {
                                                var margin = parseInt($('#linkwebtable').css("margin-top").replace("px", ""));
                                                if (margin >= 0) {
                                                    $("#linkwebtable").animate({
                                                        marginTop: '0px'
                                                    }, 200);
                                                    //$('#linkwebtable').css("margin-top", "0px");
                                                    return;
                                                }
                                                else {
                                                    margin = margin + 40;
                                                    $("#linkwebtable").animate({
                                                        marginTop: margin + "px"
                                                    }, 200);
                                                    //$('#linkwebtable').css("margin-top", margin + "px");
                                                }
                                            }

                                            function GoDown() {
                                                var margin = parseInt($('#linkwebtable').css("margin-top").replace("px", ""));
                                                var h = $('#linkwebtable').height();
                                                if (Math.abs(margin) >= (h - 150)) {
                                                    return;
                                                }
                                                else {
                                                    margin = margin - 40;
                                                    $("#linkwebtable").animate({
                                                        marginTop: margin + "px"
                                                    }, 200);
                                                }
                                            }
                                        </script>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top; width: 725px; table-layout: fixed; padding-left: 5px; padding-right: 5px;">
                <table cellpadding="0" cellspacing="0">
                    <tr align="left">
                        <td class="tieude-bantinchitiet">
                            <a href="../ASPX/Gioithieuchung.aspx">Giới thiệu > </a>
                            <a href="../ASPX/Gioithieuchung.aspx">Giới thiệu chung</a>
                        </td>
                        <td align="left" style="display: inline-block; height: 30px; width: 15px; margin-top: 5px">
                            <img src="../Hinh/lastpart.png" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" class="khungtin">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" align="center">
                                            <tr>
                                                <td align="center" style="font-family: arial; font-size: 20px; line-height: 160%; color: #006dd2; font-weight: bold">GIỚI THIỆU CHUNG</td>
                                            </tr>
                                            <tr>
                                                <td style="font-family: Arial; font-size: 14px; color: Black; line-height: 180%; text-align: justify;">
                                                    <p>Công ty Cổ phần Nước Thủ Dầu Một là doanh nghiệp được thành lập bởi các cổ đông đồng sáng lập gồm: Công ty TNHH Thương Mại N.T.P, Công ty TNHH MTV Thương mại Dịch vụ kỹ thuật D&B, Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc.</p>
                                                    <p>Tên công ty viết bằng tiếng việt: <span style="font-weight: bold">CÔNG TY CỔ PHẦN NƯỚC THỦ DẦU MỘT.</span></p>
                                                    <p>Tên công ty viết bằng tiếng nước ngoài: <span style="font-weight: bold">THU DAU MOT WATER JOINT STOCK COMPANY.</span></p>
                                                    <p>Tên công ty viết tắt: <span style="font-weight: bold">TDMWATER.CO.</span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <img src="../hinh/gioithieuchung-hinh1.png" />
                                                    <p style="font-size: 12px; font-style: italic">Trạm bơm nước thô Tân Ba</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <img src="../hinh/gioithieuchung-hinh2.png" />
                                                    <p style="font-size: 12px; font-style: italic">Nhà máy nước Dĩ An công suất 100.000m3/ngày đêm</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <img src="../hinh/gioithieuchung-hinh3.png" />
                                                    <p style="font-size: 12px; font-style: italic">Nhà máy nước Dĩ An công suất 100.000m3/ngày đêm</p>
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
    </table>
</body>






