<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LienHe.ascx.cs" Inherits="Web3Tier.ASCX.LienHe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Dia Chi Khu Lien Hop</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyDFm0ZXZkgBdg02VDCxba9-tnLwF_xHCMc"
      type="text/javascript"></script>
      
    <script type="text/javascript">

        var map = null;
        var geocoder = null;
        var contextmenu;

        function load(loc) {
            if (GBrowserIsCompatible()) {
                var point;
                map = new GMap2(document.getElementById('map'));
                map.addControl(new GOverviewMapControl());
                map.enableDoubleClickZoom();
                map.enableScrollWheelZoom();
                map.addControl(new GMapTypeControl());
                map.addControl(new GLargeMapControl());

                point = new GLatLng(10.984400, 106.672610);
                map.setCenter(point, 15);
                map.setZoom(15)

                GEvent.addListener(map, "click", function (overlay, pixel) {
                    if (pixel) {
                        var thongbao = "The GPoint value is: " + map.fromDivPixelToLatLng(pixel) + " at zoom level " + map.getZoom();
                        var vitri = new GLatLng(map.fromDivPixelToLatLng(pixel).lat(), map.fromDivPixelToLatLng(pixel).lng());
                        var latt = vitri.lat();
                        var lngg = vitri.lng();
                        document.getElementById("txt_Lat").value = latt;
                        document.getElementById("txt_Lng").value = lngg;

                        //map.openInfoWindow(pixel, thongbao);
                    }
                });
                var marker_old = new GMarker(point);
                map.removeOverlay(marker_old);
                point = new GLatLng(10.984400, 106.672610);
                var marker = new GMarker(point);
                map.setCenter(point, 16);
                map.addOverlay(marker);
                map.setMapType(G_NORMAL_MAP);
                var tieude = "Công ty Cổ Phần Nước Thủ Dầu Một </br> 7 Ngô Văn Trị - P.Phú Lợi - Tp.Thủ Dầu Một - tỉnh Bình Dương </br>Điện thoại: 06503.842255 - 842277        Fax: 06503.841838";
                var thongtin = '<font size="1" face="Arial" align="centre" color:#454545><b>' + tieude + '</b></font>';
                marker.openInfoWindowHtml(thongtin);
                GEvent.addListener(marker, "click", function () { marker.openInfoWindowHtml(thongtin); });
                GEvent.addListener(map, "click", function (overlay, pixel) {
                    if (pixel) {
                        //var thongbao = "The GPoint value is: " + map.fromDivPixelToLatLng(pixel) + " at zoom level " + map.getZoom();
                        var vitri = new GLatLng(map.fromDivPixelToLatLng(pixel).lat(), map.fromDivPixelToLatLng(pixel).lng());
                        var latt = vitri.lat();
                        var lngg = vitri.lng();
                        document.getElementById("txt_Lat").value = latt;
                        document.getElementById("txt_Lng").value = lngg;

                        map.openInfoWindow(pixel, thongtin);
                    }
                });
            }

        }

        function createContextMenu(map) {
            contextmenu = document.createElement("div");
            contextmenu.style.visibility = "hidden";
            contextmenu.style.background = "#ffffff";
            contextmenu.style.border = "1px solid #8888FF";

            contextmenu.innerHTML = '<a href="javascript:zoomIn()"><div class="context">&nbsp;&nbsp;Zoom in&nbsp;&nbsp;</div></a>'
        + '<a href="javascript:zoomOut()"><div class="context">&nbsp;&nbsp;Zoom out&nbsp;&nbsp;</div></a>'
        + '<a href="javascript:zoomInHere()"><div class="context">&nbsp;&nbsp;Zoom in here&nbsp;&nbsp;</div></a>'
        + '<a href="javascript:zoomOutHere()"><div class="context">&nbsp;&nbsp;Zoom out here&nbsp;&nbsp;</div></a>'
        + '<a href="javascript:centreMapHere()"><div class="context">&nbsp;&nbsp;Centre map here&nbsp;&nbsp;</div></a>';

            map.getContainer().appendChild(contextmenu);
            GEvent.addListener(map, "singlerightclick", function (pixel, tile) {
                clickedPixel = pixel;
                var x = pixel.x;
                var y = pixel.y;
                if (x > map.getSize().width - 120) {
                    x = map.getSize().width - 120
                }
                if (y > map.getSize().height - 100) {
                    y = map.getSize().height - 100
                }
                var pos = new GControlPosition(G_ANCHOR_TOP_LEFT, new GSize(x, y));
                pos.apply(contextmenu);
                contextmenu.style.visibility = "visible";
            });
            GEvent.addListener(map, "click", function () {
                contextmenu.style.visibility = "hidden";
            });
        }
        function zoomIn() {
            map.zoomIn();
            contextmenu.style.visibility = "hidden";
        }
        function zoomOut() {
            map.zoomOut();
            contextmenu.style.visibility = "hidden";
        }
        function zoomInHere() {
            var point = map.fromContainerPixelToLatLng(clickedPixel)
            map.zoomIn(point, true);
            contextmenu.style.visibility = "hidden";
        }
        function zoomOutHere() {
            var point = map.fromContainerPixelToLatLng(clickedPixel)
            map.setCenter(point, map.getZoom() - 1);
            contextmenu.style.visibility = "hidden";
        }
        function centreMapHere() {
            var point = map.fromContainerPixelToLatLng(clickedPixel)
            map.setCenter(point);
            contextmenu.style.visibility = "hidden";
        }
        $(document).ready(function () {
                document.getElementById("ContentPlaceHolder1_LienHe1_dlVanBan_imgSrcVanBan_2").setAttribute('src','../Hinh/trangchu/thongbao3-icon.png');
                document.getElementById("ContentPlaceHolder1_LienHe1_dlVanBan_imgSrcVanBan_1").setAttribute('src','../Hinh/trangchu/thongbao2-icon.png');
                document.getElementById("ContentPlaceHolder1_LienHe1_dlVanBan_imgSrcVanBan_0").setAttribute('src','../Hinh/trangchu/thongbao1-icon.png');
                });
    </script>
    <style type="text/css">
        #map
        {
            height: 302px;
            width: 703px;
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
</style>
</head>
<body onload="load('1');" onunload="GUnload()" >
    <table cellpadding="0" cellspacing="0" style=" background-color: White; width:100%">
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
                    <tr><td style="padding-top: 5px; text-align: center;"><img src="../Hinh/sitecon/tieude-lienhe.png" /></td></tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" class="khungtin">
                    			<tr>
                    				<td colspan="2" style="text-align: center; font-family: Arial; font-size: 15px; font-weight: bold; color: #006dd2; padding-top: 10px;">Nếu Quý khách hàng có yêu cầu, thắc mắc. Vui lòng liên hệ với chúng tôi.</td>                        			
                    			</tr> 
                                <tr>
                    				<td align="center" colspan="2" style="text-align: center; font-family: Arial; font-size: 17px; font-weight: bold; color: #006dd2; padding-top: 10px; padding-bottom: 15px;">
                        				CÔNG TY CỔ PHẦN NƯỚC THỦ DẦU MỘT
                        			</td>                        			
                    			</tr> 
                    			<tr>
                    				<td width="65px" align="left" style="font-family: arial; font-size: 12px;line-height: 200%; color:#000; font-weight: bold;">Điện thoại:</td>
                        			<td style="font-family: arial; font-size: 13px; line-height: 200%; color: #000;">06503.842255 - 842277</td>
                    			</tr>
                    			<tr>
                    				<td align="left" width="65px" style="font-family: arial; font-size: 13px;line-height:200%; color:#000; font-weight: bold;">Fax:</td>
                        			<td width="500px" style="font-family: arial; font-size: 13px;line-height:200%; color: #000">06503.841838</td>
                    			</tr>
                    			<tr>
                    				<td align="left" width="65px" style="font-family: arial; font-size: 12px;line-height: 200%; color:#000; font-weight: bold;">Email:</td>
                        			<td width="500px" style="font-family: arial; font-size: 13px; line-height: 200%; color: #000;">contact@tdmwater.vn</td>
                    			</tr>
                    			<tr >
                    				<td align="left" width="65px" style="font-family: arial; font-size: 12px;line-height: 200%; color:#000; font-weight: bold;">Địa chỉ:</td>
                        			<td width="500px" style="font-family: arial; font-size: 13px; line-height: 200%; color: #000;">Số 7 - đường Ngô Văn Trị - P.Phú Lợi – Tp.Thủ Dầu Một - tỉnh Bình Dương <br /></td>
                    			</tr>
                                <tr><td height="20px"></td></tr>
                                <tr><td colspan="2" class="style1"><div id="map"></div></td></tr> 
                                <tr><td height="20px"></td></tr>
                                <tr>
                                	<td colspan="2"  style="text-align:center;line-height: 155%; padding-bottom: 10px;">
                                        <b><font color="#006dd2">Hoặc điền đầy đủ vào các thông tin bên dưới.<br />Chúng tôi sẽ hồi đáp một cách sớm nhất đến Quý khách hàng. <br /></font></b>
                                	</td>
                                </tr>  
                                <tr>
	   								<td align="left" width="65px" style="font-family: arial; font-size: 13px;line-height:200%; color: #000">Họ tên:</td>
	   								<td>&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox></td>
	 							</tr> 	   							
                    			<tr>
	   								<td align="left" width="65px" style="font-family: arial; font-size: 13px;line-height:200%; color: #000">Địa chỉ:</td>
	   								<td>&nbsp;<asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox></td>
	 							</tr>	 
	   							<tr>
	   								<td align="left" width="65px" style="font-family: arial; font-size: 13px;line-height:200%; color: #000">Điện thoại:</td>
	   								<td>&nbsp;<asp:TextBox ID="TextBox3" runat="server" Width="300px"></asp:TextBox></td>
	 							</tr>
	   							<tr>
                    				<td align="left" width="65px" style="font-family: arial; font-size: 13px;line-height:200%; color: #000">Email:</td>
	   								<td>&nbsp;<asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox></td>
	 							</tr>	 				 	   				   
	  							<tr>
            						<td valign="top" align="left" width="65px" style="font-family: arial; font-size: 13px;line-height: 200%; color: #000">Yêu cầu:</div></td>
            						<td align="left"> &nbsp;<asp:TextBox ID="TextBox5" runat="server" Height="94px" TextMode="MultiLine" Width="300px"></asp:TextBox></td>
          						</tr>	 
	  							<tr>
	   								<td height="29">&nbsp;</td>
	   								<td>&nbsp;
                                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Gửi yêu cầu" />&nbsp;
                                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Làm lại" />&nbsp;<br />&nbsp;
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
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