<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="Web3Tier.ASPX.LienHe" %>
<%@ Register src="../ASCX/LienHe.ascx" tagname="LienHe" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LienHe ID="LienHe1" runat="server" />
</asp:Content>
