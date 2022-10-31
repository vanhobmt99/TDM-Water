<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanTriAlbum.ascx.cs" Inherits="Web3Tier.ASCX.QuanTriHinhAnh" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
<script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 26px;
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
    function uploadStarted() {
        var imgDisplay = $get("imgDisplay");
        alert(imgDisplay);
        $get("imgDisplay").style.display = "none";
    }
    function uploadComplete(sender, args) {
        var imgDisplay = $get("imgDisplay");
        imgDisplay.src = "images/loader.gif";
        imgDisplay.style.cssText = "";
        var img = new Image();
        img.onload = function () {
            imgDisplay.style.cssText = "height:100px;width:100px";
            imgDisplay.src = img.src;
            $get("QuanTriHinhAnh1_img1").style.display = "none";
        };
        img.src = "<%=ResolveUrl(UploadFolderPath) %>" + args.get_fileName(); ;
    }


    function showimages(files) {
        alert('123');
        for (var i = 0, f; f = files[i]; i++) {
            $('#filesSize').append(f.name + ' - ' + f.size + '<br />');

            var reader = new FileReader();
            reader.onload = function (evt) {
                var img = '<img src="' + evt.target.result + '"/>';
                $('#images').append(img);
            }
            reader.readAsDataURL(f);
        }
    }

    $('#FileUpload1').change(function (evt) {
        showimages(evt.target.files);
    });
    </script>

<table id="HinhAnh" runat="server" cellpadding="0" cellspacing="0" class="style1" >
    <tr>
        <td class="style2">
            Loại hình ảnh:</td>
        <td class="style2">
            <asp:DropDownList ID="ddlLoaiHinh" runat="server">
            </asp:DropDownList>
            <asp:Label ID="lbMaHinhAnh" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Ngôn ngữ:</td>
        <td class="style2">
                                                <asp:DropDownList ID="ddlNgonNgu" runat="server" AutoPostBack="True">
                                                    <asp:ListItem Value="False">Tiếng Việt</asp:ListItem>
                                                    <asp:ListItem Value="True">English</asp:ListItem>
                                                </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Tên album:</td>
        <td>
            <asp:TextBox ID="txtTenHinh" runat="server" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            Upload ảnh đại diện:<asp:Image ID="imgLoader" runat="server" 
                ImageUrl="~/Hinh/indicator.gif" />
            <br />
            <br />
            <img id="imgDisplay" align="middle" alt="" class="hinh" src=""/>
            <img id="img1" align="middle" alt="" class="hinh" src="" runat="server" visible="false"/>
            <cc1:AsyncFileUpload ID="AsyncFileUpload1" runat="server"
                CompleteBackColor="White" CssClass="width:100%!important" 
                OnClientUploadComplete="uploadComplete" OnClientUploadStarted="uploadStarted" 
                OnUploadedComplete="FileUploadComplete" ThrobberID="imgLoader" 
                UploaderStyle="Modern" UploadingBackColor="#CCFFFF" Width="300px" />
            <br />
            <asp:Label ID="lbHinhAnh" runat="server"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Ngày đăng:</td>
        <td>
            <asp:TextBox ID="txtNgayDang" runat="server" Height="25px" ReadOnly="True" 
                style="resize:none" 
                text='<%# Convert.ToDateTime(Eval("ngaydang")).ToString("dd/MM/yyyy") %>' 
                TextMode="MultiLine" Width="200px"></asp:TextBox>
            <cc1:CalendarExtender ID="txtNgayDang_CalendarExtender" runat="server" 
                DaysModeTitleFormat="dd,MM,yyyy" Format="dd/MM/yyyy" PopupButtonID="Image1" 
                PopupPosition="Right" SelectedDate="<%# DateTime.Now %>" 
                TargetControlID="txtNgayDang" TodaysDateFormat="dd,MM,yyyy">
            </cc1:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
             <asp:ImageButton ID="imgbtThem" runat="server" ImageUrl="~/Hinh/Them.gif" 
                onclick="imgbtThem_Click" Visible="False"/>
            <asp:ImageButton ID="imgbtLuuSua" runat="server" ImageUrl="~/Hinh/Ghi.gif" 
                onclick="imgbtLuuSua_Click" Visible="False" />
            <asp:ImageButton ID="imgbtLuuThem" runat="server" ImageUrl="~/Hinh/Ghi.gif" 
                onclick="imgbtLuuThem_Click"/>
            <asp:Button ID="btThemLA" runat="server" Text="Thêm loại ảnh" 
                onclick="btThemLA_Click" />
             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Post Hình" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
             <asp:Label ID="lbThongBao" runat="server"></asp:Label>
        </td>
    </tr>
</table>



<table id="tbLoaiHinhAnh" runat="server" cellpadding="0" cellspacing="0" class="style1" visible="false">
    <tr>
        <td>
            Loại hình ành:
            <asp:TextBox ID="txtLoaiHinhAnh" runat="server"></asp:TextBox>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvLoaiHinhAnh" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" EnableTheming="True" ForeColor="#333333" 
                onrowdatabound="gvLoaiHinhAnh_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">  
                        <ItemTemplate>  
                        <%# Container.DataItemIndex + 1 %>  
                        </ItemTemplate>  
                    </asp:TemplateField>
                    <asp:BoundField DataField="maloaihinhanh" HeaderText="Mã loại" />
                    <asp:BoundField DataField="loai" HeaderText="Tên loại" />
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                        <asp:LinkButton ID="lnkdeleteLT" runat="server" OnClick="lnkdeleteLA_Click">Xóa</asp:LinkButton>
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
<configuration>
  <connectionStrings>
    <remove name="LocalSqlServer"/>
    <add name="MyConnectionString" connectionString="Persist Security Info=True;    Initial Catalog=website;     User ID=biwase;     Password=B@456789;     Data Source=.;"/>
    <!--<add name="MyConnectionString" connectionString="Server=113.161.162.95\SQLEXPRESS;Database=WEBBIWASE;User ID=sa;Password=123;"/>-->
  </connectionStrings>
  <!--
    For a description of web.config changes for .NET 4.5 see http://go.microsoft.com/fwlink/?LinkId=235367.

    The following attributes can be set on the <httpRuntime> tag.
      <system.Web>
        <httpRuntime targetFramework="4.5" />
      </system.Web>
  -->
  <system.web>
    <compilation debug="true" targetFramework="4.5">
      <assemblies>
        <add assembly="System.Web.Extensions.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
      </assemblies>
    </compilation>
    <!--<authentication mode="Forms">
      <forms loginUrl="~/Account/Login.aspx" timeout="2880" />
    </authentication>
    <membership>
      <providers>
        <clear />
        <add name="AspNetSqlMembershipProvider" type="System.Web.Security.SqlMembershipProvider" connectionStringName="ApplicationServices" enablePasswordRetrieval="false" enablePasswordReset="true" requiresQuestionAndAnswer="false" requiresUniqueEmail="false" maxInvalidPasswordAttempts="5" minRequiredPasswordLength="6" minRequiredNonalphanumericCharacters="0" passwordAttemptWindow="10" applicationName="/" />
      </providers>
    </membership>
    <profile>
      <providers>
        <clear />
        <add name="AspNetSqlProfileProvider" type="System.Web.Profile.SqlProfileProvider" connectionStringName="ApplicationServices" applicationName="/" />
      </providers>
    </profile>
    <roleManager enabled="false">
      <providers>
        <clear />
        <add name="AspNetSqlRoleProvider" type="System.Web.Security.SqlRoleProvider" connectionStringName="ApplicationServices" applicationName="/" />
        <add name="AspNetWindowsTokenRoleProvider" type="System.Web.Security.WindowsTokenRoleProvider" applicationName="/" />
      </providers>
    </roleManager>-->
    <pages validateRequest="false" enableEventValidation="false" controlRenderingCompatibilityVersion="4.0"/>
    <httpRuntime requestValidationMode="2.0"/>
    <customErrors defaultRedirect="biwase.com.vn" mode="Off"/>
  </system.web>
  <system.webServer>
    <modules runAllManagedModulesForAllRequests="true"/>
    <directoryBrowse enabled="true"/>
    <defaultDocument>
      <files>
        <add value="qlchung/index.aspx"/>
      </files>
    </defaultDocument>
    <httpErrors errorMode="Detailed"/>
  </system.webServer>
</configuration>
        </td>
    </tr>
</table>


<table id=tbhinhanh">
<tr>
<td>
<asp:GridView ID="gvAlbum" runat="server" CellPadding="4" ForeColor="#333333" 
    AutoGenerateColumns="False" onrowdatabound="gvAlbum_RowDataBound">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="STT">  
            <ItemTemplate>  
            <%# Container.DataItemIndex + 1 %>  
            </ItemTemplate>  
        </asp:TemplateField>
        <asp:BoundField DataField="Maalbum" HeaderText="Mã hình ảnh" />
        <asp:BoundField DataField="TenAlbum" HeaderText="Tên Album" />
        <asp:BoundField DataField="Link" HeaderText="Ảnh đại diện" />
        <asp:BoundField DataField="ngaydang" HeaderText="Ngày đăng" DataFormatString="{0:dd/MM/yyyy}" />
        <asp:TemplateField HeaderText="Sửa">
            <ItemTemplate>
            <asp:LinkButton ID="lnkedit" runat="server" OnClick="lnkedit_Click">Sửa album</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Xóa">
            <ItemTemplate>
            <asp:LinkButton ID="lnkdeleteLT" runat="server" OnClick="lnkdeleteHA_Click">Xóa</asp:LinkButton>
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

