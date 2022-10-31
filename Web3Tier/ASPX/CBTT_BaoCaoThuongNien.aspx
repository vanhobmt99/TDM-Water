<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_BaoCaoThuongNien.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_BaoCaoThuongNien" %>

<%@ Register Src="~/ASCX/CBTT_BaoCaoThuongNien.ascx" TagPrefix="uc1" TagName="CBTT_BaoCaoThuongNien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_BaoCaoThuongNien runat="server" id="CBTT_BaoCaoThuongNien" />
</asp:Content>
