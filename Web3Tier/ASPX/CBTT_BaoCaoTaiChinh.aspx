<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBTT_BaoCaoTaiChinh.aspx.cs" Inherits="Web3Tier.ASPX.CBTT_BaoCaoTaiChinh" %>

<%@ Register Src="~/ASCX/CBTT_BaoCaoTaiChinh.ascx" TagPrefix="uc1" TagName="CBTT_BaoCaoTaiChinh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CBTT_BaoCaoTaiChinh runat="server" id="CBTT_BaoCaoTaiChinh" />
</asp:Content>
