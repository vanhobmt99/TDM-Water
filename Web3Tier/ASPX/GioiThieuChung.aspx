<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GioiThieuChung.aspx.cs" Inherits="Web3Tier.ASPX.BanLanhDao" %>

<%@ Register Src="~/ASCX/GioiThieuChung.ascx" TagPrefix="uc1" TagName="GioiThieuChung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:GioiThieuChung runat="server" ID="GioiThieuChung" />
</asp:Content>
