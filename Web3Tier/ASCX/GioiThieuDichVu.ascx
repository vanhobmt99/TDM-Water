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
    }

    .tieude:hover {
        color: #006dd2 !important;
    }

    .style2 {
        text-align: center;
        width: 31px;
    }

    .style4 {
        height: 21px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .style5 {
        text-align: center;
        font-weight: bold;
        color: White;
        font-size: 15px;
        width: 31px;
    }

    .manganh {
        text-align: center;
        font-style: italic;
    }

    .table-linhvuckinhdoanh {
        border-collapse: collapse;
        margin: 5px 0 0px 4px;
        font-family: arial;
        font-size: 13px;
        width: 699px;
    }

        .table-linhvuckinhdoanh td {
            border: 1px solid #089ed0;
            padding: 10px;
        }

    .style6 {
        text-align: center;
        font-weight: bold;
        color: White;
        font-size: 15px;
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
                            <a href="../ASPX/Gioithieudichvu.aspx">Giới thiệu dịch vụ</a>
                        </td>
                        <td align="left" style="display: inline-block; height: 30px; width: 15px; margin-top: 5px">
                            <img src="../Hinh/lastpart.png" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" class="khungtin">
                                <tr>
                                    <td>
                                        <table class="table-linhvuckinhdoanh">
                                            <tr style="background-color: #089ed0; color: White; padding: 3px;">
                                                <td class="style5">STT</td>
                                                <td class="style6">DỊCH VỤ</td>
                                            </tr>
                                            <tr>
                                                <td class="style2">1</td>
                                                <td class="style4">Đầu tư, khai thác, xử lý, cung cấp nước sạch phục vụ sinh hoạt và sản xuất
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">2</td>
                                                <td class="style4">Đầu tư, quản lý hệ thống thoát nước
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">3</td>
                                                <td class="style4">Thi công xây dựng, sửa chữa hệ thống cấp thoát nước
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">4</td>
                                                <td class="style4">Thiết kế kiến trúc, kết cấu công trình dân dụng và công nghiệp
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">5</td>
                                                <td class="style4">Thiết kế cấp thoát nước, điện công trình dân dụng, công nghiệp
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">6</td>
                                                <td class="style4">Thiết kế các công trình thủy lợi vừa và nhỏ
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">7</td>
                                                <td class="style4">Giám sát công tác xây dựng và hoàn thiện công trình dân dụng, công nghiệp, công trình hạ tầng kỹ thuật
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">8</td>
                                                <td class="style4">Lập dự toán, dự án đầu tư xây dựng công trình
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">9</td>
                                                <td class="style4">Mua bán vật tư ngành nước
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">10</td>
                                                <td class="style4">Xây dựng nhà các loại, công trình kỹ thuật dân dụng khác
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">11</td>
                                                <td class="style4">Thi công đường dây trung, hạ thế, trạm biến áp, hệ thống chiếu sáng công cộng
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">12</td>
                                                <td class="style4">Mua bán vật liệu, thiết bị lắp đặt khác trong xây dựng
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">13</td>
                                                <td class="style4">Lắp đặt hệ thống xây dựng khác
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">14</td>
                                                <td class="style4">Hoạt động xây dựng chuyên dụng khác
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">15</td>
                                                <td class="style4">Dịch vụ tư vấn về môi trường
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">16</td>
                                                <td class="style4">Cho thuê máy móc, thiết bị và đồ dùng hữu hình khác
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">17</td>
                                                <td class="style4">Dịch vụ phân tích, đánh giá chất lượng nước, môi trường
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



