<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopsadd.aspx.cs" Inherits="shopsadd" %>

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
 
    window.onload = function addresss() {
        var xxa = $("#cmbProvince").val() + "," + $("#cmbCity").val() + "," + $("#cmbArea").val();
        $("#txtadd").val(xxa);
    }
  

    function addmem() {
        if ($("#txtname").val()!=""&&$("#ddltype").val()!="NONE"&&$("#txtcontact").val()!=""&&$("#txtmobile").val()!="") 
        {
            $.ligerDialog.confirm('你确定要保存店铺信息吗',
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
            <img src="../images/ico-show-txt.png" />登记店铺信息
        </div>
        <table class="addedit">
            <tr>
                <th>
                    店面名称：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 130px;" onchange="checkmemnum();"
                        runat="server" /><span class="spanxing">*</span>
                </td>
                <th>
                    店铺类型：
                </th>
                <td>
                    <asp:DropDownList ID="ddltype" runat="server" Style="width: 138px;" CssClass="select">
                    </asp:DropDownList>
                    <span class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    联系人：
                </th>
                <td>
                    <input id="txtcontact" type="text" class="txtInput2" style="width: 130px;" onchange="checkmemnum();"
                        runat="server" /><span class="spanxing">*</span>
                </td>
                <th>
                    联系电话：
                </th>
                <td>
                    <input id="txtmobile" type="text" class="txtInput2" style="width: 130px;" onchange="checkmemnum();"
                        runat="server" /><span class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    所在省市：
                </th>
                <td colspan="3">
                    <select id="cmbProvince" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                    </select>&nbsp;省
                    <select id="cmbCity" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                    </select>&nbsp;市
                    <select id="cmbArea" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                    </select>&nbsp;(镇/区)<input id="txtadd" type="text" style="display: none;" runat="server" />

                    <script type="text/javascript">
	addressInit('cmbProvince', 'cmbCity', 'cmbArea', '广东', '东莞市', '东城区');
	
                    </script>

                </td>
            </tr>
            <tr>
                <th>
                    详细地址：
                </th>
                <td colspan="3">
                    <input id="txtaddress" type="text" class="txtInput2" style="width: 450px;" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    备注：
                </th>
                <td colspan="3">
                    <asp:TextBox ID="txtremark" runat="server" CssClass="txtInput2" TextMode="MultiLine"
                        Style="width: 450px; height: 50px;"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="divgirdbottom">
            <div style="display: none;">
            <asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click"  />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
