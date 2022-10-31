<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CongBoThongTin.ascx.cs" Inherits="Web3Tier.ASCX.CongBoThongTin2" %>
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
        border: 1px solid #000;
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

    .phantrang {
        text-align: center;
        width: 300px;
        padding-top: 15px;
    }

    .toptieude {
        vertical-align: top;
        text-align: justify;
        line-height: 120%;
    }

    .style3 {
        width: 90px;
    }

    .normal {
        border-style: groove;
        border-width: 1px;
        border-color: #454545;
        font-family: arial;
        color: #454545;
        font-size: 12px;
        line-height: 200%;
    }

    .highlight {
        border-style: groove;
        border-width: 1px;
        border-color: #046ec5;
        font-family: arial;
        color: #046ec5;
        font-size: 12px;
        line-height: 200%;
    }

    .tieudetintheoloai {
        position: relative;
    }

    .hinhtin {
        position: absolute;
        top: 22px;
        left: 0;
    }

    .highlight {
        border-style: solid;
        border-width: 1px;
        border-color: #ff7747;
        font-family: arial;
        color: #ff4500;
        font-size: 12px;
        line-height: 180%;
    }

    .normal {
        border-style: solid;
        border-width: 1px;
        border-color: #7e7e7e;
        font-family: arial;
        font-size: 12px;
        line-height: 180%;
    }
	
	pre{
		color:#444;
		font-family: "Helvetica Neue",helvetica,arial,sans-serif;
		font-size:13px;
	}
</style>
<div style="background-color: #fff; padding: 10px;">
    <asp:GridView ID="gvLoaiTin" runat="server" AutoGenerateColumns="False"
        class="table-congbothongtin" OnRowDataBound="gvLoaiTin_RowDataBound">
        <Columns>
            <%--<asp:BoundField DataField="MATIN" HeaderText="Mã Tin">
                <HeaderStyle CssClass="hidden" />
                <ItemStyle CssClass="hidden" />
            </asp:BoundField> --%> 
            <asp:TemplateField HeaderText="Mã tin">
                <ItemTemplate>
                    <asp:LinkButton ID="MaTin" Text='<%#Bind("MATIN") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>          
			<asp:TemplateField HeaderText="Ngày giờ <br /> đăng tin">
                <ItemTemplate>
                    <pre><%# Convert.ToDateTime(Eval("NgayDang")).ToString("dd/MM/yyyy HH:mm") %></pre>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MCK">
                <ItemTemplate>
                    TDM
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên TCPH">
                <ItemTemplate>
                    <pre>CTCP Nước Thủ Dầu Một</pre>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tiêu đề tin">
                <ItemTemplate>
                    <a href="javascript:void(0);" onclick="ShowTitleContent(this, '<%# Eval("ChiTiet") %>');">
                        <asp:Label ID="lblEventTest" runat="server" Text='<%#Bind("tieude") %>'></asp:Label>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đính kèm">
                <ItemTemplate>
                    <asp:LinkButton ID="lnk_productid" Text="view" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td style="padding-top: 10px">
                <%--phan trang--%>
                <table cellpadding="0" border="0" class="phantrang">
                    <tr>
                        <td align="right">
                            <asp:ImageButton ID="ImageButton2" runat="server"
                                ImageUrl="~/Hinh/firstpage.png"
                                OnClick="lbtnFirst_Click" Width="62px" Heigh="23px" />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server"
                                ImageUrl="~/Hinh/back.png" OnClick="lbtnPrevious_Click"
                                Width="22px" Heigh="23px" />
                        </td>
                        <td align="center" valign="middle" width="120px">
                            <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                OnItemDataBound="dlPaging_ItemDataBound">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="23px" width="23px" style="margin: 2px; padding: 2px; text-align: center; vertical-align: middle;">
                                                <asp:LinkButton ID="lnkbtnPaging" runat="server"
                                                    CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging"
                                                    Style="text-decoration: none; text-align: center;"
                                                    Text='<%# Eval("PageText") %>' Width="20px" Font-Size="12px" onMouseOver="this.className='highlight'" onMouseOut="this.className='normal'"></asp:LinkButton>
                                            </td>
                                            <td width="2px">&nbsp;</td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>

                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton3" runat="server"
                                ImageUrl="~/Hinh/next.png" OnClick="lbtnNext_Click"
                                Width="22px" Heigh="23px" />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton4" runat="server"
                                ImageUrl="~/Hinh/lastpage.png" OnClick="lbtnLast_Click"
                                Width="62px" Heigh="23px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" align="center" valign="middle">
                            <asp:Label ID="lblPageInfo" runat="server" Font-Size="12px" ForeColor="#454545"></asp:Label>

                        </td>
                    </tr>
                </table>
                <%--het phan trang--%>
            </td>
        </tr>
    </table>
</div>

<div id="PopupContainer">
    <div id="PopupContentArea">
        <div style="padding: 5px;">
            <div style="float: left; width: 570px; font-weight: 700;">
                <span id="popupTitle"></span>
            </div>
            <img src="http://hnx.vn/home-theme/images/popup/x.png" alt="close" style="float: right; margin-top: -15px; margin-right: -15px; cursor: pointer; width: 25px;"
                onclick="ClosePopup();" />
        </div>
        <div style="clear: both; height: 0px;"></div>
        <div id="PopupContent" style="padding: 20px 5px; overflow-y: auto;">
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
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
        //alert('123');
    }

    function ShowTitleContent(sender, html) {
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
