<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_DaiHoiDongCDBT.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_DaiHoiDongCDBT" %>

<%@ Register Src="~/ASCX/CBTT_DaiHoiDongCDBT.ascx" TagPrefix="uc1" TagName="CBTT_DaiHoiDongCDBT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_DaiHoiDongCDBT runat="server" id="CBTT_DaiHoiDongCDBT" />
</asp:Content>
