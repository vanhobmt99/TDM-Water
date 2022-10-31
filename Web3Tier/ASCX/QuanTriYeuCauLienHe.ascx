<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriYeuCauLienHe.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriYeuCauLienHe" %>
<style type="text/css">

    .style1
    {
        width: 100%;
    }
    </style>

<table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td colspan="2" style="text-align: center;">
            <strong>XỬ LÝ YÊU CẦU LIÊN HỆ</strong></td>
    </tr>
    <tr>
        <td style="width:80px">
            Họ tên:</td>
        <td>
            <asp:TextBox ID="txtHoTen" runat="server" ReadOnly="True" Width="800px"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Địa chỉ:</td>
        <td>
            <asp:TextBox ID="txtDiaChi" runat="server" ReadOnly="True" Width="800px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Điện thoại:</td>
        <td>
            <asp:TextBox ID="txtDienThoai" runat="server" ReadOnly="True" Width="800px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Email:</td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" Width="800px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Yêu cầu:</td>
        <td>
            <asp:TextBox ID="txtYeuCau" runat="server" ReadOnly="True" TextMode="MultiLine" 
                Width="800px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Ngày gửi yêu cầu</td>
        <td>
            <asp:TextBox ID="txtNgayGui" runat="server" ReadOnly="True" Width="800px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Nội dung xử lý</td>
        <td>
            <asp:TextBox ID="txtXuLy" runat="server" TextMode="MultiLine" Width="800px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:80px">
            Trạng thái xử lý</td>
        <td style="width:80px">
            <asp:CheckBox ID="ckbXuLy" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Xử lý" />
            &nbsp;<asp:Button ID="btExcel" runat="server" OnClick="ExportToExcel" 
                Text="Xuất ra Excel" />
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="true" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                OnPageIndexChanging="OnPageIndexChanging" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
            <%# Container.DataItemIndex + 1 %>  
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Mayeucau" HeaderStyle-CssClass="Hide" 
                        HeaderText="MaYeuCau" ItemStyle-CssClass="Hide">
                    <HeaderStyle CssClass="Hide" />
                    <ItemStyle CssClass="Hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HoTen" HeaderText="Họ tên KH" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
        <%--<asp:BoundField DataField="YeuCau" HeaderText="Yêu cầu" />--%>

                    <asp:TemplateField HeaderText="Yêu cầu">
                        <ItemTemplate>
                <%# ((string)Eval("YeuCau")).Length < 50 ? Eval("YeuCau") : ((string)Eval("YeuCau")).Substring(0, 50) + "..."%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NgayGui" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày Gửi" />
                    <asp:BoundField DataField="NoiDungXuLy" HeaderText="Nội dung xử lý" />
                    <asp:BoundField DataField="Ngayxuly" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày xử lý" />
                    <asp:CheckBoxField DataField="Xuly" HeaderText="Trạng thái xử lý" />
                    <asp:TemplateField HeaderText="Chọn">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkedit" runat="server" OnClick="lnkedit_Click">Chọn</asp:LinkButton>
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
        </td>
    </tr>
    <tr>
        <td colspan="2" style="display:none">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="true" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                OnPageIndexChanging="OnPageIndexChanging" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
            <%# Container.DataItemIndex + 1 %>  
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Mayeucau" HeaderStyle-CssClass="Hide" 
                        HeaderText="MaYeuCau" ItemStyle-CssClass="Hide">
                    <HeaderStyle CssClass="Hide" />
                    <ItemStyle CssClass="Hide" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HoTen" HeaderText="Họ tên KH" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="YeuCau" HeaderText="Yêu cầu" />

        <%--<asp:TemplateField HeaderText="Yêu cầu">
            <ItemTemplate>
                <%# ((string)Eval("YeuCau")).Length < 50 ? Eval("YeuCau") : ((string)Eval("YeuCau")).Substring(0, 50) + "..."%>
            </ItemTemplate>
        </asp:TemplateField>--%>

                    <asp:BoundField DataField="NgayGui" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày Gửi" />
                    <asp:BoundField DataField="NoiDungXuLy" HeaderText="Nội dung xử lý" />
                    <asp:BoundField DataField="Ngayxuly" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày xử lý" />
                    <asp:CheckBoxField DataField="Xuly" HeaderText="Trạng thái xử lý" />
                    <asp:TemplateField HeaderText="Chọn">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkedit0" runat="server" OnClick="lnkedit_Click">Chọn</asp:LinkButton>
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
        </td>
    </tr>
</table>

