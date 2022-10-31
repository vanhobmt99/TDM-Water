<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup.aspx.cs" Inherits="Web3Tier.ASPX.Popup" %>

<%@ Register src="../ASCX/Popup.ascx" tagname="Popup" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:Popup ID="Popup1" runat="server" />
    
    </div>
    </form>
</body>
</html>
