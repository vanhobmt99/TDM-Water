<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanTriTinCK.aspx.cs" Inherits="Web3Tier.Admin.QuanTriTinCK" %>

<%@ Register Src="~/ASCX/QuanTriTinCK.ascx" TagPrefix="uc1" TagName="QuanTriTinCK" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:QuanTriTinCK runat="server" id="QuanTriTinCK" />
    </div>
    </form>
</body>
</html>
