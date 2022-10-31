<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriHinhAnh.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriHinhAnh1" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<script type="text/javascript">
    function ConfirmationBox(username) {
        var result = confirm('Bạn có muốn xóa bài viết ' + username);
        if (result) {

            return true;
        }
        else {
            return false;
        }
    }
    </script>
<table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td>
            Album:</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Uploads hình</td>
        <td>
            <div>
                <asp:FileUpload runat="server" ID="UploadImages" AllowMultiple="true" />
                <%--<input type="file" multiple="multiple" name="UploadImages" id="FileUpload1" />--%>
                <asp:Button runat="server" ID="uploadedFile" Text="Upload" OnClick="uploadFile_Click" />
                <br />
                <asp:Label ID="listofuploadedfiles" runat="server" />
            </div>
        </td>
    </tr>
</table>

<asp:GridView ID="GridView1" runat="server" CellPadding="4" 
    EnableModelValidation="False" ForeColor="#333333" 
    AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="STT">  
            <ItemTemplate>  
            <%# Container.DataItemIndex + 1 %>  
            </ItemTemplate>  
        </asp:TemplateField>
        <asp:BoundField DataField="MaHinhAnh" HeaderText="Mã hình ảnh" />
        <asp:BoundField DataField="link" HeaderText="Tên ảnh" />
        <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                        <asp:LinkButton ID="lnkdeleteLA" runat="server" OnClick="lnkdeleteLA_Click">Xóa</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>


