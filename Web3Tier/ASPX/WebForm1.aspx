<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web3Tier.ASPX.WebForm1" %>

<%@ Register Src="~/ASCX/Linhvuckinhdoanh.ascx" TagPrefix="uc1" TagName="Linhvuckinhdoanh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Linhvuckinhdoanh runat="server" ID="Linhvuckinhdoanh" />
</asp:Content>
