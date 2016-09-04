<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consumeview.aspx.cs" Inherits="consumeview" %>

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
    <%--  <link href="../lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />--%>

    <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

    <script src="../js/Public.js" type="text/javascript"></script>

    <script type="text/javascript">
 
   
  

    function addmem() {
        if ($("#txtnum").val()!=""&&$("#ddltype").val()!="NONE"&&$("#txtprice").val()!=""&&$("#txtname").val()!="") 
        {
            $.ligerDialog.confirm('你确定要保存消费项目信息吗',
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
        window.parent.lload();   
    }
    

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div class="divgirdtop">
            <img src="../images/ico-show-txt.png" />编辑消费项目
        </div>
        <table class="addedit">
            <tr>
                <th>
                    编码：
                </th>
                <td>
                    <input id="txtnum" disabled="disabled" type="text" class="txtInput2" style="width: 100px;"
                        onchange="checkmemnum();" runat="server" /><span class="spanxing">*</span>
                </td>
                <th>
                    名称：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    销售价格：
                </th>
                <td>
                    <input id="txtprice" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                        runat="server" />
                </td>
                <th>
                    所属类别：
                </th>
                <td>
                    <asp:DropDownList ID="ddltype" runat="server" Style="width: 108px;" CssClass="select">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    进货价格：
                </th>
                <td>
                    <input id="txtinprice" type="text" class="txtInput2" style="width: 100px;" runat="server" />
                </td>
                <th>
                    初始库存：
                </th>
                <td>
                    <input id="txtcount" type="text" class="txtInput2" style="width: 100px;" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    是否隐藏：
                </th>
                <td>
                    <asp:DropDownList ID="ddlIfshow" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1">是</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    备注：
                </th>
                <td colspan="3">
                    <asp:TextBox ID="txtremark" runat="server" CssClass="txtInput2" TextMode="MultiLine"
                        Style="width: 400px; height: 50px;"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table style="display:none;">
         <tr>
                <th>
                    是否特价：
                </th>
                <td>
                    <asp:DropDownList ID="ddlcIfbargain" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1">是</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <th>
                    特价(元)：
                </th>
                <td>
                    <input id="txtBargain" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    是否积分：
                </th>
                <td>
                    <asp:DropDownList ID="ddljifen" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1">是</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <th>
                    是否打折：
                </th>
                <td>
                    <asp:DropDownList ID="ddlcDiscount" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1">是</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <div class="divgirdbottom">
            <div style="display: none;">
                <asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
