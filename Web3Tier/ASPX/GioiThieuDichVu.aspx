<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GioiThieuDichVu.aspx.cs" Inherits="Web3Tier.ASPX.BanLanhDao" %>

<%@ Register Src="~/ASCX/GioiThieuDichVu.ascx" TagPrefix="uc1" TagName="GioiThieuDichVu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:GioiThieuDichVu runat="server" ID="GioiThieuDichVu" />
</asp:Content>
