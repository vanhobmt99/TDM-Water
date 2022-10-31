<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_ThongTinCoPhieu.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_ThongTinCoPhieu" %>

<%@ Register Src="~/ASCX/CBTT_ThongTinCoPhieu.ascx" TagPrefix="uc1" TagName="CBTT_ThongTinCoPhieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_ThongTinCoPhieu runat="server" id="CBTT_ThongTinCoPhieu" />
</asp:Content>
