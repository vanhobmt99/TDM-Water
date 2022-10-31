<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TinChatLuongNuoc.aspx.cs" Inherits="Web3Tier.ASPX.TinChatLuongNuoc" %>

<%@ Register Src="~/ASCX/TinChatLuongNuoc.ascx" TagPrefix="uc1" TagName="TinChatLuongNuoc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:TinChatLuongNuoc2 runat="server" id="TinChatLuongNuoc2" />
</asp:Content>
