<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .table-congbothongtin {
            background: #f5f5f5;
            border-collapse: separate;
            box-shadow: inset 0 1px 0 #fff;
            font-size: 12px;
            line-height: 24px;
            text-align: left;
            width: 100%;
            color: #444;
            font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
            text-shadow: 0 1px 0 #fff;
        }

            .table-congbothongtin a {
                text-decoration: none;
                color: #444;
            }

                .table-congbothongtin a:hover {
                    text-decoration: underline;
                }

            .table-congbothongtin th {
                background-color: #444;
                border-left: 1px solid #555;
                border-right: 1px solid #777;
                border-top: 1px solid #555;
                border-bottom: 1px solid #333;
                box-shadow: inset 0 1px 0 #999;
                color: #fff;
                font-weight: bold;
                padding: 10px 15px;
                position: relative;
                text-shadow: 0 1px 0 #000;
                text-align: center;
            }

                .table-congbothongtin th:after {
                    content: '';
                    display: block;
                    height: 25%;
                    left: 0;
                    margin: 1px 0 0 0;
                    position: absolute;
                    top: 25%;
                    width: 100%;
                }

                .table-congbothongtin th:first-child {
                    border-left: 1px solid #777;
                    box-shadow: inset 1px 1px 0 #999;
                }

                .table-congbothongtin th:last-child {
                    box-shadow: inset -1px 1px 0 #999;
                }

            .table-congbothongtin td {
                border-right: 1px solid #fff;
                border-left: 1px solid #e8e8e8;
                border-top: 1px solid #fff;
                border-bottom: 1px solid #e8e8e8;
                padding: 10px 15px;
                position: relative;
                transition: all 300ms;
            }

                .table-congbothongtin td:first-child {
                    box-shadow: inset 1px 0 0 #fff;
                }

                .table-congbothongtin td:last-child {
                    border-right: 1px solid #e8e8e8;
                    box-shadow: inset -1px 0 0 #fff;
                }

            .table-congbothongtin .tdtime {
                width: 100px;
                text-align: center;
            }

            .table-congbothongtin .tdname {
                width: 150px;
            }

            .table-congbothongtin .tdtitle {
                text-align: justify;
            }

            .table-congbothongtin .tdattact {
                text-align: center;
            }

            .table-congbothongtin tr {
                background: url(http://jackrugile.com/images/misc/noise-diagonal.png);
            }

                .table-congbothongtin tr:nth-child(odd) td {
                    background: #f1f1f1 url(http://jackrugile.com/images/misc/noise-diagonal.png);
                }

                .table-congbothongtin tr:last-of-type td {
                    box-shadow: inset 0 -1px 0 #fff;
                }

                    .table-congbothongtin tr:last-of-type td:first-child {
                        box-shadow: inset 1px -1px 0 #fff;
                    }

                    .table-congbothongtin tr:last-of-type td:last-child {
                        box-shadow: inset -1px -1px 0 #fff;
                    }
					
			#PopupContainer {            
				display: none;
				height: 100%;
				left: 0;
				position: fixed;
				top: 0;
				width: 100%;
				z-index: 100000;
                color: #444;
                font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
                line-height: 20px;
                
			}

			#PopupContentArea {
				width: 600px;
				margin-left: auto;
				margin-right: auto;
				height: auto;
				background-color: #ECECEC;
				border:1px solid #000;		
                padding: 10px;		
			}

            #popupTitle {            
				font-size: 14px;
			}

            .filename {
                text-decoration: none;
                color: #531E1E;
                font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
                line-height: 20px;
            }
    </style>
    <div style="background-color: #fff; padding: 10px;">
        <table class="table-congbothongtin">
            <thead>
                <tr>
                    <th>Ngày giờ
                        <br />
                        đăng tin</th>
                    <th>MCK</th>
                    <th>Tên TCPH</th>
                    <th>Tiêu đề tin</th>
                    <th>Đính kèm</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="tdtime">22/04/2016 16:42</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '<p> 123 </p>');">
                            Công ty TNHH Một thành viên Cấp Thoát nước - Môi trường Bình Dương - người có liên quan đến Trưởng Ban kiểm soát - đã bán 7.800.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">22/04/2016 16:11</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '- Tên tổ chức thực hiện giao dịch: Công ty TNHH MTV Thương mại Dịch vụ Kỹ thuật D&B<br/>- Mã chứng khoán: TDM<br/>- Số lượng cổ phiếu nắm giữ trước khi thực hiện giao dịch: 4.500.000 CP (tỷ lệ 15%)<br/>- Tên của người có liên quan tại TCNY: Võ Văn Bình<br/>- Chức vụ hiện nay của NCLQ tại tổ chức niêm yết: Ủy viên HĐQT<br/>- Chức vụ hiện nay của NCLQ tại tổ chức thực hiện giao dịch: Chủ tịch Hội đồng thành viên<br/>- Số lượng cổ phiếu NCLQ đang nắm giữ: 0 CP (tỷ lệ 0%)<br/>- Số lượng cổ phiếu đăng ký mua: 600.000 CP<br/>- Số lượng cổ phiếu đã mua: 600.000 CP<br/>- Số lượng cổ phiếu nắm giữ sau khi thực hiện giao dịch: 5.100.000 CP (tỷ lệ 17%)<br/>- Ngày bắt đầu giao dịch: 15/04/2016<br/>- Ngày kết thúc giao dịch: 15/04/2016.');">
                            Công ty TNHH MTV Thương mại Dịch vụ Kỹ thuật D&B - người có liên quan đến Ủy viên HĐQT - đã mua 600.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">22/04/2016 16:10</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '- Tên tổ chức thực hiện giao dịch: Công ty TNHH Thương mại N.T.P <br/>- Mã chứng khoán: TDM<br/>- Số lượng cổ phiếu nắm giữ trước khi thực hiện giao dịch: 4.500.000 CP (tỷ lệ 15%)<br/>- Tên của người có liên quan tại TCNY: Nguyễn Thanh Phong<br/>- Chức vụ hiện nay của NCLQ tại tổ chức niêm yết: Ủy viên HĐQT<br/>- Chức vụ hiện nay của NCLQ tại tổ chức thực hiện giao dịch: Giám đốc<br/>- Số lượng cổ phiếu NCLQ đang nắm giữ: 0 CP (tỷ lệ 0%)<br/>- Số lượng cổ phiếu đăng ký mua: 600.000 CP<br/>- Số lượng cổ phiếu đã mua: 600.000 CP<br/>- Số lượng cổ phiếu nắm giữ sau khi thực hiện giao dịch: 5.100.000 CP (tỷ lệ 17%)<br/>- Ngày bắt đầu giao dịch: 15/04/2016<br/>- Ngày kết thúc giao dịch: 15/04/2016.');">
                            Công ty TNHH Thương mại N.T.P - người có liên quan đến Ủy viên HĐQT - đã mua 600.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">22/04/2016 16:09</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '- Tên tổ chức thực hiện giao dịch: Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc<br/>- Mã chứng khoán: TDM<br/>- Số lượng cổ phiếu nắm giữ trước khi thực hiện giao dịch: 6.600.000 CP (tỷ lệ 22%)<br/>- Tên của người có liên quan tại TCNY: Nguyễn Văn Trí<br/>- Chức vụ hiện nay của NCLQ tại tổ chức niêm yết: Ủy viên HĐQT<br/>- Chức vụ hiện nay của NCLQ tại tổ chức thực hiện giao dịch: Giám đốc<br/>- Số lượng cổ phiếu NCLQ đang nắm giữ: 0 CP (tỷ lệ 0%)<br/>- Số lượng cổ phiếu đăng ký mua: 6.600.000 CP<br/>- Số lượng cổ phiếu đã mua: 6.600.000 CP<br/>- Số lượng cổ phiếu nắm giữ sau khi thực hiện giao dịch: 13.200.000 CP (tỷ lệ 44%)<br/>- Ngày bắt đầu giao dịch: 15/04/2016<br/>- Ngày kết thúc giao dịch: 15/04/2016.');">
                            Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc - người có liên quan đến Ủy viên HĐQT - đã mua 6.600.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">12/04/2016 17:00</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>TDM_2016.4.12_a8e7caa_BCTC_KIEM_TOAN_2015.PDF</a>');">
                            Báo cáo tài chính năm 2015
                        </a>
                    </td>
                    <td class="tdattact">
                        <a href="javascript:void(0)">
                            <img alt="Download" src="../Hinh/att.png" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>TDM_2016.4.12_a8e7caa_BCTC_KIEM_TOAN_2015.pdf</a>');">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="tdtime">11/04/2016 11:18</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '<p>dsdsfasfsfs</p>    <p>dsfasfsdaf</p>  ');">
                            Trần Thế Hưng - Tổng Giám đốc - đăng ký mua 30.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">06/04/2016 13:53</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>TDM_2016.4.6_4263d67_TDM_giao_dich.pdf</a>');">
                            Giao dịch của tổ chức có liên quan, cổ đông sáng lập
                        </a>
                    </td>
                    <td class="tdattact">
                        <a href="javascript:void(0)">
                            <img alt="Download" src="../Hinh/att.png" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>TDM_2016.4.6_4263d67_TDM_giao_dich.pdf</a>');">                            
                            <%--<img alt="Download" src="../Hinh/att.png" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>DGT_2016.5.6_6ebad7f_BB__NQ__BCAO_DHCD_2016.pdf</a><br/><a class=\'filename\' title=\'Tải về\' href=\'#\'>DGT_2016.5.6_6ebad7f_BB__NQ__BCAO_DHCD_2016.pdf</a>');">--%>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="tdtime">06/04/2016 13:52</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '- Tên tổ chức thực hiện giao dich: Công ty TNHH Thương mại N.T.P<br/>- Mã chứng khoán: TDM<br/>- Số lượng cổ phiếu nắm giữ trước khi thực hiện giao dịch: 4.500.000 CP (tỷ lệ 15%)<br/>- Tên của người có liên quan tại TCNY: Nguyễn Thanh Phong<br/>- Chức vụ hiện nay của NCLQ tại tổ chức niêm yết: Ủy viên HĐQT<br/>- Chức vụ hiện nay của NCLQ tại tổ chức thực hiện giao dịch: Giám đốc<br/>- Số lượng cổ phiếu NCLQ đang nắm giữ: 0 CP (tỷ lệ 0%)<br/>- Số lượng cổ phiếu đăng ký mua: 600.000 CP<br/>- Mục đích thực hiện giao dịch: Cơ cấu danh mục đầu tư<br/>- Phương thức giao dịch: Thoả thuận<br/>- Ngày dự kiến bắt đầu giao dịch: 07/04/2016<br/>- Ngày dự kiến kết thúc giao dịch: 15/04/2016.');">
                            Công ty TNHH Thương mại N.T.P - người có liên quan đến Ủy viên HĐQT - đăng ký mua 600.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">06/04/2016 13:50</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '- Tên tổ chức thực hiện giao dich: Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc<br/>- Mã chứng khoán: TDM<br/>- Số lượng cổ phiếu nắm giữ trước khi thực hiện giao dịch: 6.600.000 CP (tỷ lệ 22%)<br/>- Tên của người có liên quan tại TCNY: Nguyễn Văn Trí<br/>- Chức vụ hiện nay của NCLQ tại tổ chức niêm yết: Ủy viên HĐQT<br/>- Chức vụ hiện nay của NCLQ tại tổ chức thực hiện giao dịch: Giám đốc<br/>- Số lượng cổ phiếu NCLQ đang nắm giữ: 0 CP (tỷ lệ 0%)<br/>- Số lượng cổ phiếu đăng ký mua: 6.600.000 CP<br/>- Mục đích thực hiện giao dịch: Cơ cấu danh mục đầu tư<br/>- Phương thức giao dịch: Thoả thuận<br/>- Ngày dự kiến bắt đầu giao dịch: 07/04/2016<br/>- Ngày dự kiến kết thúc giao dịch: 15/04/2016.');">
                            Công ty TNHH Sản xuất và Thương mại Quỳnh Phúc - người có liên quan đến Ủy viên HĐQT - đăng ký mua 6.600.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">06/04/2016 13:48</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowTitleContent(this, '- Tên tổ chức thực hiện giao dich: Công ty TNHH MTV Thương mại Dịch vụ Kỹ thuật D&B<br/>- Mã chứng khoán: TDM<br/>- Số lượng cổ phiếu nắm giữ trước khi thực hiện giao dịch: 4.500.000 CP (tỷ lệ 15%)<br/>- Tên của người có liên quan tại TCNY: Võ Văn Bình<br/>- Chức vụ hiện nay của NCLQ tại tổ chức niêm yết: Ủy viên HĐQT<br/>- Chức vụ hiện nay của NCLQ tại tổ chức thực hiện giao dịch: Chủ tịch Hội đồng thành viên<br/>- Số lượng cổ phiếu NCLQ đang nắm giữ: 0 CP (tỷ lệ 0%)<br/>- Số lượng cổ phiếu đăng ký mua: 600.000 CP<br/>- Mục đích thực hiện giao dịch: Cơ cấu danh mục đầu tư<br/>- Phương thức giao dịch: Thoả thuận<br/>- Ngày dự kiến bắt đầu giao dịch: 07/04/2016<br/>- Ngày dự kiến kết thúc giao dịch: 15/04/2016.');">
                            Công ty TNHH MTV Thương mại Dịch vụ Kỹ thuật D&B - người có liên quan đến Ủy viên HĐQT - đăng ký mua 600.000 CP
                        </a>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdtime">25/03/2016 15:54</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>291-tb_2016-03-25_1513_1.PDF</a>');">
                            01/04/2016, ngày giao dịch đầu tiên cổ phiếu đăng ký giao dịch của CTCP Nước Thủ Dầu Một (MCK: TDM)
                        </a>
                    </td>
                    <td class="tdattact">
                        <a href="javascript:void(0)">
                            <img alt="Download" src="../Hinh/att.png" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>291-tb_2016-03-25_1513_1.PDF</a>');">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="tdtime">25/03/2016 15:51</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>Bản công bố thông tin TDM.rar</a>');">
                            Bản công bố thông tin CTCP Nước Thủ Dầu Một
                        </a>
                    </td>
                    <td class="tdattact">
                        <a href="javascript:void(0)">
                            <img alt="Download" src="../Hinh/att.png" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>Bản công bố thông tin TDM.rar</a>');">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="tdtime">25/03/2016 15:47</td>
                    <td>TDM</td>
                    <td class="tdname">CTCP Nước Thủ Dầu Một</td>
                    <td class="tdtitle">
                        <a href="javascript:void(0);" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>178-qd_2016-03-25_1513_1.PDF</a>');">
                            Quyết định chấp thuận đăng ký giao dịch cổ phiếu của CTCP Nước Thủ Dầu Một
                        </a>
                    </td>
                    <td class="tdattact">
                        <a href="javascript:void(0)">
                            <img alt="Download" src="../Hinh/att.png" onclick="ShowPopup('<a class=\'filename\' title=\'Tải về\' href=\'#\'>178-qd_2016-03-25_1513_1.PDF</a>');">
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="padding-top: 10px">
                    <img src="../Hinh/phantrang.png" />
                </td>
            </tr>
        </table>
    </div>
	
	<div id="PopupContainer">
        <div id="PopupContentArea">
            <div style="padding:5px;">
                <div style="float:left; width:570px; font-weight:700;">
                    <span id="popupTitle"></span>
                </div>
                <img src="http://hnx.vn/home-theme/images/popup/x.png" alt="close" style="float: right; margin-top: -15px; margin-right: -15px; cursor: pointer; width:25px;"
                     onclick="ClosePopup();"/>
            </div>
			<div style="clear:both;height:0px;"></div>
            <div id="PopupContent" style="padding:20px 5px;overflow-y: auto;">                
            </div>
        </div>
    </div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#PopupContent").css('max-height', ($(window).height() * 3 / 4) + 'px');
		});
	
		function ShowPopup(input) {
            if (input.trim() == '')
                return;
            $('#popupTitle').text('');
            $('#PopupContent').html(input);
			$('#PopupContainer').show();
            var h = $('#PopupContentArea').height();
            var top = ($(window).height() - h) / 2;
            if (top < 0)
                top = 0;
            $('#PopupContentArea').css("margin-top", top + "px");			            
        }

        function ShowTitleContent(sender, html){
            $('#popupTitle').text($(sender).text());
            $('#PopupContent').html(html);
			$('#PopupContainer').show();
            var h = $('#PopupContentArea').height();
            var top = ($(window).height() - h) / 2;
            if (top < 0)
                top = 0;
            $('#PopupContentArea').css("margin-top", top + "px");			            
        }

        function ClosePopup() {
            $('#PopupContent').html('');
            $('#popupTitle').text('');            
            $('#PopupContainer').hide()
        }
	</script>
</asp:Content>
