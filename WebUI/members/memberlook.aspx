<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberlook.aspx.cs" Inherits="memberlook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>div print</title>
    <object id="factory" style="display: none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
        codebase="smsx.cab" viewastext>
    </object>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
        <link href="../../images/style.css" rel="stylesheet" type="text/css" />
        <link href="../../css/forms.css" rel="stylesheet" type="text/css" />
        <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

        <script src="../../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

        <script src="../../js/Public.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

        <script type="text/javascript">
    var manager = null;
    $(function() {
        loadcard();
    });

        function loadcard()//读卡
        {
           $.ligerDialog.open({ target: $("#target1"),width:300,height:180,isHidden:true });
           document.getElementById("txtpwd").focus();
        }
         
        function postDate()//加载会员信息
        {
            var txtmNum= $("#txtpwd").val();
            $.ajax({
                    url:"Ajaxmnumview.aspx?mnum="+txtmNum,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        var xx = new Array();
                            xx = date.split('&');
                            
                        if(xx[0]=="OK")
                        {
                            var url= "memberlooks.aspx?str="+Math.random()+"&mnum="+xx[1]+""; 
                                url=encodeURI(encodeURI(url));
                                $('#iframetu').attr('src',url);
                                $.ligerDialog.hide({ target: $("#target1") });
                        }
                        else
                        {
                             f_alert2('warn', '会员卡不存在，请重新录入！');
                             clear();
                        }
                    }
                });
        }
       
        function keyLogin(){  
        if (event.keyCode==13)   //回车键的键值为13
        if(document.getElementById("txtpwd").value!="")
        {
         postDate();
        }
        else
        {
          document.getElementById("txtpwd").focus();
        }
    } 

    function clear()
    {
        $('#txtpwd').val("");
        document.getElementById("txtpwd").focus();
    }


 
        </script>

        <style type="text/css">
            #layout1
            {
                padding: 2px;
            }
            .l-page-bottom, .l-page-top
            {
                height: 80px;
                background: #f8f8f8;
                margin-bottom: 3px;
            }
            h4
            {
                margin: 20px;
            }
            .detail
            {
                color: #000000;
                font-size: 12px;
                background-color: #ffffff;
                border: none;
                width: 95%;
            }
        </style>
</head>
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <div class="divall" id="alll">
        <iframe id="iframetu" frameborder="0" src="" width="100%" height="440px;"></iframe>
        <!--读卡-->
        <div id="target1" style="width: 260px; margin: 3px; display: none; height: 120px;">
            <fieldset align="middle" class="FieldSet" style="width: 240px; height: 120px; margin-left: 10px;
                text-align: center; float: left; padding-top: 10px;">
                <legend><font color="#0000ff">输入卡号/手机号</font></legend>
                <div style="margin-top: 15px; color: Black;">
                    <table>
                        <tr>
                            <td>
                                卡号/手机号:
                                <input id="txtpwd" type="text" class="txtInput2" style="width: 130px;" runat="server"
                                    onclick="clear();" />
                                <br />
                                <span id="show" style="font-size: 12px; color: Red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <input id="Button4" type="button" value="确 认" class=" btnSearch" onclick="postDate();" />
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </div>
        <!--读卡结束-->
    </div>
    </form>
</body>
</html>
