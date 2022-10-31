<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_ThongTinNhaDauTu.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_ThongTinNhaDauTu" %>

<%@ Register Src="~/ASCX/CBTT_ThongTinNhaDauTu.ascx" TagPrefix="uc1" TagName="CBTT_ThongTinNhaDauTu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_ThongTinNhaDauTu runat="server" id="CBTT_ThongTinNhaDauTu" />
</asp:Content>
