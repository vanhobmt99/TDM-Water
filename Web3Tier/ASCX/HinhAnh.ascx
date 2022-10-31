<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HinhAnh.ascx.cs" Inherits="Web3Tier.ASCX.HinhAnh" %>
<link rel="shortcut icon" href="img/demopage/favicon.png">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Karla%7CMontserrat">
<link href="../CSS/lightbox1.css" rel="stylesheet" />
<link href="../CSS/screen1.css" rel="stylesheet" />
<script src="../js/jquery-1.11.0.min.js"></script>
<script src="../js/lightbox.min.js"></script>
<style type="text/css">

    .KhungHinhAnhLon
    {
        background-color: #FFF;
        width: 960px;
        
    }
    .dropdownList 
    {
        border-radius: 4px; 
        height: 25px; 
        margin-left: 10px;
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
        width: 400px;
    }
    .normal { border-style: solid; border-width: 1px; border-color: #7e7e7e; font-family: arial; color: #454545; font-size: 12px; line-height: 180%;}
    .highlight {border-style: solid; border-width: 1px; border-color: #ff7747; font-family: arial;color: #ff4500; font-size: 12px; line-height: 180%;}
    #lightbox
    {
        display:none;
    }
    #ContentPlaceHolder1_HinhAnh1_dlHinhAnh
    {
        border-top-left-radius: 6px;border-top-right-radius: 6px;
        border-bottom-left-radius: 6px;border-bottom-right-radius: 6px;
    }
</style>

<table cellpadding="0" cellspacing="0" class="KhungHinhAnhLon">
    <tr>
        <td style="padding: 10px;">
            <asp:DataList ID="dlHinhAnh" runat="server" RepeatColumns="3" 
                style="text-align: center; background-color: White; width: 100%">
                <ItemTemplate>
                    <table cellpadding="0" cellspacing="0" style="padding: 10px;">
                        <tr>
                            <td style="padding: 3px; border: 1px solid #e3e3e3; text-align: center;">
                                <a class="example-image-link" href='<%# "../HinhAnhHoatDong/"+Eval("link") %>' data-lightbox="example-set" data-title='<%# Eval("albumLink") %>'>
                                <img class="example-image" src='<%# "../HinhAnhHoatDong/"+Eval("link") %>' alt=""/></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
   
</table>


