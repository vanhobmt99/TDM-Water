<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BanLanhDao.aspx.cs" Inherits="Web3Tier.ASPX.BanLanhDao" %>

<%@ Register Src="~/ASCX/BanLanhDao.ascx" TagPrefix="uc1" TagName="BanLanhDao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:BanLanhDao runat="server" ID="BanLanhDao" />
</asp:Content>
