<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setpwd.aspx.cs" Inherits="setpwd" %>

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
    function checkpwd() {
      $("#notice").html("");
        var x = document.getElementById("txtPassword").value;
        var y = document.getElementById("txtPasswords").value;
        if (x != y) {
           
             $("#notice").html("两次密码不相符,请重新输入！");
            $("#txtPasswords").val("");
            return;
        } else {}
    }
    
    function handlebtn() {
        if($("#txtPasswords").val()!="")
        {   
         document.getElementById("Button2").click();
         window.parent.setok();
//         $(window.parent.document).find("input[id='setpwdd']").click();
//         parent.$.ligerDialog.close(); 
//           f_alert2('warn', '保存成功！');
           }
           else
           {
           $("#notice").html("请输入密码！");
           }
    }

     function closeflash()
    {

            parent.$.ligerDialog.close(); 
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <table class="addedit">
            <tr>
                <th>
                    新密码：
                </th>
                <td>
                    <input id="txtPassword" type="password" class="txtInput2" style="width: 130px;" runat="server" /><span
                        class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    重复密码：
                </th>
                <td>
                    <input id="txtPasswords" type="password" class="txtInput2" style="width: 130px;"
                        onchange="checkpwd();" runat="server" /><span class="spanxing">*</span>
                </td>
            </tr>
        </table>
        <span id="notice" style="color: Red;"></span>
        <div style="display: none;">
            <asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click" />
        </div>
    </div>
    </form>
</body>
</html>
