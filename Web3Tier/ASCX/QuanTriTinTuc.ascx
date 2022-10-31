<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriTinTuc.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriTinTuc" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .hidden
    {
    display:none;
    
    }
    .hinh
    {
        width:100px;
    }
</style>
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
    function XoaLoaiTin(username) {

        var result = confirm('Bạn có muốn xóa loại tin ' + username);
        if (result) {

            return true;
        }
        else {
            return false;
        }
    }

    $(function () {
        CKEDITOR.replace('<%=CKEditor1.ClientID %>',
  { filebrowserImageUploadUrl: '/WEBSITE - Copy/Upload.ashx' }); //path to “Upload.ashx”
    });
    function uploadError(sender, args) {
        addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
    }
    function uploadStarted() {
        $get("QuanTriTinTuc1_img").style.display = "none";
    }
    function uploadComplete(sender, args) {
        var img1 = $get("QuanTriTinTuc1_img");
        var img = new Image();
        img.onload = function () {
            img1.style.cssText = "height:100px;width:100px";
            img1.src = img.src;
        };
        img.src = "<%=ResolveUrl(UploadFolderPath) %>" + args.get_fileName();
        
    }
    $(document).ready(function () {
        $("button").click(function () {
            $("div").toggle();
        });
        
    });
    </script>
<table id="suatin" runat="server" visible="true" width="100%">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td class="style5">
                                                Loại tin:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlLoaiTinMaTin" runat="server" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="style5">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Ngôn ngữ</td>
                                            <td>
                                                <asp:DropDownList ID="ddlNgonNgu" runat="server" AutoPostBack="True">
                                                    <asp:ListItem Value="False">Tiếng Việt</asp:ListItem>
                                                    <asp:ListItem Value="True">English</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <table>
                                            <tr>
                                                <td class="style6">
                                                    Tiêu đề:</td>
                                                <td>
                                                    <asp:TextBox ID="TxtTieuDe" runat="server" Width="500px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <table width="100%">
                                            <tr>
                                                <td align="center">
                                                    Upload hình ảnh:<asp:Image ID="imgLoader" runat="server" 
                                                        ImageUrl="~/Hinh/indicator.gif" />
                                                    <br />
                                                    <br />
                                                    <img id="img" align="middle" alt="" class="hinh" src="" runat="server"/>
                                                    <cc1:AsyncFileUpload ID="AsyncFileUpload1" runat="server"
                                                        CompleteBackColor="White" CssClass="width:100%!important" 
                                                        OnClientUploadComplete="uploadComplete" OnClientUploadStarted="uploadStarted" 
                                                        OnUploadedComplete="FileUploadComplete" ThrobberID="imgLoader" 
                                                        UploaderStyle="Modern" UploadingBackColor="#CCFFFF" Width="300px" />
                                                    <br />
                                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                                        Text="Xóa hình" />
                                                    <asp:Label ID="lbHinhAnh" runat="server" Visible="False"></asp:Label>
                                                </td>
                                                <td class="style1" width="100%">
                                                    Trích yếu:<br />
                                                    <asp:TextBox ID="TxtBanTinTomTat" runat="server" Height="121px" 
                                                        TextMode="MultiLine" Width="100%"></asp:TextBox>
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
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        &nbsp;<table class="style2">
                                            <tr>
                                                <td class="style3">
                                                    Ngày đăng:</td>
                                                <td>
                                                    <asp:TextBox ID="txtNgayDang" runat="server" Height="25px" ReadOnly="True" 
                                                        style="resize:none" 
                                                        text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>' 
                                                        TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                                    <div>
                                        <table class="style2">
                                            <tr>
                                                <td class="style7">
                                                    <asp:ImageButton ID="imgbtThem" runat="server" ImageUrl="~/Hinh/Them.gif" 
                                                        onclick="imgbtThem_Click" Visible="False"/>
                                                    <asp:ImageButton ID="imgbtLuuSua" runat="server" ImageUrl="~/Hinh/Ghi.gif" 
                                                        onclick="imgbtLuuSua_Click" Visible="False" />
                                                    <asp:ImageButton ID="imgHienLuoi" runat="server" ImageUrl="~/Hinh/Tim.gif" 
                                                        onclick="imgHienLuoi_Click"/>
                                                    <asp:ImageButton ID="imgbtLuuThem" runat="server" ImageUrl="~/Hinh/Ghi.gif" 
                                                        onclick="imgbtLuuThem_Click"/>
                                                    <asp:Button ID="btThemLT" runat="server" Text="Thêm loại tin" 
                                                        onclick="btThemLT_Click" />
                                                </td>
                                                <td class="style10">
                                                    <asp:Label ID="lbMaTin" runat="server" ForeColor="Red"></asp:Label>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
<table id="LuoiLoaiTin" runat="server" visible="false">
    <tr>
        <td>
        Tên loại tin: 
            <asp:TextBox ID="txtLoaiTin" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
        <asp:GridView ID="gvLoaiTin" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" onrowdatabound="gvLoaiTin_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                     <asp:TemplateField HeaderText="STT">  
                    	                    <ItemTemplate>  
                                            <%# Container.DataItemIndex + 1 %>  
                    	                    </ItemTemplate>  
                        </asp:TemplateField>
                        <asp:BoundField DataField="maloai" HeaderText="Mã Loại" ShowHeader="False"> 
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MaLOAI" HeaderText="Mã loại" />
                        <asp:BoundField DataField="LOAI" HeaderText="Loại tin" />
                        <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                        <asp:LinkButton ID="lnkdeleteLT" runat="server" OnClick="lnkdeleteLT_Click">Xóa</asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
        </td>
    </tr>
</table>
<table id="LuoiQuanTriTinTuc" runat="server">
    <tr>
        <td>
            <div>
        Loại tin:
            <asp:DropDownList ID="ddlLoaiTin" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlLoaiTin_SelectedIndexChanged" >
            </asp:DropDownList>

<asp:GridView ID="gvTinTuc" runat="server" CellPadding="4" ForeColor="#333333" 
                AutoGenerateColumns="False" onrowdatabound="gvTinTuc_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">  
                    	                    <ItemTemplate>  
                                            <%# Container.DataItemIndex + 1 %>  
                    	                    </ItemTemplate>  
                    </asp:TemplateField>
                    <asp:BoundField DataField="MATIN" HeaderText="Mã Tin"> 
                    <HeaderStyle CssClass="hidden" />
                    <ItemStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Tiêu đề" DataField="TIEUDE" />
                    <asp:BoundField DataField="BANTINTOMTAT" HeaderText="Tóm Tắt" />
                    <asp:BoundField DataField="NGAYDANG" HeaderText="Ngày Đăng"  DataFormatString="{0:dd/MM/yyyy}"   />
                    <asp:TemplateField HeaderText="Sửa">
                        <ItemTemplate>
                        <asp:LinkButton ID="lnkedit" runat="server" OnClick="lnkedit_Click">Sửa bài viết</asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                     <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" runat="server"  OnClick="lnkdelete_Click">Xóa bài viết</asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </div>
        </td>
    </tr>
</table>