<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThongBao.aspx.cs" Inherits="Web3Tier.ASPX.ThongBao" %>
<%@ Register src="../ASCX/ThongBao.ascx" tagname="ThongBao" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ThongBao ID="ThongBao1" runat="server" />
</asp:Content>
