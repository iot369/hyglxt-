<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meminput.aspx.cs" Inherits="meminput" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
        <link href="../images/style.css" rel="stylesheet" type="text/css" />
        <link href="../css/forms.css" rel="stylesheet" type="text/css" />

        <script src="../js/jsAddress.js" type="text/javascript"></script>

        <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <%-- <link href="../lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />--%>

        <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script type="text/javascript">
        function daoru() {
                if ($("#txtBName").val()!=""&& $("#FileUpload1").val()!=""&&$("#ddllevel").val()!="NONE"&&$("#ddlmakecard").val()!="NONE") 
                {
                    $.ligerDialog.confirm('你确定要导入会员信息吗',
                        function(type) {
                        if (type)ll();               
                    });
                } else {
                    f_alert2('warn', '请完整填写必要信息！');
                }

            }
        function ll()
        {
            document.getElementById("Button2").click();
       
            
        }
        </script>
</head>
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <div class="divall">
        <div class="divgirdtop" style="margin-top: 5px;">
            <img src="../images/ico-show-txt.png" />会员资料导入
        </div>
        <table class="addedit">
            <tr>
                <th>
                    导入模板下载：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <a href="会员资料导入模板.xls">下载模版</a> 【<font style="color: #FF0000">注意:请按照模板字段导入数据，不能修改表格字段，否则数据导入出错</font>】
                </td>
            </tr>
            <tr>
                <th>
                    上传导入文件：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txtInput" />
                </td>
            </tr>
            <tr>
                <th>
                    数据表：
                </th>
                <td>
                    <asp:TextBox ID="txtBName" CssClass="txtInput" runat="server" Text="Sheet1" Width="124px"></asp:TextBox>【<font
                        style="color: #FF0000">*Excel文件左下角</font>】
                </td>
            </tr>
            <tr>
                <th>
                    会员级别：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <asp:DropDownList ID="ddllevel" runat="server" Style="width: 138px;" CssClass="select">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    导入人员：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <asp:DropDownList ID="ddlmakecard" runat="server" Style="width: 138px;" CssClass="select">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <div class="divgirdbottom">
            <input id="Button1" type="button" value="导 入" class=" btnSubmit" onclick="daoru();" />
        </div>
        <div style="display: none;">
            <asp:Button ID="Button2" runat="server" Text="导 入" CssClass="btnSubmit" OnClick="Button2_Click" />
        </div>
    </div>
    </form>
</body>
</html>
