<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriTinCK.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriTinCK" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<style type="text/css">
    .hinh
    {
        width: 100px;
    }

    .style1
    {
        width: 100%;
    }

    .table-congbothongtin
    {
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

        .table-congbothongtin a
        {
            text-decoration: none;
            color: #444;
        }

            .table-congbothongtin a:hover
            {
                text-decoration: underline;
            }

        .table-congbothongtin th
        {
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

            .table-congbothongtin th:after
            {
                content: '';
                display: block;
                height: 25%;
                left: 0;
                margin: 1px 0 0 0;
                position: absolute;
                top: 25%;
                width: 100%;
            }

            .table-congbothongtin th:first-child
            {
                border-left: 1px solid #777;
                box-shadow: inset 1px 1px 0 #999;
            }

            .table-congbothongtin th:last-child
            {
                box-shadow: inset -1px 1px 0 #999;
            }

        .table-congbothongtin td
        {
            border-right: 1px solid #fff;
            border-left: 1px solid #e8e8e8;
            border-top: 1px solid #fff;
            border-bottom: 1px solid #e8e8e8;
            padding: 10px 15px;
            position: relative;
            transition: all 300ms;
        }

            .table-congbothongtin td:first-child
            {
                box-shadow: inset 1px 0 0 #fff;
            }

            .table-congbothongtin td:last-child
            {
                border-right: 1px solid #e8e8e8;
                box-shadow: inset -1px 0 0 #fff;
            }

        .table-congbothongtin .tdtime
        {
            width: 100px;
            text-align: center;
        }

        .table-congbothongtin .tdname
        {
            width: 150px;
        }

        .table-congbothongtin .tdtitle
        {
            text-align: justify;
        }

        .table-congbothongtin .tdattact
        {
            text-align: center;
        }

        .table-congbothongtin tr
        {
            background: url(http://jackrugile.com/images/misc/noise-diagonal.png);
        }

            .table-congbothongtin tr:nth-child(odd) td
            {
                background: #f1f1f1 url(http://jackrugile.com/images/misc/noise-diagonal.png);
            }

            .table-congbothongtin tr:last-of-type td
            {
                box-shadow: inset 0 -1px 0 #fff;
            }

                .table-congbothongtin tr:last-of-type td:first-child
                {
                    box-shadow: inset 1px -1px 0 #fff;
                }

                .table-congbothongtin tr:last-of-type td:last-child
                {
                    box-shadow: inset -1px -1px 0 #fff;
                }

    #PopupContainer
    {
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

    #PopupContentArea
    {
        width: 600px;
        margin-left: auto;
        margin-right: auto;
        height: auto;
        background-color: #ECECEC;
        border: 1px solid #000;
        padding: 10px;
    }

    #popupTitle
    {
        font-size: 14px;
    }

    .filename
    {
        text-decoration: none;
        color: #531E1E;
        font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
        line-height: 20px;
    }

    .phantrang
    {
        text-align: center;
        width: 300px;
        padding-top: 15px;
    }

    .toptieude
    {
        vertical-align: top;
        text-align: justify;
        line-height: 120%;
    }

    .style3
    {
        width: 90px;
    }

    .normal
    {
        border-style: groove;
        border-width: 1px;
        border-color: #454545;
        font-family: arial;
        color: #454545;
        font-size: 12px;
        line-height: 200%;
    }

    .highlight
    {
        border-style: groove;
        border-width: 1px;
        border-color: #046ec5;
        font-family: arial;
        color: #046ec5;
        font-size: 12px;
        line-height: 200%;
    }

    .tieudetintheoloai
    {
        position: relative;
    }

    .hinhtin
    {
        position: absolute;
        top: 22px;
        left: 0;
    }
</style>
<table id="suatin" runat="server" width="100%">
    <tr>
        <td>
            <div>
                <table>
                    <tr>
                        <td class="style6">Tiêu đề:</td>
                        <td>
                            <asp:TextBox ID="TxtTieuDe" runat="server" Width="800px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div>
                <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Language="vi.js"
                    Toolbar="basic"></CKEditor:CKEditorControl>
                <%--<asp:TextBox ID="TextBox1" runat="server" Width="100%" Height="50px"></asp:TextBox>--%>
                <%--<table>
                    <tr>
                        <td>Nội dung: </td>
                        <td>
                            <%--<asp:TextBox ID="TextBox1" runat="server" Width="800px"></asp:TextBox>
                        </td>
                    </tr>
                </table>--%>
            </div>

        </td>
    </tr>
    <%--<tr>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" />
            <asp:Label ID="lbFileScan" runat="server"></asp:Label>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>--%>
    <tr>
        <td>
            <div>
                <asp:FileUpload runat="server" ID="UploadImages" AllowMultiple="true" />
                <%--<input type="file" multiple="multiple" name="UploadImages" id="FileUpload1" />--%>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
                <br />
                <asp:Label ID="listofuploadedfiles" runat="server" />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div align="top">
                &nbsp;<table class="style2">
                    <tr>
                        <td class="style3">Ngày đăng:</td>
                        <td>
                            <asp:TextBox ID="txtNgayDang" runat="server" Height="25px" ReadOnly="True"
                                Style="resize: none"
                                Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>'
                                TextMode="MultiLine" Width="200px"></asp:TextBox>
                            <%--<asp:TextBox ID="txtTIme" runat="server"></asp:TextBox>--%>
                            <cc1:CalendarExtender ID="txtNgayDang_CalendarExtender" runat="server"
                                DaysModeTitleFormat="dd,MM,yyyy" Format="dd/MM/yyyy" PopupButtonID="Image1"
                                PopupPosition="Right" SelectedDate="<%# DateTime.Now %>"
                                TargetControlID="txtNgayDang" TodaysDateFormat="dd,MM,yyyy">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div align="top">
                &nbsp;<table class="style2">
                    <tr>
                        <td class="style3">Giờ đăng:</td>
                        <td>
                            <asp:TextBox ID="txtTIme" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div>
                <table class="style2">
                    <tr>
                        <td class="style7">
                            <%--<asp:ImageButton ID="imgbtThem" runat="server" ImageUrl="~/Hinh/Them.gif" 
                                                        onclick="imgbtThem_Click" Visible="False"/>--%>
                            <asp:ImageButton ID="imgbtLuuSua" runat="server" ImageUrl="~/Hinh/Ghi.gif"
                                OnClick="imgbtLuuSua_Click" Visible="False" />
                            <asp:ImageButton ID="imgbtLuuThem" runat="server" ImageUrl="~/Hinh/Them.gif"
                                OnClick="imgbtLuuThem_Click" />
                        </td>
                        <td class="style10">
                            <asp:Label ID="lbMaTin" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                            <asp:Label ID="lbThongBao" runat="server" ForeColor="#CC0000"></asp:Label>

                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<div style="background-color: #fff; padding: 10px;">
    <asp:GridView ID="gvLoaiTin" runat="server" AutoGenerateColumns="False"
        class="table-congbothongtin" OnRowDataBound="gvLoaiTin_RowDataBound" OnSelectedIndexChanged="gvLoaiTin_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="MATIN" HeaderText="Mã Tin">
                <HeaderStyle CssClass="hidden" />
                <ItemStyle CssClass="hidden" />
            </asp:BoundField>
            <asp:BoundField DataField="NgayDang" HeaderText="Ngày giờ <br /> đăng tin" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề tin" />
            <asp:TemplateField HeaderText="Đính kèm">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDownload" CommandArgument='<%# Eval("FileScan") %>' runat="server">
                        <asp:Image ID="imgFileScan" runat="server" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sửa">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkedit" runat="server" OnClick="lnkedit_Click">Sửa bài viết</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Xóa">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click"><img src="../Hinh/pic_trash.gif" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td style="padding-top: 10px">
                <%--<asp:BoundField DataField="ChiTiet" HeaderText="ChiTiet"  />--%>
                <table cellpadding="0" border="0" class="phantrang">
                    <tr>
                        <td align="right" class="style3" width="20px">
                            <asp:ImageButton ID="ImageButton2" runat="server"
                                ImageUrl="~/Hinh/firstpage.png"
                                OnClick="lbtnFirst_Click" Width="15px" />
                            &nbsp;</td>
                        <td width="10px">
                            <asp:ImageButton ID="ImageButton1" runat="server"
                                ImageUrl="~/Hinh/back.png" OnClick="lbtnPrevious_Click"
                                Width="8px" />
                        </td>
                        <td align="center" valign="middle" width="120px">
                            <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                OnItemDataBound="dlPaging_ItemDataBound">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="20px" width="20px" style="margin: 2px; padding: 2px; text-align: center; vertical-align: middle;">
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
                        <td width="10px">
                            <asp:ImageButton ID="ImageButton3" runat="server"
                                ImageUrl="~/Hinh/next.png" OnClick="lbtnNext_Click"
                                Width="8px" />
                        </td>
                        <td width="20px">
                            <asp:ImageButton ID="ImageButton4" runat="server"
                                ImageUrl="~/Hinh/lastpage.png" OnClick="lbtnLast_Click"
                                Width="15px" />
                        </td>

                    </tr>
                    <tr>
                        <td colspan="5" align="center" style="height: 30px" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblPageInfo" runat="server" Font-Size="12px" ForeColor="#454545"></asp:Label></td>
                    </tr>
                </table>
                <%--<img id="imgFileScan" runat="server" src="../Hinh/att.png" />--%>
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">
    function ConfirmationBox(username) {
        var result = confirm('Bạn có muốn xóa bài viết ' + username);
        if (result) {

            return true;
        }
        else {
            return false;
        }
    }
    //function AppendTime(sender, args) {
    //    var selectedDate = new Date();
    //    selectedDate = sender.get_selectedDate();
    //    var now = new Date();
    //    sender.get_element().value = selectedDate.format("dd/MM/yyyy") + " " + now.format("hh:mm tt");
    //}
</script>
