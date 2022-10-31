<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CongBoThongTin.aspx.cs" Inherits="Web3Tier.ASPX.WebForm2" %>

<%@ Register Src="~/ASCX/CongBoThongTin.ascx" TagPrefix="uc1" TagName="CongBoThongTin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CongBoThongTin runat="server" id="CongBoThongTin" />
</asp:Content>
