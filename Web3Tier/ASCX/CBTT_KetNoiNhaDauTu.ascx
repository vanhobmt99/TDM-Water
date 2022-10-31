<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CBTT_KetNoiNhaDauTu.ascx.cs" Inherits="Web3Tier.ASCX.CBTT_KetNoiNhaDauTu" %>
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
<style type="text/css">
    .tieudeTinchitiet {
        line-height: 160%;
        font-family: Arial;
        font-size: 16px;
        color: #006dd2;
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
        padding: 6px;
        background-color: #FFF;
        text-decoration: none;
        margin-bottom: 5px;
        margin-top: 5px;
        width: 725px;
    }

    .td-gachngang {
        background-image: url(../Hinh/gachngang-pattern.jpg);
        background-repeat: repeat-x;
    }

    .tieude:hover {
        color: #006dd2 !important;
    }

    #ContentPlaceHolder1_ChiTietTin1_dlThongBao_imgThongBao_2 {
        display: none;
    }

    #ContentPlaceHolder1_ChiTietTin1_dlVanBan_imgVanBan_2 {
        display: none;
    }
    .auto-style1 {
        display: inline-block;
        height: 30px;
        line-height: 30px;
        background-color: #b42624;
        text-align: center;
        margin-top: 5px;
        padding-right: 15px;
        padding-left: 15px;
        color: #FFFFFF;
    }
</style>
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
                                                        <td colspan="2" class="td-gachngang">
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
                        <td class="auto-style1">
                            Kết nối nhà đầu tư</td>
                        <td align="left" style="display: inline-block; height: 30px; width: 15px; margin-top: 5px">
                            <img src="../Hinh/lastpart.png" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" class="khungtin">
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList1" runat="server">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="border-bottom: 1px dotted #53a3fe; width: 725px">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="text-align: justify;">
                                                                        <asp:HyperLink ID="HyperLink3" runat="server"
                                                                            Style="text-decoration: none; font-family: Arial; font-size: 14px; color: #0036cf; line-height: 160%"
                                                                            NavigateUrl='<%# GetRouteUrl("ClientRoute", new {matin = Eval("matin")}) %>'
                                                                            Text='<%# Eval("tieude") %>'></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label7" runat="server"
                                                                            Style="text-decoration: none; font-family: Arial; font-size: 11px; color: #000; font-style: italic; line-height: 200%;"
                                                                            Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>'>
                                                                        </asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 30px; text-align: justify; vertical-align: top">
                                                                        <asp:Label ID="Label8" runat="server"
                                                                            Style="text-decoration: none; font-family: Arial; font-size: 12px; color: #000; line-height: 200%;"
                                                                            Text='<%# Eval("BANTINTOMTAT") %>'>
                                                                        </asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center" class="td-gachngang">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
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

