<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanTriHinhAnh.aspx.cs" Inherits="Web3Tier.Admin.QuanTriHinhAnh" %>

<%@ Register src="../ASCX/QuanTriHinhAnh.ascx" tagname="QuanTriHinhAnh" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:QuanTriHinhAnh ID="QuanTriHinhAnh1" runat="server" />
    
    </div>
    </form>
</body>
</html>
