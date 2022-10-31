<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="Web3Tier.ASPX.ChiTietTinTuc" %>
<%@ Register src="../ASCX/ChiTietTin.ascx" tagname="ChiTietTin" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ChiTietTin ID="ChiTietTin1" runat="server" />
</asp:Content>
