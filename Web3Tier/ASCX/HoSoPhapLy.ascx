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
    .auto-style1 {
        width: 220px;
        table-layout: fixed;
        height: 928px;
    }
    .auto-style4 {
        width: 35px;
    }
</style>
</head>
<body onload="load('1');" onunload="GUnload()">
    <table cellpadding="0" cellspacing="0" style="background-color: White; width: 100%">
        <tr>
            <td style="vertical-align: top; padding-left: 5px;" class="auto-style1">
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
           <td  style="vertical-align: top" >
               <table class="table-linhvuckinhdoanh" >

                   <tr style="background-color: #089ed0; color: White; padding: 3px;"><td class="auto-style4">STT</td><td class="style6">HỒ SƠ PHÁP LÝ</td></tr>
                   <tr><td class="auto-style4">1</td><td class="style4"><a href="../File/GiayChungNhanDangKyKinhDoanh_L7.pdf">Giấy chứng nhận đăng ký kinh doanh</a></td></tr>
                   <tr><td class="auto-style4">2&nbsp;</td><td class="style4"><a href="../File/MauDauCongTy.pdf">Thông báo mẫu dấu</a></td></tr>
                   <tr><td class="auto-style4">3</td><td class="style4"><a href="../Filescan/Dieu le Cong ty Co phan Nuoc TDM.pdf">Điều lệ công ty</a></td></tr>
                   <tr><td class="auto-style4">4</td><td class="style4"><a href="../File/Quy che noi bo ve Quan tri Cong ty.pdf">Quy chế nội bộ về quản trị Công ty</a></td></tr>
                   <tr><td class="auto-style4">5</td><td class="style4"><a href="../File/Quy che hoat dong cua HDQT Cong ty CP nuoc TDM.pdf">Quy chế hoạt động của Hội đồng quản trị</a></td></tr>
                   <tr><td class="auto-style4">6</td><td class="style4"><a href="../File/Quy che hoat dong cua Ban kiem soat Cong ty CP Nuoc TDM.pdf">Quy chế hoạt động của Ban kiểm soát</a></td></tr>
                   <tr><td class="auto-style4">7</td><td class="style4"><a href="../File/QUYET DINH PHE DUYET VA BAN HANH QUY CHE CONG BO THONG TIN.pdf">Quyết định phê duyệt và Ban hành Quy chế Công bố thông tin</a></td></tr>
                   <tr><td class="auto-style4">8</td><td class="style4"><a href="../File/Quy che kiem toan noi bo.pdf">Quy chế kiểm toán nội bộ</a></td></tr>
                   <tr><td class="auto-style4">9</td><td class="style4"><a href="../Filescan/20220509 - TDM - QD CHAM DUT HDLD TANG TO VAN - KTT KIEM TP TCKT.pdf">Quyết định chấm dứt hợp đồng lao động TĂNG TỐ VÂN - KTT kiêm TRƯỞNG PHÒNG TÀI CHÍNH KẾ TOÁN </a></td></tr>
                   <tr><td class="auto-style4">10</td><td class="style4"><a href="../Filescan/20220509 - TDM - QD BO NHIEM NGUYEN DUY KHANG GIU CHUC KTT KIEM TP TCKT.pdf">Quyết định bổ nhiệm NGUYỄN DUY KHANG giữ chức vụ KTT kiêm TRƯỞNG PHÒNG TÀI CHÍNH KẾ TOÁN</a></td></tr>
               </table>

           </td>
        </tr>
    </table>
</body>






