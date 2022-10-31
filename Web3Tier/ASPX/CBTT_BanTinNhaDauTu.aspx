<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="" Inherits="Web3Tier.ASPX.CBTT_BanTinNhaDauTu" %>

<%@ Register Src="~/ASCX/CBTT_BanTinNhaDauTu.ascx" TagPrefix="uc1" TagName="CBTT_BanTinNhaDauTu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_BanTinNhaDauTu runat="server" id="CBTT_BanTinNhaDauTu" />
</asp:Content>
