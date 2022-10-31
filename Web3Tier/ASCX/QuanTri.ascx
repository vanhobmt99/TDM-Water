<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTri.ascx.cs" Inherits="Web3Tier.ASCX.QuanTri" %>
<style type="text/css">
    .style1
    {
        width: 80%;
    }
</style>

<table cellpadding="0" cellspacing="0" class="style1" align="center" >
    <tr>
        <td style="width:150px">
            Username:&nbsp;</td>
        <td>
            <asp:Label ID="lbUserName" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width:150px">
            Mật khẩu cũ:</td>
        <td>
            <asp:TextBox ID="txtMKcu" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:150px">
            Mật khẩu mới:</td>
        <td>
            <asp:TextBox ID="txtMKmoi" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:150px">
            Nhập lại mật khẩu mới:</td>
        <td>
            <asp:TextBox ID="txtMKlan2" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Button ID="btCapNhatMK" runat="server" Text="Đổi mật khẩu" 
                onclick="btCapNhatMK_Click" />
&nbsp;<asp:Button ID="btQuanTriBaiViet" runat="server" Text="Quản trị bài viết" 
                onclick="btQuanTriBaiViet_Click" />
&nbsp;<asp:Button ID="btQuanTriVideos" runat="server" Text="Quản trị Videos" 
                onclick="btQuanTriVideos_Click" />
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Quản trị yêu cầu liên hệ" 
                onclick="Button1_Click" />
        &nbsp;<asp:Button ID="Button2" runat="server" Text="Quản trị hình ảnh" 
                onclick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Quản trị tin CK" 
                onclick="Button3_Click" />
        </td>
    </tr>
</table>

