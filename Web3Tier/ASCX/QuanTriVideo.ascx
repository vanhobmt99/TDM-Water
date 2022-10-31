<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriVideo.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriVideo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
<script type="text/javascript">
    function ConfirmationBox(username) {
        var result = confirm('Bạn có muốn xóa loại video: ' + username);
        if (result) {

            return true;
        }
        else {
            return false;
        }
    }

    function uploadStarted() {
        $get("QuanTriVideo1_imgDisplay").style.display = "none";
    }
    function uploadComplete(sender, args) {
        var imgDisplay = $get("QuanTriVideo1_imgDisplay");
        imgDisplay.src = "images/loader.gif";
        imgDisplay.style.cssText = "";
        var img = new Image();
        img.onload = function () {
            imgDisplay.style.cssText = "height:100px;width:100px";
            imgDisplay.src = img.src;
        };
        img.src = "<%=ResolveUrl(UploadFolderPath) %>" + args.get_fileName(); ;
    }
    $(document).ready(function () {
        $("button").click(function () {
            $("div").toggle();
        });
    });
    </script>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        text-align: center;
    }
    .style3
    {
        width: 177px;
    }
    .style4
    {}
    .hinh
    {
        width:100px;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<table class="style1">
    <tr>
        <td class="style3">
            Tên video hiện trên website:</td>
        <td>
            <asp:TextBox ID="txtTenVideo" runat="server" CssClass="style4" Width="600px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Tên file video:</td>
        <td>
            <asp:TextBox ID="txtLink" runat="server" Width="600px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Poster</td>
        <td align="center">
                Upload hình ảnh:<asp:Image ID="imgLoader" runat="server" ImageUrl="~/Hinh/indicator.gif" /><br /><br />
            <img id="imgDisplay" runat="server" align="middle" alt="" class="hinh" src="" />
            <cc1:AsyncFileUpload OnClientUploadComplete="uploadComplete" runat="server" ID="AsyncFileUpload1"
                 Width="300px" UploaderStyle="Modern" CompleteBackColor="White" UploadingBackColor="#CCFFFF"
                ThrobberID="imgLoader" OnUploadedComplete="FileUploadComplete" 
                    OnClientUploadStarted = "uploadStarted" 
                    CssClass="width:100%!important"/>
            
            </td>
    </tr>
    <tr>
        <td colspan="2">
            Chú ý:
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + Vào <a href="http://video.online-convert.com/convert-to-mp4">
            http://video.online-convert.com/convert-to-mp4</a> để chuyền file video sang 
            định dạng mp4<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + File đưa lên có định dạng mp4.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + Nhập tên file video không cần để đuôi mp4<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + Dùng soft FileZilla đưa lên file video 
            lên host trong folder Movies<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + Nếu tạo folder con trong Movies để phân 
            loại thì tên file video phải theo định dạnh &quot;tên folder con/tên file video&quot;.<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + Khi xóa video ở đây chỉ xóa 
            link, tên, link poster, file videos vẫn tồn tại trên host</td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" />
&nbsp;<asp:Button ID="btnSua" runat="server" Text="Sửa" onclick="btnSua_Click" />
&nbsp;<asp:Button ID="btnLuuSua" runat="server" Text="Lưu" onclick="btnLuuSua_Click" 
                Visible="False" />
        &nbsp;<asp:Button ID="btnHuy" runat="server" onclick="btnHuy_Click" Text="Hủy" 
                Visible="False" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Label ID="lbMaVideo" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
</table>

<asp:GridView ID="gvVideos" runat="server" AutoGenerateColumns="False" 
    onrowdatabound="gvVideos_RowDataBound">
    <Columns>
    <asp:TemplateField HeaderText="STT">  
                    	                    <ItemTemplate>  
                                            <%# Container.DataItemIndex + 1 %>  
                    	                    </ItemTemplate>  
                    </asp:TemplateField>
        <asp:BoundField DataField="MaVideo" HeaderText="Mã Video" />
        <asp:BoundField DataField="TenVideo" HeaderText="Tên video trên WEBSITE - Copy" />
        <asp:BoundField DataField="LinkVideo" HeaderText="Tên file video" />
        <asp:BoundField DataField="PosterVideo" HeaderText="Poster" />
        <asp:TemplateField HeaderText="Chọn">
            <ItemTemplate>
            <asp:LinkButton ID="lnkedit" runat="server" OnClick="lnkedit_Click">Chọn</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Xóa">
            <ItemTemplate>
            <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click">Xóa</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>



