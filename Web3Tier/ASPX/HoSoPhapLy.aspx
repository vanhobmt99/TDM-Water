<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HoSoPhapLy.aspx.cs" Inherits="Web3Tier.ASPX.HoSoPhapLy" %>
<%@ Register Src="~/ASCX/HoSoPhapLy.ascx" TagPrefix="uc1" TagName="HoSoPhapLy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:HoSoPhapLy runat="server" ID="HoSoPhapLy" />
</asp:Content>



