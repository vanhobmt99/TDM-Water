<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_KetNoiNhaDauTu.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_KetNoiNhaDauTu" %>

<%@ Register Src="~/ASCX/CBTT_KetNoiNhaDauTu.ascx" TagPrefix="uc1" TagName="CBTT_KetNoiNhaDauTu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_KetNoiNhaDauTu runat="server" id="CBTT_KetNoiNhaDauTu" />
</asp:Content>
