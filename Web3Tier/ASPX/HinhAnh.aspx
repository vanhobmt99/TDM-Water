<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HinhAnh.aspx.cs" Inherits="Web3Tier.ASPX.HinhAnh" %>
<%@ Register src="../ASCX/HinhAnh.ascx" tagname="HinhAnh" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:HinhAnh ID="HinhAnh1" runat="server" />
</asp:Content>
