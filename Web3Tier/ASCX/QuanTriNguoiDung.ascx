<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriNguoiDung.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriNguoiDung" %>
<style type="text/css">
    .style1
    {
        width: 50%;
    }
</style>
<script type="text/javascript">
    function ConfirmationBox() {

        var result = confirm('Bạn có muốn xóa tài khoản');
        if (result) {

            return true;
        }
        else {
            return false;
        }
    }
</script>
<table cellpadding="0" cellspacing="0" class="style1" align="center" >
    <tr>
        <td style="width:150px">
            Username:&nbsp;</td>
        <td>
            <asp:DropDownList ID="ddlUserName" runat="server">
            </asp:DropDownList>
            <asp:TextBox ID="txtUserName" runat="server" Visible="False"></asp:TextBox>
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
            <asp:Button ID="Reset" runat="server" Text="Reset" 
                onclick="btCapNhatMK_Click" />
        &nbsp;<asp:Button ID="btThem" runat="server" onclick="btThem_Click" Text="Thêm" />
&nbsp;<asp:Button ID="btLuu" runat="server" onclick="btLuu_Click" Text="Lưu" />
        &nbsp;<asp:Button ID="btnXoa" runat="server" onclick="btnXoa_Click" Text="Xóa" OnClientClick="ConfirmationBox()" />
        </td>
    </tr>
</table>

