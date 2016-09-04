<%@ Page Language="C#" AutoEventWireup="true" CodeFile="presentchange.aspx.cs"
    Inherits="presentchange" %>

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

    <script src="../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

    <script type="text/javascript">
  
   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        });
         laodd();
    });
    
    function  laodd()
    {
         $.ajax({
                url: "Ajaxpresent.aspx",
                type: "get",
                cache: false,
                success: function(date) {
                 $('#presents').html(date);
                }
                });
    }
    
   
    window.onload = function onlodd() {
        document.getElementById('txtmNum').focus();
    }
     function readmems() {
        var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
        var obj = document.getElementById("txtmNum");
        if (!reg.test(obj.value)) {
            f_alert2('warn', '会员编号格式不正确,请重新输入！');
            $("#txtmNum").val("");
            document.getElementById("txtmNum").focus();

        } else {
            var memid = $("#txtmNum").val();
            $.ajax({
                url: "Ajaxreadmem.aspx?mnum=" + memid + "",
                type: "get",
                cache: false,
                success: function(date) {
                    if (date == "false") {

                        f_alert2('warn', '找不到该会员信息！');
                        $("#txtmNum").val("");
                        document.getElementById("txtmNum").focus();
                        return false;

                    }
                    else{
                        var str = new Array();
                            str = date.split("&");
                             $("#txtlevel").val(str[0]);
                              $("#txtname").val(str[1]);
                               $("#txtBalance").val(str[2]);
                               $("#txtnumm").val(str[3]);
                               
                    }
                }

            })
        }

    }
    


    
  
   

    
   
  function keyLogin(){  
        if (event.keyCode==13)   //回车键的键值为13
        if(document.getElementById("txtmNum").value!="")
        {

         readmems();

        }
        else
        {
          document.getElementById("txtmNum").focus();
        }
    } 
    
     function clears()
    {
        $("#txtmNum").val('');
        $("#txtnumm").val('');
         $("#txtlevel").val('');
         $("#txtname").val('');
          $("#txtBalance").val('');
    } 
    
    
    
    function changeper(gid,gjifen)
    {
        
        var num=$('#txtmNum').val();
        if(num!="")
        {
              $.ligerDialog.confirm('你确定兑换礼品吗？',
            function(type) {
                if (type)
                {
                 var jifen =$('#txtBalance').val();
                var xy = Number(jifen)-Number(gjifen);
                if(xy>=0)
                {
                   $.ajax({
                    url: "Ajaxchange.aspx?mnum=" + num + "&jifen="+gjifen+"&gid="+gid+"",
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "true") {
                            f_alert2('warn', '兑换成功！');
                          
                           laodd();
                              readmems();
                        }
                        else{
                             f_alert2('warn', '兑换失败，请联系管理员！');
                        }
                        }
                        });
                }
                else
                {
                     f_alert2('warn', '积分不够，请选择其他礼品！');
                }
                }else
                {
                    return;
                }
              
            })
           
            
        }
        else{
             f_alert2('warn', '请先读取会员信息！');
        }
    }
   
    </script>

    <style type="text/css">
        #layout1
        {
            padding: 2px;
            margin-top: 3px;
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
    </style>
</head>
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <div class="divall">
        <div class="divgirdtop">
            <img src="../images/ico-show-txt.png" />会员信息
        </div>
        <table class="addedit">
            <tr>
                <th>
                    会员卡/手机：
                </th>
                <td>
                    <input id="txtmNum" type="text" class="txtInput2" onclick="clears();"  style="width: 130px; "
                        runat="server" />
                    <input id="txtnumm" type="text" class="txtInput2" style="width: 130px; display: none;"
                        runat="server" />
                    <input id="Button2" type="button" value="读卡" class=" btnInput" onclick="readmems();" />
                </td>
                <th>
                    会员级别：
                </th>
                <td>
                    <input id="txtlevel" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
            </tr>
            <tr>
                <th>
                    姓名：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
                <th>
                    可用积分：
                </th>
                <td>
                    <input id="txtBalance" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
            </tr>
        </table>
        <div id="layout1">
            <div position="center" id="presents" title="积分礼品兑换" style="padding: 2px;overflow-y: auto; overflow-x: hidden;">

                 
            </div>
        </div>
    </div>
   
    </form>
</body>
</html>
