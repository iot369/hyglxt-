<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mnumchange.aspx.cs" Inherits="mnumchange" %>

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
    
    function handlebtn() {
    var nums =$("#txtnnum").val();
        if(nums!="")
        {
         document.getElementById("Button2").click();
         window.parent.change(nums);
         }
         else
         {
         window.parent.notice('3');
         }
    }

     function closeflash()
    {
            parent.$.ligerDialog.close(); 
    }
    
    function checkmemnum() {
        var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
        var obj = document.getElementById("txtnnum");
        if (!reg.test(obj.value)) {
             window.parent.notice('1');
            $("#txtnnum").val("");

        } else {
            var memid = $("#txtnnum").val();
            $.ajax({
                url: "../members/Ajaxcheckmnum.aspx?mnum=" + memid + "",
                type: "get",
                cache: false,
                success: function(date) {
                    if (date == "false") {

                        window.parent.notice('2');
                        $("#txtnnum").val("");
                        return;

                    }
                }

            })
        }

    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <table class="addedit">
            <tr>
                <th>
                    旧会员卡号：
                </th>
                <td>
                    <input id="txtnum" type="text" class="txtInput2" style="width: 130px;" runat="server" /><span
                        class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    新会员卡号：
                </th>
                <td>
                    <input id="txtnnum" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        onchange="checkmemnum();" /><span class="spanxing">*</span>
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
