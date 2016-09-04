<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recharge.aspx.cs" Inherits="recharge" %>

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
                url: "AjaxReadMems.aspx?mnum=" + memid + "",
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
    
    function heji()
    {
         var heji = Number($("#txtchong").val()) + Number($("#txtgive").val());
         $("#txtheji").val(heji.toFixed(2));
    }
    
    function checknum()
    {
         var reg = new RegExp("^[0-9]+(.[0-9]{1,3})?$");
        var obj = document.getElementById("txtchong");
        if (!reg.test(obj.value)) {
          $("#chong").html("输入金额的格式不正确！");
        

        }
        else
        {
              $("#chong").html("元");
        }
    }
    
     function checknums()
    {
         var reg = new RegExp("^[0-9]+(.[0-9]{1,3})?$");
        var obj = document.getElementById("txtgive");
        if (!reg.test(obj.value)) {
          $("#give").html("输入金额的格式不正确！");
        

        }
        else
        {
              $("#give").html("元");
        }
    }
    function chong()
    {
        var chong = $("#txtchong").val();
        var give = $("#txtgive").val();
        var heji = $("#txtheji").val();
        var mnum = $("#txtnumm").val();
        var remark = $("#txtremark").val();
        var name = $("#txtname").val();
        var url="mnum=" + mnum + "&remark=" + remark + "&chong=" + chong + "&give=" + give + "&heji=" + heji + "&name=" + name + ""; 
            url=encodeURI(encodeURI(url)); 
        if(mnum!="")
        {
        var mes ="你确定要给会员："+ $("#txtname").val()+",<br/>充值"+heji+"元吗？";
         $.ligerDialog.confirm(''+mes+'',
            function(type) {
            
                if (type) $.ajax({
                    url: "AjaxChongzhi.aspx?"+url+"",
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "false") {
                            f_alert2('warn', '充值失败，请联系管理人员！');
                            return false;

                        }
                        else{
                            f_alert2('warn', '充值成功！');
                            readmems();
                            clear();
                                   
                        }
                    }
                })
 
            });
            
            }
            else
            {
                f_alert2('warn', '请先读取会员信息！');
            }
    }
    
    function clear()
    {
        $('#txtchong').val('0');
        $('#txtgive').val('0');
        $('#txtheji').val('0');
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
   
    </script>

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
                    <input id="txtmNum" type="text" class="txtInput2"   onclick="clears();" style="width: 130px;" runat="server" />
                         <input id="txtnumm" type="text" class="txtInput2"  style="width: 130px; display:none;" runat="server"/>
                 <input id="Button2"  type="button" value="读卡" class=" btnInput" onclick="readmems();"  />

                    
          
                    
                </td>
                <th>
                    会员级别：
                </th>
                <td>
                    <input id="txtlevel" type="text" class="txtInput2" style="width: 130px;" runat="server" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <th>
                    姓名：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 130px;" runat="server" readonly="readonly" />
                </td>
                <th>
                    可用金额：
                </th>
                <td>
                    <input id="txtBalance" type="text" class="txtInput2" style="width: 130px;" runat="server" readonly="readonly" />
                </td>
            </tr>
        </table>
        <div class="divgirdtop" style="margin-top: 5px;">
            <img src="../images/ico-show-txt.png" />快速充值
        </div>
        <table class="addedit">
            <tr>
                <th>
                    充值金额：
                </th>
                <td style=" vertical-align:middle; height:40px;">
                    <input id="txtchong" type="text" class="txtInput2" style="width: 120px; height: 30px;
                        font-size: 28px; color: #FF0000; font-family: 微软雅黑; line-height: 30px;" runat="server"
                        value="0" onchange="heji();"  onkeyup="checknum();" /><span style="font-size: 22px; color: #FF0000; font-family: 微软雅黑; padding-left:10px; "
                            id="chong">元</span>
                </td>
            </tr>
            <tr>
                <th>
                    赠送金额：
                </th>
                <td style=" vertical-align:middle; height:40px;">
                    <input id="txtgive" type="text" class="txtInput2" style="width: 120px; height: 30px;
                        font-size: 28px; color: #FF0000; font-family: 微软雅黑; line-height: 30px;" runat="server"
                        value="0" onchange="heji();"  onkeyup="checknums();"/><span style="font-size: 22px; color: #FF0000; font-family: 微软雅黑; padding-left:10px;"
                            id="give">元</span>
                </td>
            </tr>
            <tr>
                <th>
                    合计：
                </th>
                <td style=" vertical-align:middle; height:40px;">
                    <input id="txtheji" type="text" class="txtInput2" style="width: 120px; height: 30px;
                        font-size: 28px; color: #FF0000; font-family: 微软雅黑; line-height: 30px;" runat="server"
                        value="0.00" readonly="readonly" /><span style="font-size: 22px; color: #FF0000; font-family: 微软雅黑; padding-left:10px; "
                            id="Span2">元</span>
                </td>
            </tr>
            
             <tr>
                <th>
                    备注：
                </th>
                <td style=" vertical-align:middle; height:40px;">
                    <textarea id="txtremark" cols="20" rows="2" style="width:90%; height:50px;" class="txtInput2"></textarea>
                </td>
            </tr>
        </table>
        <div class="divgirdbottom">
            <input id="Button1" type="button" value="充 值" class=" btnSubmit" onclick="chong();"  />
        </div>
    </div>
    </form>
</body>
</html>
