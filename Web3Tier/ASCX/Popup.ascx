<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popup.ascx.cs" Inherits="Web3Tier.ASCX.Popup" %>
<style>
    .table-congbothongtin
    {
        background: #f5f5f5;
        border-collapse: separate;
        box-shadow: inset 0 1px 0 #fff;
        font-size: 12px;
        line-height: 24px;
        text-align: left;
        width: 100%;
        color: #444;
        font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
        text-shadow: 0 1px 0 #fff;
    }

        .table-congbothongtin a
        {
            text-decoration: none;
            color: #444;
        }

            .table-congbothongtin a:hover
            {
                text-decoration: underline;
            }

        .table-congbothongtin th
        {
            background-color: #444;
            border-left: 1px solid #555;
            border-right: 1px solid #777;
            border-top: 1px solid #555;
            border-bottom: 1px solid #333;
            box-shadow: inset 0 1px 0 #999;
            color: #fff;
            font-weight: bold;
            padding: 10px 15px;
            position: relative;
            text-shadow: 0 1px 0 #000;
            text-align: center;
        }

            .table-congbothongtin th:after
            {
                content: '';
                display: block;
                height: 25%;
                left: 0;
                margin: 1px 0 0 0;
                position: absolute;
                top: 25%;
                width: 100%;
            }

            .table-congbothongtin th:first-child
            {
                border-left: 1px solid #777;
                box-shadow: inset 1px 1px 0 #999;
            }

            .table-congbothongtin th:last-child
            {
                box-shadow: inset -1px 1px 0 #999;
            }

        .table-congbothongtin td
        {
            border-right: 1px solid #fff;
            border-left: 1px solid #e8e8e8;
            border-top: 1px solid #fff;
            border-bottom: 1px solid #e8e8e8;
            padding: 10px 15px;
            position: relative;
            transition: all 300ms;
        }

            .table-congbothongtin td:first-child
            {
                box-shadow: inset 1px 0 0 #fff;
            }

            .table-congbothongtin td:last-child
            {
                border-right: 1px solid #e8e8e8;
                box-shadow: inset -1px 0 0 #fff;
            }

        .table-congbothongtin .tdtime
        {
            width: 100px;
            text-align: center;
        }

        .table-congbothongtin .tdname
        {
            width: 150px;
        }

        .table-congbothongtin .tdtitle
        {
            text-align: justify;
        }

        .table-congbothongtin .tdattact
        {
            text-align: center;
        }

        .table-congbothongtin tr
        {
            background: url(http://jackrugile.com/images/misc/noise-diagonal.png);
        }

            .table-congbothongtin tr:nth-child(odd) td
            {
                background: #f1f1f1 url(http://jackrugile.com/images/misc/noise-diagonal.png);
            }

            .table-congbothongtin tr:last-of-type td
            {
                box-shadow: inset 0 -1px 0 #fff;
            }

                .table-congbothongtin tr:last-of-type td:first-child
                {
                    box-shadow: inset 1px -1px 0 #fff;
                }

                .table-congbothongtin tr:last-of-type td:last-child
                {
                    box-shadow: inset -1px -1px 0 #fff;
                }

    #PopupContainer
    {
        display: none;
        height: 100%;
        left: 0;
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 100000;
        color: #444;
        font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
        line-height: 20px;
    }

    #PopupContentArea
    {
        width: 600px;
        margin-left: auto;
        margin-right: auto;
        height: auto;
        background-color: #ECECEC;
        border: 1px solid #000;
        padding: 10px;
    }

    #popupTitle
    {
        font-size: 14px;
    }

    .filename
    {
        text-decoration: none;
        color: #531E1E;
        font: 13px 'Helvetica Neue', helvetica, arial, sans-serif;
        line-height: 20px;
    }

    .phantrang
    {
        text-align: center;
        width: 300px;
        padding-top: 15px;
    }

    .toptieude
    {
        vertical-align: top;
        text-align: justify;
        line-height: 120%;
    }

    .style3
    {
        width: 90px;
    }

    .normal
    {
        border-style: groove;
        border-width: 1px;
        border-color: #454545;
        font-family: arial;
        color: #454545;
        font-size: 12px;
        line-height: 200%;
    }

    .highlight
    {
        border-style: groove;
        border-width: 1px;
        border-color: #046ec5;
        font-family: arial;
        color: #046ec5;
        font-size: 12px;
        line-height: 200%;
    }

    .tieudetintheoloai
    {
        position: relative;
    }

    .hinhtin
    {
        position: absolute;
        top: 22px;
        left: 0;
    }
</style>
<div style="background-color: #fff; padding: 10px;">
    <asp:GridView ID="gvLoaiTin" runat="server" AutoGenerateColumns="False"
        class="table-congbothongtin">
        <Columns>            
            <asp:TemplateField HeaderText="Đính kèm">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDownload" CommandArgument='<%# Eval("FileScan") %>' runat="server" OnClick="DownloadFile">
                        <asp:Label ID="lblEventTest" runat="server" Text='<%#Bind("FileScan") %>'></asp:Label>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</div>