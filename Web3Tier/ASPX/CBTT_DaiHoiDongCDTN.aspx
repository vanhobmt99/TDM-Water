<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_DaiHoiDongCDTN.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_DaiHoiDongCDTN" %>

<%@ Register Src="~/ASCX/CBTT_DaiHoiDongCDTN.ascx" TagPrefix="uc1" TagName="CBTT_DaiHoiDongCDTN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_DaiHoiDongCDTN runat="server" id="CBTT_DaiHoiDongCDTN" />
</asp:Content>
