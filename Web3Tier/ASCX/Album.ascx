<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Album.ascx.cs" Inherits="Web3Tier.ASCX.Album" %>
<style type="text/css">

    .KhungHinhAnhLon
    {
        background-color: #fff;
        width: 960px;
    }

    .dropdownList 
    {
        border-radius: 4px; 
        height: 25px; 
        margin-left: 20px;
        border: 1px solid #818181;
    }
    .TenHinhAnh
    {
        font: bold 12px Tahoma;
        color: #333;
        text-decoration: none;
        text-align: center;
        display: block;
        line-height: 230%;
    }
    .NgayDang
    {
        font: 11px Tahoma;
        color: #818181;
        text-decoration: none; 
        transition: all 0.3s ease 0s;
    }
     .phantrang
    {
        width:400px;
    }
     .phantrang
    {
        width:400px;
        background-color: white;
        border-bottom-right-radius: 6px;
    }
    .normal { border-style: solid; border-width: 1px; border-color: #7e7e7e; font-family: arial; color: #454545; font-size: 12px; line-height: 180%;}
    .highlight {border-style: solid; border-width: 1px; border-color: #ff7747; font-family: arial;color: #ff4500; font-size: 12px; line-height: 180%;}
</style>

<table cellpadding="0" cellspacing="0" class="KhungHinhAnhLon">
    <tr>
        <td style="padding: 10px;">
            <div>
                Tìm kiếm:
                <asp:DropDownList ID="ddlLoaiHinh" runat="server" AutoPostBack="True" onselectedindexchanged="ddlLoaiHinh_SelectedIndexChanged" CssClass="dropdownList"></asp:DropDownList>
            </div>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 10px; padding-right: 10px">
            <asp:DataList ID="dlHinhAnh" runat="server" RepeatColumns="3" 
                style="text-align: center; background-color: White; width:100%">
                <ItemTemplate>
                    <table cellpadding="0" cellspacing="0" style="padding: 10px; width: 304px; height: 203px;">
                        <tr>
                            <td style="padding: 6px; border: 1px solid #e3e3e3; text-align: center;">
                                <a href='<%# GetRouteUrl("Album", new {maAlbum = Eval("maAlbum")}) %>'><img src='<%# "../HinhAnhHoatDong/"+Eval("link") %>' width="270px" height="180px"/></a>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 8px">
                                <asp:HyperLink ID="HyperLink3" runat="server"
                                    style="font-family: Tahoma; font-size: 13px; color: #333; font-weight: bold; text-decoration: none;"
                                    NavigateUrl='<%# GetRouteUrl("Album", new {maAlbum = Eval("maAlbum")}) %>' 
                                    Text='<%# Eval("tenAlbum") %>'>
                                </asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Tahoma; color: #818181; font-size: 12px; line-height: 180%;">
                                Số lượng ảnh:
                                <asp:Label ID="lbSoLuong" runat="server" Text='<%# Eval("soluong") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Tahoma; color: #818181; font-size: 12px;">
                                Ngày đăng: 
                                <asp:Label ID="lbNgayDang" runat="server" CssClass="NgayDang" Text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td align="right">
            <div>
                <table cellpadding="0" border="0" class="phantrang">
                <tr>
                    <td align="left" width="60px">
                        <span style="font-family: Arial; font-size: 12px; color: #454545; font-weight: bold;">Trang:</span>
                        <asp:Label ID="lblPageInfo" runat="server" Font-Size="12px" ForeColor="#454545"></asp:Label>
                    </td>
                    
                    <td align="right" class="style3" width="20px">
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Hinh/sitecon/firstpage-icon.png"  onclick="lbtnFirst_Click"/>
                    </td>
                    <td width="10px">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Hinh/sitecon/previouspage-icon.png" onclick="lbtnPrevious_Click" />
                    </td>
                    <td align="center" valign="middle" width="120px">
                        <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="20px" width="20px" style="margin: 2px; padding: 2px; text-align:center; vertical-align:middle;">
                                            <asp:LinkButton ID="lnkbtnPaging" runat="server" 
                                                CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" 
                                                style="text-decoration:none; text-align:center;" 
                                                Text='<%# Eval("PageText") %>' Width="20px" Font-Size="12px" onMouseOver="this.className='highlight'" onMouseOut="this.className='normal'"
                                            ></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td width="10px">
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Hinh/sitecon/nextpage-icon.png" OnClick="lbtnNext_Click" />
                    </td>
                    <td width="20px">
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Hinh/sitecon/lastpage-icon.png" OnClick="lbtnLast_Click" />
                    </td>

                </tr>
                </table>
           </div>
        </td>
    </tr>
</table>

