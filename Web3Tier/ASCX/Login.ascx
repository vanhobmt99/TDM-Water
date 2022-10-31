<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Web3Tier.ASCX.Login" %>
<script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
<table class="bang" align="center" 
        style="background-image: url('../Hinh/350x203.gif'); height: 203px; width: 346px;"  >
        <tr>
            <td colspan="2" align="center" class="style1" >
                &nbsp;</td>
          
        </tr>
        <tr>
            <td class="style6" align="right">
            </td>
            <td class="style7">
            </td>
        </tr>
        <tr>
            <td class="style4" align="right">
            </td>
            <td align="right" style="padding-right:10px">
                <asp:TextBox ID="txtUserName" runat="server" Width="173px" EnableTheming="True" 
                    Height="22px" style="margin-left: 4px"  
                   ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" class="style5">
                </td>
            <td class="style8" align="right" style="padding-right:10px">
                <asp:TextBox ID="txtPassWord" runat="server" Width="173px" TextMode="Password" Height="22px" style="margin-left: 4px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td colspan="2" align="center">
                <asp:ImageButton ID="imgbtDangNhap" runat="server" ImageUrl="~/Hinh/button.gif" 
                    onclick="imgbtDangNhap_Click" />
                <br />
                
            </td>
        </tr>
    </table>