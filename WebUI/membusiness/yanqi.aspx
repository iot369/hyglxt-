<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yanqi.aspx.cs" Inherits="yanqi" %>

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
         document.getElementById("Button2").click();
         window.parent.yanqi();
    }

     function closeflash()
    {
            parent.$.ligerDialog.close(); 
    }
    
 
        
        //有效期判断
        function datepast()
        {
            var type = $('#ddlpast').val();
             $.ajax({
                    url:"selectdate.aspx?type="+type+"",
                    type: "get",
                    cache: false,
                    success: function(date) {
                        $('#txtpastdate').val(date);
                    }
             });
        }
        </script>

        <script type="text/javascript">
    $(function() {
         $("#txtpastdate").ligerDateEditor({
            label: '',
            labelWidth: 120,
            labelAlign: 'right',
            initValue: ''
        });
    });
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <table class="addedit">
            <tr>
                <th>
                    会员卡号：
                </th>
                <td>
                    <input id="txtnum" type="text" disabled="disabled" class="txtInput2" style="width: 110px;"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    选择：
                </th>
                <td>
                    <select id="ddlpast" class="select2" onchange="datepast();">
                        <option value="100">永久有效</option>
                        <option value="30">一月</option>
                        <option value="90">三月</option>
                        <option value="180">半年</option>
                        <option value="1">一年</option>
                        <option value="3">三年</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    有效期：
                </th>
                <td>
                    <input id="txtpastdate" type="text" runat="server" />
                </td>
            </tr>
        </table>
        <span id="notice" style="color: Red;"></span>
        <div style="display: none;">
            <asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click" />
        </div>
        <div id="pastdates" style="width: 260px; margin: 3px; display: none; height: 50px;">
            <fieldset align="middle" class="FieldSet" style="width: 240px; height: 100px; margin-left: 10px;
                text-align: center; float: left; padding-top: 10px;">
                <legend><font color="#0000ff">选择有效期</font></legend>
                <div style="margin-top: 15px; color: Black;">
                </div>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
