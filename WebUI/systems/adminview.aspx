<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminview.aspx.cs" Inherits="adminview" %>

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
  function checkmemnum() {
        var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
        var obj = document.getElementById("txtnum");
        if (!reg.test(obj.value)) {
            f_alert2('warn', '用户工号格式不正确,请重新输入！');
            $("#txtnum").val("");

        } else {
            var num = $("#txtnum").val();
            $.ajax({
                url: "Ajaxchecknum.aspx?anum=" + num + "",
                type: "get",
                cache: false,
                success: function(date) {
                    if (date == "false") {

                       f_alert2('warn', '用户工号已存在，请重新录入！');
                        $("#txtnum").val("");
                        return;

                    }
                }

            })
        }

    }
    
     function checkuser() {
       
            var auser = $("#txtusername").val();
        var url="auser=" + auser + ""; 
            url=encodeURI(encodeURI(url)); 
            $.ajax({
                url: "Ajaxcheckuser.aspx?"+url+"",
                type: "get",
                cache: false,
                success: function(date) {
                    if (date == "false") {

                       f_alert2('warn', '用户登录帐号已存在，请重新录入！');
                        $("#txtusername").val("");
                        return;

                    }
                }

            })
    }


   
  

    function addmem() {
        if ($("#txtnum").val()!=""&&$("#ddlrole").val()!="NONE"&&$("#txtname").val()!=""&&$("#ddlshop").val()!="NONE") 
        {
            $.ligerDialog.confirm('你确定要用户信息吗',
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
            <img src="../images/ico-show-txt.png" />编辑用户
        </div>
        <table class="addedit">
            <tr>
                <th>
                    工号：
                </th>
                <td>
                    <input id="txtnum" type="text" class="txtInput2" style="width: 100px;" disabled="disabled"
                        onchange="checkmemnum();" runat="server" /><span class="spanxing">*</span>
                </td>
                <th>
                    姓名：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 100px;" runat="server" /><span
                        class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    登录帐号：
                </th>
                <td>
                    <input id="txtusername" type="text" class="txtInput2" style="width: 100px;" runat="server"   onchange="checkuser();"/><span
                        class="spanxing">*</span>
                </td>
                <th>
                    角色权限：
                </th>
                <td>
                    <asp:DropDownList ID="ddlrole" runat="server" Style="width: 108px;" CssClass="select">
                    </asp:DropDownList>
                    <span class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    性别：
                </th>
                <td>
                    <asp:DropDownList ID="ddlsex" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <th>
                    联系电话：
                </th>
                <td>
                    <input id="txtphone" type="text" class="txtInput2" style="width: 100px;" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    所属店铺：
                </th>
                <td>
                    <asp:DropDownList ID="ddlshop" runat="server" Style="width: 108px;" CssClass="select">
                    </asp:DropDownList>
                    <span class="spanxing">*</span>
                </td>
                <th>
                    所属部门：
                </th>
                <td>
                    <asp:DropDownList ID="ddldepartment" runat="server" Style="width: 108px;" CssClass="select">
                    </asp:DropDownList>
                    <span class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    是否启用：
                </th>
                <td colspan="3">
                    <asp:DropDownList ID="ddlifuser" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:DropDownList>
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
