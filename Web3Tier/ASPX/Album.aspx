<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="Web3Tier.ASPX.Album" %>
<%@ Register src="../ASCX/Album.ascx" tagname="Album" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Album ID="Album1" runat="server" />
</asp:Content>
